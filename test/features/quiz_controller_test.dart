import 'package:class_one_gk_quiz/core/services/storage_service.dart';
import 'package:class_one_gk_quiz/features/quiz/data/models/question.dart';
import 'package:class_one_gk_quiz/features/quiz/data/question_repository.dart';
import 'package:class_one_gk_quiz/features/quiz/providers/questions_providers.dart';
import 'package:class_one_gk_quiz/features/quiz/providers/quiz_controller.dart';
import 'package:class_one_gk_quiz/features/quiz/providers/quiz_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Question> _fakeQuestions() => List.generate(
      12,
      (i) => Question(
        id: 'animals-${i.toString().padLeft(3, '0')}',
        sectionId: 'animals',
        question: 'Question number $i?',
        options: const ['Right', 'Wrong A', 'Wrong B', 'Wrong C'],
        correctIndex: 0,
        funFact: 'Fact $i',
        difficulty: 1,
        source: QuestionSource.generated,
      ),
    );

class _FakeQuestionRepository extends QuestionRepository {
  _FakeQuestionRepository(this._questions);
  final List<Question> _questions;

  @override
  Future<List<Question>> loadAll() async => _questions;
}

Future<ProviderContainer> _makeContainer() async {
  SharedPreferences.setMockInitialValues({});
  final prefs = await SharedPreferences.getInstance();
  final container = ProviderContainer(
    overrides: [
      hiveStorageProvider.overrideWithValue(HiveStorageService.inMemory()),
      sharedPreferencesProvider.overrideWithValue(prefs),
      questionRepositoryProvider.overrideWithValue(
        _FakeQuestionRepository(_fakeQuestions()),
      ),
    ],
  );
  addTearDown(container.dispose);
  return container;
}

void main() {
  group('QuizController', () {
    test('start loads shuffled questions for the section', () async {
      final container = await _makeContainer();
      final controller = container.read(quizControllerProvider.notifier);

      await controller.start('animals', QuizMode.practice);
      final state = container.read(quizControllerProvider);

      expect(state.questions, isNotEmpty);
      expect(state.status, QuizAnswerStatus.answering);
      expect(state.currentIndex, 0);
    });

    test('selecting the correct option increases the score', () async {
      final container = await _makeContainer();
      final controller = container.read(quizControllerProvider.notifier);
      await controller.start('animals', QuizMode.quiz);

      final question = container.read(quizControllerProvider).currentQuestion!;
      controller.selectOption(question.correctIndex);

      final state = container.read(quizControllerProvider);
      expect(state.status, QuizAnswerStatus.correct);
      expect(state.score, 1);
    });

    test('practice mode lets the child retry after a wrong answer', () async {
      final container = await _makeContainer();
      final controller = container.read(quizControllerProvider.notifier);
      await controller.start('animals', QuizMode.practice);

      final question = container.read(quizControllerProvider).currentQuestion!;
      final wrongIndex = (question.correctIndex + 1) % 4;
      controller.selectOption(wrongIndex);

      final state = container.read(quizControllerProvider);
      // Still answering (can try again), but the wrong option is eliminated.
      expect(state.status, QuizAnswerStatus.answering);
      expect(state.eliminatedOptions, contains(wrongIndex));
    });

    test('quiz mode reveals the correct answer after a wrong pick', () async {
      final container = await _makeContainer();
      final controller = container.read(quizControllerProvider.notifier);
      await controller.start('animals', QuizMode.quiz);

      final question = container.read(quizControllerProvider).currentQuestion!;
      final wrongIndex = (question.correctIndex + 1) % 4;
      controller.selectOption(wrongIndex);

      final state = container.read(quizControllerProvider);
      expect(state.status, QuizAnswerStatus.wrong);
      expect(state.wrongQuestionIds, contains(question.question.id));
    });

    test('finishes after the last question and records a score', () async {
      final container = await _makeContainer();
      final controller = container.read(quizControllerProvider.notifier);
      await controller.start('animals', QuizMode.practice);

      var state = container.read(quizControllerProvider);
      final total = state.questions.length;
      for (var i = 0; i < total; i++) {
        state = container.read(quizControllerProvider);
        final q = state.currentQuestion!;
        controller.selectOption(q.correctIndex);
        controller.next();
      }

      final finalState = container.read(quizControllerProvider);
      expect(finalState.status, QuizAnswerStatus.finished);
      expect(finalState.score, total);
    });

    test('useHint eliminates exactly two wrong options once', () async {
      final container = await _makeContainer();
      final controller = container.read(quizControllerProvider.notifier);
      await controller.start('animals', QuizMode.quiz);

      controller.useHint();
      final state = container.read(quizControllerProvider);
      expect(state.eliminatedOptions.length, 2);
      expect(state.eliminatedOptions, isNot(contains(state.currentQuestion!.correctIndex)));

      controller.useHint();
      final stateAfterSecondCall = container.read(quizControllerProvider);
      expect(stateAfterSecondCall.eliminatedOptions.length, 2);
    });
  });
}
