import 'dart:math';

import 'package:class_one_gk_quiz/core/utils/shuffle.dart';
import 'package:class_one_gk_quiz/features/quiz/data/models/question.dart';
import 'package:flutter_test/flutter_test.dart';

Question _question() => const Question(
      id: 'q1',
      sectionId: 'animals',
      question: 'Which animal says moo?',
      options: ['Cow', 'Dog', 'Cat', 'Duck'],
      correctIndex: 0,
      funFact: 'Cows say moo.',
      difficulty: 1,
      source: QuestionSource.generated,
    );

void main() {
  group('shuffleQuestion', () {
    test('keeps the same set of options', () {
      final q = _question();
      final shuffled = shuffleQuestion(q, Random(42));
      expect(shuffled.shuffledOptions.toSet(), q.options.toSet());
      expect(shuffled.shuffledOptions.length, 4);
    });

    test('the answer at the new correct index is still correct', () {
      final q = _question();
      for (var seed = 0; seed < 20; seed++) {
        final shuffled = shuffleQuestion(q, Random(seed));
        expect(
          shuffled.shuffledOptions[shuffled.correctIndex],
          q.options[q.correctIndex],
        );
      }
    });

    test('correctIndex stays within bounds', () {
      final q = _question();
      final shuffled = shuffleQuestion(q, Random(7));
      expect(shuffled.correctIndex, inInclusiveRange(0, 3));
    });
  });
}
