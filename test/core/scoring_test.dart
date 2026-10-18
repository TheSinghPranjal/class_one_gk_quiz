import 'package:class_one_gk_quiz/core/utils/scoring.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('starsForScore', () {
    test('0 correct gives 0 stars', () {
      expect(starsForScore(0, 10), 0);
    });

    test('90% or more gives 3 stars', () {
      expect(starsForScore(9, 10), 3);
      expect(starsForScore(10, 10), 3);
    });

    test('60% to 89% gives 2 stars', () {
      expect(starsForScore(6, 10), 2);
      expect(starsForScore(8, 10), 2);
    });

    test('any correct answer below 60% gives 1 star', () {
      expect(starsForScore(1, 10), 1);
      expect(starsForScore(5, 10), 1);
    });

    test('zero total questions never throws and gives 0 stars', () {
      expect(starsForScore(0, 0), 0);
    });
  });
}
