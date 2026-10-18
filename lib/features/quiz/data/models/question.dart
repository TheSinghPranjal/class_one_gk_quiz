import 'package:freezed_annotation/freezed_annotation.dart';

part 'question.freezed.dart';
part 'question.g.dart';

enum QuestionSource {
  @JsonValue('book')
  book,
  @JsonValue('generated')
  generated,
}

@freezed
abstract class Question with _$Question {
  const factory Question({
    required String id,
    required String sectionId,
    required String question,
    String? emoji,
    required List<String> options,
    List<String>? optionEmojis,
    required int correctIndex,
    required String funFact,
    required int difficulty,
    required QuestionSource source,
    int? page,
  }) = _Question;

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);
}

/// A [Question] whose options have been shuffled for a live quiz session,
/// keeping track of the new position of the correct answer.
@freezed
abstract class ShuffledQuestion with _$ShuffledQuestion {
  const factory ShuffledQuestion({
    required Question question,
    required List<String> shuffledOptions,
    List<String>? shuffledOptionEmojis,
    required int correctIndex,
  }) = _ShuffledQuestion;
}
