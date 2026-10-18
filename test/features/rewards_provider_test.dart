import 'package:class_one_gk_quiz/core/services/storage_service.dart';
import 'package:class_one_gk_quiz/features/rewards/providers/rewards_provider.dart';
import 'package:class_one_gk_quiz/features/rewards/providers/rewards_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

ProviderContainer _makeContainer() {
  final container = ProviderContainer(
    overrides: [
      hiveStorageProvider.overrideWithValue(HiveStorageService.inMemory()),
    ],
  );
  addTearDown(container.dispose);
  return container;
}

void main() {
  group('RewardsNotifier', () {
    test('addStars accumulates the total', () {
      final container = _makeContainer();
      final notifier = container.read(rewardsProvider.notifier);

      notifier.addStars(3);
      notifier.addStars(2);

      expect(container.read(rewardsProvider).totalStars, 5);
    });

    test('reaching 100 stars unlocks the hundred_stars badge', () {
      final container = _makeContainer();
      final notifier = container.read(rewardsProvider.notifier);

      notifier.addStars(99);
      expect(container.read(rewardsProvider).badges, isNot(contains(BadgeIds.hundredStars)));

      notifier.addStars(1);
      expect(container.read(rewardsProvider).badges, contains(BadgeIds.hundredStars));
    });

    test('unlockBadge is idempotent', () {
      final container = _makeContainer();
      final notifier = container.read(rewardsProvider.notifier);

      notifier.unlockBadge(BadgeIds.firstQuiz);
      notifier.unlockBadge(BadgeIds.firstQuiz);

      expect(
        container.read(rewardsProvider).badges.where((b) => b == BadgeIds.firstQuiz).length,
        1,
      );
    });

    test('markPlayedToday starts a 1-day streak on first play', () {
      final container = _makeContainer();
      final notifier = container.read(rewardsProvider.notifier);

      notifier.markPlayedToday();

      expect(container.read(rewardsProvider).streakDays, 1);
    });

    test('markPlayedToday twice in the same day does not double-count', () {
      final container = _makeContainer();
      final notifier = container.read(rewardsProvider.notifier);

      notifier.markPlayedToday();
      notifier.markPlayedToday();

      expect(container.read(rewardsProvider).streakDays, 1);
    });

    test('buyAccessory fails without enough stars, succeeds after earning them', () {
      final container = _makeContainer();
      final notifier = container.read(rewardsProvider.notifier);

      final failedPurchase = notifier.buyAccessory(AccessoryIds.hat);
      expect(failedPurchase, isFalse);
      expect(container.read(rewardsProvider).unlockedAccessories, isEmpty);

      notifier.addStars(kAccessoryCost[AccessoryIds.hat]!);
      final successfulPurchase = notifier.buyAccessory(AccessoryIds.hat);

      expect(successfulPurchase, isTrue);
      expect(
        container.read(rewardsProvider).unlockedAccessories,
        contains(AccessoryIds.hat),
      );
      expect(container.read(rewardsProvider).totalStars, 0);
    });

    test('resetAll clears stars and badges', () {
      final container = _makeContainer();
      final notifier = container.read(rewardsProvider.notifier);

      notifier.addStars(10);
      notifier.unlockBadge(BadgeIds.firstQuiz);
      notifier.resetAll();

      final state = container.read(rewardsProvider);
      expect(state.totalStars, 0);
      expect(state.badges, isEmpty);
    });
  });
}
