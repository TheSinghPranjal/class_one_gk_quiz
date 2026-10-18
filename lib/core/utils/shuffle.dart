import 'dart:math';

import '../../features/quiz/data/models/question.dart';

/// Shuffles a [Question]'s options and returns a [ShuffledQuestion] with the
/// correct index recomputed for the new order.
ShuffledQuestion shuffleQuestion(Question question, [Random? random]) {
  final rng = random ?? Random();
  final indices = List<int>.generate(question.options.length, (i) => i);
  indices.shuffle(rng);

  final shuffledOptions = [for (final i in indices) question.options[i]];
  List<String>? shuffledEmojis;
  final emojis = question.optionEmojis;
  if (emojis != null && emojis.length == question.options.length) {
    shuffledEmojis = [for (final i in indices) emojis[i]];
  }
  final newCorrectIndex = indices.indexOf(question.correctIndex);

  return ShuffledQuestion(
    question: question,
    shuffledOptions: shuffledOptions,
    shuffledOptionEmojis: shuffledEmojis,
    correctIndex: newCorrectIndex,
  );
}
