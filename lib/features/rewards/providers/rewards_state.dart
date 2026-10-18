import 'package:freezed_annotation/freezed_annotation.dart';

part 'rewards_state.freezed.dart';
part 'rewards_state.g.dart';

@freezed
abstract class RewardsData with _$RewardsData {
  const factory RewardsData({
    @Default(0) int totalStars,
    @Default(<String>{}) Set<String> badges,
    @Default(<String>{}) Set<String> unlockedAccessories,
    @Default(0) int streakDays,
    String? lastPlayedDate,
  }) = _RewardsData;

  factory RewardsData.fromJson(Map<String, dynamic> json) =>
      _$RewardsDataFromJson(json);
}

abstract final class BadgeIds {
  static const firstQuiz = 'first_quiz';
  static const threeDayStreak = 'three_day_streak';
  static const animalExpert = 'animal_expert';
  static const hundredStars = 'hundred_stars';
  static const bookMaster = 'book_master';
  static const speedStar = 'speed_star';
}

class BadgeInfo {
  const BadgeInfo(this.emoji, this.title);
  final String emoji;
  final String title;
}

const Map<String, BadgeInfo> kBadgeInfo = {
  BadgeIds.firstQuiz: BadgeInfo('🎉', 'First Quiz'),
  BadgeIds.threeDayStreak: BadgeInfo('🔥', '3-Day Streak'),
  BadgeIds.animalExpert: BadgeInfo('🦁', 'Animal Expert'),
  BadgeIds.hundredStars: BadgeInfo('⭐', '100 Stars'),
  BadgeIds.bookMaster: BadgeInfo('📖', 'Book Master'),
  BadgeIds.speedStar: BadgeInfo('⚡', 'Speed Star'),
};

abstract final class AccessoryIds {
  static const hat = 'hat';
  static const crown = 'crown';
  static const glasses = 'glasses';
}

const Map<String, int> kAccessoryCost = {
  AccessoryIds.hat: 20,
  AccessoryIds.glasses: 40,
  AccessoryIds.crown: 80,
};
