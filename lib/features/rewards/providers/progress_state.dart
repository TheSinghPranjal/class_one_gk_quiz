import 'package:freezed_annotation/freezed_annotation.dart';

part 'progress_state.freezed.dart';
part 'progress_state.g.dart';

@freezed
abstract class SectionProgress with _$SectionProgress {
  const factory SectionProgress({
    @Default(<String>{}) Set<String> masteredQuestionIds,
    @Default(0) int correctCount,
    @Default(0) int attemptCount,
    @Default(0) int bestStars,
  }) = _SectionProgress;

  factory SectionProgress.fromJson(Map<String, dynamic> json) =>
      _$SectionProgressFromJson(json);
}

@freezed
abstract class WrongAnswerEntry with _$WrongAnswerEntry {
  const factory WrongAnswerEntry({
    required String questionId,
    required String sectionId,
    @Default(0) int timesWrong,
  }) = _WrongAnswerEntry;

  factory WrongAnswerEntry.fromJson(Map<String, dynamic> json) =>
      _$WrongAnswerEntryFromJson(json);
}

@freezed
abstract class ProgressData with _$ProgressData {
  const factory ProgressData({
    @Default(<String, SectionProgress>{})
    Map<String, SectionProgress> bySection,
    @Default(<String, WrongAnswerEntry>{})
    Map<String, WrongAnswerEntry> wrongAnswers,
  }) = _ProgressData;

  const ProgressData._();

  factory ProgressData.fromJson(Map<String, dynamic> json) =>
      _$ProgressDataFromJson(json);

  SectionProgress progressFor(String sectionId) =>
      bySection[sectionId] ?? const SectionProgress();

  int get totalMastered =>
      bySection.values.fold(0, (sum, p) => sum + p.masteredQuestionIds.length);

  double accuracyFor(String sectionId) {
    final p = progressFor(sectionId);
    if (p.attemptCount == 0) return 0;
    return p.correctCount / p.attemptCount;
  }

  List<WrongAnswerEntry> get mostMissed {
    final list = wrongAnswers.values.toList()
      ..sort((a, b) => b.timesWrong.compareTo(a.timesWrong));
    return list;
  }
}
