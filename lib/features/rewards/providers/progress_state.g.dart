// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SectionProgress _$SectionProgressFromJson(Map<String, dynamic> json) =>
    _SectionProgress(
      masteredQuestionIds:
          (json['masteredQuestionIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toSet() ??
          const <String>{},
      correctCount: (json['correctCount'] as num?)?.toInt() ?? 0,
      attemptCount: (json['attemptCount'] as num?)?.toInt() ?? 0,
      bestStars: (json['bestStars'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$SectionProgressToJson(_SectionProgress instance) =>
    <String, dynamic>{
      'masteredQuestionIds': instance.masteredQuestionIds.toList(),
      'correctCount': instance.correctCount,
      'attemptCount': instance.attemptCount,
      'bestStars': instance.bestStars,
    };

_WrongAnswerEntry _$WrongAnswerEntryFromJson(Map<String, dynamic> json) =>
    _WrongAnswerEntry(
      questionId: json['questionId'] as String,
      sectionId: json['sectionId'] as String,
      timesWrong: (json['timesWrong'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$WrongAnswerEntryToJson(_WrongAnswerEntry instance) =>
    <String, dynamic>{
      'questionId': instance.questionId,
      'sectionId': instance.sectionId,
      'timesWrong': instance.timesWrong,
    };

_ProgressData _$ProgressDataFromJson(
  Map<String, dynamic> json,
) => _ProgressData(
  bySection:
      (json['bySection'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, SectionProgress.fromJson(e as Map<String, dynamic>)),
      ) ??
      const <String, SectionProgress>{},
  wrongAnswers:
      (json['wrongAnswers'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, WrongAnswerEntry.fromJson(e as Map<String, dynamic>)),
      ) ??
      const <String, WrongAnswerEntry>{},
);

Map<String, dynamic> _$ProgressDataToJson(_ProgressData instance) =>
    <String, dynamic>{
      'bySection': instance.bySection,
      'wrongAnswers': instance.wrongAnswers,
    };
