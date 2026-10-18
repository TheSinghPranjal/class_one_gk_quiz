import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/question.dart';

part 'quiz_state.freezed.dart';

enum QuizMode { practice, quiz, bookOnly, mix, daily }

enum QuizAnswerStatus { answering, correct, wrong, finished }

const int kSecondsPerQuestion = 30;

@freezed
abstract class QuizState with _$QuizState {
  const factory QuizState({
    required QuizMode mode,
    required List<ShuffledQuestion> questions,
    @Default(0) int currentIndex,
    int? selectedIndex,
    @Default(QuizAnswerStatus.answering) QuizAnswerStatus status,
    @Default(<int>{}) Set<int> eliminatedOptions,
    @Default(false) bool hintUsedForQuestion,
    @Default(0) int score,
    @Default(<String>[]) List<String> wrongQuestionIds,
    int? secondsLeft,
    @Default(<String>[]) List<String> newlyUnlockedBadges,
  }) = _QuizState;

  const QuizState._();

  ShuffledQuestion? get currentQuestion =>
      currentIndex < questions.length ? questions[currentIndex] : null;

  bool get isLastQuestion => currentIndex >= questions.length - 1;

  bool get isTimed => mode == QuizMode.quiz;

  bool get hintsAllowed => mode == QuizMode.practice || mode == QuizMode.quiz;
}
