// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rewards_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RewardsData _$RewardsDataFromJson(Map<String, dynamic> json) => _RewardsData(
  totalStars: (json['totalStars'] as num?)?.toInt() ?? 0,
  badges:
      (json['badges'] as List<dynamic>?)?.map((e) => e as String).toSet() ??
      const <String>{},
  unlockedAccessories:
      (json['unlockedAccessories'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toSet() ??
      const <String>{},
  streakDays: (json['streakDays'] as num?)?.toInt() ?? 0,
  lastPlayedDate: json['lastPlayedDate'] as String?,
);

Map<String, dynamic> _$RewardsDataToJson(_RewardsData instance) =>
    <String, dynamic>{
      'totalStars': instance.totalStars,
      'badges': instance.badges.toList(),
      'unlockedAccessories': instance.unlockedAccessories.toList(),
      'streakDays': instance.streakDays,
      'lastPlayedDate': instance.lastPlayedDate,
    };
