import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/storage_service.dart';
import 'rewards_state.dart';

part 'rewards_provider.g.dart';

@Riverpod(keepAlive: true)
class Rewards extends _$Rewards {
  @override
  RewardsData build() {
    final storage = ref.watch(hiveStorageProvider);
    final json = storage.readJson(kRewardsKey);
    if (json == null) return const RewardsData();
    return RewardsData.fromJson(json);
  }

  void _persist(RewardsData data) {
    final storage = ref.read(hiveStorageProvider);
    storage.writeJson(kRewardsKey, data.toJson());
    state = data;
  }

  void addStars(int amount) {
    if (amount <= 0) return;
    final updated = state.copyWith(totalStars: state.totalStars + amount);
    _persist(updated);
    if (updated.totalStars >= 100) {
      unlockBadge(BadgeIds.hundredStars);
    }
  }

  void unlockBadge(String badgeId) {
    if (state.badges.contains(badgeId)) return;
    _persist(state.copyWith(badges: {...state.badges, badgeId}));
  }

  bool buyAccessory(String accessoryId) {
    final cost = kAccessoryCost[accessoryId] ?? 0;
    if (state.unlockedAccessories.contains(accessoryId)) return true;
    if (state.totalStars < cost) return false;
    _persist(
      state.copyWith(
        totalStars: state.totalStars - cost,
        unlockedAccessories: {...state.unlockedAccessories, accessoryId},
      ),
    );
    return true;
  }

  /// Call once per day the child completes at least one quiz.
  void markPlayedToday() {
    final today = DateTime.now();
    final todayKey = '${today.year}-${today.month}-${today.day}';
    if (state.lastPlayedDate == todayKey) return;

    final yesterday = today.subtract(const Duration(days: 1));
    final yesterdayKey = '${yesterday.year}-${yesterday.month}-${yesterday.day}';
    final continuesStreak = state.lastPlayedDate == yesterdayKey;

    final newStreak = continuesStreak ? state.streakDays + 1 : 1;
    _persist(
      state.copyWith(streakDays: newStreak, lastPlayedDate: todayKey),
    );
    if (newStreak >= 3) {
      unlockBadge(BadgeIds.threeDayStreak);
    }
  }

  void resetAll() {
    _persist(const RewardsData());
  }
}
