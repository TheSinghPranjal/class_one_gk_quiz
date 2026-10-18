// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Question _$QuestionFromJson(Map<String, dynamic> json) => _Question(
  id: json['id'] as String,
  sectionId: json['sectionId'] as String,
  question: json['question'] as String,
  emoji: json['emoji'] as String?,
  options: (json['options'] as List<dynamic>).map((e) => e as String).toList(),
  optionEmojis: (json['optionEmojis'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  correctIndex: (json['correctIndex'] as num).toInt(),
  funFact: json['funFact'] as String,
  difficulty: (json['difficulty'] as num).toInt(),
  source: $enumDecode(_$QuestionSourceEnumMap, json['source']),
  page: (json['page'] as num?)?.toInt(),
);

Map<String, dynamic> _$QuestionToJson(_Question instance) => <String, dynamic>{
  'id': instance.id,
  'sectionId': instance.sectionId,
  'question': instance.question,
  'emoji': instance.emoji,
  'options': instance.options,
  'optionEmojis': instance.optionEmojis,
  'correctIndex': instance.correctIndex,
  'funFact': instance.funFact,
  'difficulty': instance.difficulty,
  'source': _$QuestionSourceEnumMap[instance.source]!,
  'page': instance.page,
};

const _$QuestionSourceEnumMap = {
  QuestionSource.book: 'book',
  QuestionSource.generated: 'generated',
};
