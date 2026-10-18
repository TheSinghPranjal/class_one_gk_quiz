import 'dart:async';
import 'dart:math';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utils/scoring.dart';
import '../../../core/utils/shuffle.dart';
import '../../rewards/providers/progress_provider.dart';
import '../../rewards/providers/rewards_provider.dart';
import '../../rewards/providers/rewards_state.dart';
import '../data/models/question.dart';
import 'questions_providers.dart';
import 'quiz_state.dart';

part 'quiz_controller.g.dart';

@riverpod
class QuizController extends _$QuizController {
  Timer? _timer;
  String? _sectionId;
  final _random = Random();

  @override
  QuizState build() {
    ref.onDispose(() {
      _timer?.cancel();
    });
    return const QuizState(mode: QuizMode.practice, questions: []);
  }

  String? get sectionId => _sectionId;

  Future<void> start(String sectionId, QuizMode mode) async {
    _timer?.cancel();
    _sectionId = sectionId;

    List<Question> pool;
    switch (mode) {
      case QuizMode.bookOnly:
        pool = await ref.read(
          questionsBySectionBookOnlyProvider(sectionId).future,
        );
      case QuizMode.mix:
        pool = [...await ref.read(allQuestionsProvider.future)]
          ..shuffle(_random);
      case QuizMode.daily:
        pool = await ref.read(dailyChallengeProvider.future);
      case QuizMode.practice:
      case QuizMode.quiz:
        pool = [...await ref.read(questionsBySectionProvider(sectionId).future)]
          ..shuffle(_random);
    }

    final count = switch (mode) {
      QuizMode.bookOnly => pool.length,
      QuizMode.daily => pool.length,
      QuizMode.quiz => min(10, pool.length),
      QuizMode.practice => min(10, pool.length),
      QuizMode.mix => min(10, pool.length),
    };

    final selected = pool.take(count).toList();
    final shuffled = [for (final q in selected) shuffleQuestion(q, _random)];

    state = QuizState(
      mode: mode,
      questions: shuffled,
      secondsLeft: mode == QuizMode.quiz ? kSecondsPerQuestion : null,
    );

    if (mode == QuizMode.quiz) _startTimer();
  }

  /// Starts a quiz made only of the given question ids, e.g. for "Try
  /// Mistakes" on the results screen.
  Future<void> startSpecificQuestions(
    List<String> questionIds,
    QuizMode mode, {
    required String sectionId,
  }) async {
    _timer?.cancel();
    _sectionId = sectionId;

    final all = await ref.read(allQuestionsProvider.future);
    final byId = {for (final q in all) q.id: q};
    final selected = [
      for (final id in questionIds)
        if (byId[id] != null) byId[id]!,
    ];
    final shuffled = [for (final q in selected) shuffleQuestion(q, _random)];

    state = QuizState(
      mode: mode,
      questions: shuffled,
      secondsLeft: mode == QuizMode.quiz ? kSecondsPerQuestion : null,
    );
    if (mode == QuizMode.quiz) _startTimer();
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (_) => tick());
  }

  void tick() {
    final secondsLeft = state.secondsLeft;
    if (secondsLeft == null || state.status != QuizAnswerStatus.answering) {
      return;
    }
    if (secondsLeft <= 1) {
      state = state.copyWith(secondsLeft: 0);
      _timeUp();
    } else {
      state = state.copyWith(secondsLeft: secondsLeft - 1);
    }
  }

  void _timeUp() {
    final q = state.currentQuestion;
    if (q == null) return;
    _timer?.cancel();
    state = state.copyWith(
      status: QuizAnswerStatus.wrong,
      wrongQuestionIds: [...state.wrongQuestionIds, q.question.id],
    );
    final section = _sectionId;
    if (section != null) {
      ref
          .read(progressProvider.notifier)
          .recordAnswer(
            sectionId: section,
            questionId: q.question.id,
            correct: false,
          );
    }
  }

  void selectOption(int index) {
    final q = state.currentQuestion;
    if (q == null || state.status != QuizAnswerStatus.answering) return;

    final correct = index == q.correctIndex;
    final section = _sectionId;

    if (correct) {
      _timer?.cancel();
      state = state.copyWith(
        selectedIndex: index,
        status: QuizAnswerStatus.correct,
        score: state.score + 1,
      );
      if (section != null) {
        ref
            .read(progressProvider.notifier)
            .recordAnswer(
              sectionId: section,
              questionId: q.question.id,
              correct: true,
            );
      }
      return;
    }

    if (state.mode == QuizMode.practice) {
      // Let the child try again: eliminate the wrong option, stay answering.
      state = state.copyWith(
        selectedIndex: index,
        eliminatedOptions: {...state.eliminatedOptions, index},
      );
      return;
    }

    _timer?.cancel();
    state = state.copyWith(
      selectedIndex: index,
      status: QuizAnswerStatus.wrong,
      wrongQuestionIds: [...state.wrongQuestionIds, q.question.id],
    );
    if (section != null) {
      ref
          .read(progressProvider.notifier)
          .recordAnswer(
            sectionId: section,
            questionId: q.question.id,
            correct: false,
          );
    }
  }

  void useHint() {
    final q = state.currentQuestion;
    if (q == null || !state.hintsAllowed || state.hintUsedForQuestion) return;

    final wrongIndices = [
      for (var i = 0; i < q.shuffledOptions.length; i++)
        if (i != q.correctIndex && !state.eliminatedOptions.contains(i)) i,
    ]..shuffle(_random);

    final toEliminate = wrongIndices.take(2);
    state = state.copyWith(
      hintUsedForQuestion: true,
      eliminatedOptions: {...state.eliminatedOptions, ...toEliminate},
    );
  }

  void next() {
    if (state.isLastQuestion) {
      _finish();
      return;
    }
    state = state.copyWith(
      currentIndex: state.currentIndex + 1,
      selectedIndex: null,
      status: QuizAnswerStatus.answering,
      eliminatedOptions: {},
      hintUsedForQuestion: false,
      secondsLeft: state.isTimed ? kSecondsPerQuestion : null,
    );
    if (state.isTimed) _startTimer();
  }

  void _finish() {
    _timer?.cancel();

    final section = _sectionId;
    if (section == null || state.questions.isEmpty) {
      state = state.copyWith(status: QuizAnswerStatus.finished);
      return;
    }

    final rewardsNotifier = ref.read(rewardsProvider.notifier);
    final beforeBadges = ref.read(rewardsProvider).badges;

    final stars = starsForScore(state.score, state.questions.length);
    final perfect = state.score == state.questions.length;

    ref.read(progressProvider.notifier).recordQuizStars(section, stars);
    rewardsNotifier.addStars(stars);
    rewardsNotifier.markPlayedToday();
    rewardsNotifier.unlockBadge(BadgeIds.firstQuiz);
    if (perfect && section == 'animals') {
      rewardsNotifier.unlockBadge(BadgeIds.animalExpert);
    }
    if (perfect && state.mode == QuizMode.bookOnly) {
      rewardsNotifier.unlockBadge(BadgeIds.bookMaster);
    }
    if (perfect && state.mode == QuizMode.quiz) {
      rewardsNotifier.unlockBadge(BadgeIds.speedStar);
    }

    final afterBadges = ref.read(rewardsProvider).badges;
    final newlyUnlocked = afterBadges.difference(beforeBadges).toList();

    state = state.copyWith(
      status: QuizAnswerStatus.finished,
      newlyUnlockedBadges: newlyUnlocked,
    );
  }

  Future<void> retryMistakes() async {
    final all = state.questions;
    final wrongIds = state.wrongQuestionIds.toSet();
    final mistakeQuestions = [
      for (final sq in all)
        if (wrongIds.contains(sq.question.id)) sq.question,
    ];
    if (mistakeQuestions.isEmpty) return;

    final shuffled = [
      for (final q in mistakeQuestions) shuffleQuestion(q, _random),
    ];
    state = QuizState(
      mode: state.mode,
      questions: shuffled,
      secondsLeft: state.mode == QuizMode.quiz ? kSecondsPerQuestion : null,
    );
    if (state.mode == QuizMode.quiz) _startTimer();
  }
}
