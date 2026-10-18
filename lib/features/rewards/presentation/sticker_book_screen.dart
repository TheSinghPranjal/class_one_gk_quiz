import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/animated_background.dart';
import '../../../core/widgets/candy_button.dart';
import '../providers/rewards_provider.dart';
import '../providers/rewards_state.dart';

const Map<String, String> _accessoryEmoji = {
  AccessoryIds.hat: '🎩',
  AccessoryIds.glasses: '🕶️',
  AccessoryIds.crown: '👑',
};

const Map<String, String> _accessoryTitle = {
  AccessoryIds.hat: 'Hat',
  AccessoryIds.glasses: 'Glasses',
  AccessoryIds.crown: 'Crown',
};

class StickerBookScreen extends ConsumerWidget {
  const StickerBookScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rewards = ref.watch(rewardsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Sticker Book')),
      body: AnimatedBackground(
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Text('⭐ ${rewards.totalStars} stars collected',
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 20),
              Text('Badges', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 12),
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 3,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                children: [
                  for (final entry in kBadgeInfo.entries)
                    _StickerTile(
                      emoji: entry.value.emoji,
                      title: entry.value.title,
                      unlocked: rewards.badges.contains(entry.key),
                    ),
                ],
              ),
              const SizedBox(height: 28),
              Text('Mascot Accessories',
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 12),
              for (final id in kAccessoryCost.keys)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _AccessoryRow(
                    id: id,
                    unlocked: rewards.unlockedAccessories.contains(id),
                    stars: rewards.totalStars,
                    onBuy: () => ref.read(rewardsProvider.notifier).buyAccessory(id),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StickerTile extends StatelessWidget {
  const _StickerTile({
    required this.emoji,
    required this.title,
    required this.unlocked,
  });

  final String emoji;
  final String title;
  final bool unlocked;

  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 32)),
          const SizedBox(height: 6),
          Text(
            title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
    if (!unlocked) {
      content = ColorFiltered(
        colorFilter: const ColorFilter.matrix(<double>[
          0.2126, 0.7152, 0.0722, 0, 0,
          0.2126, 0.7152, 0.0722, 0, 0,
          0.2126, 0.7152, 0.0722, 0, 0,
          0, 0, 0, 1, 0,
        ]),
        child: Opacity(opacity: 0.6, child: content),
      );
    }
    return Semantics(
      label: unlocked ? '$title, unlocked' : '$title, locked',
      child: content,
    );
  }
}

class _AccessoryRow extends StatelessWidget {
  const _AccessoryRow({
    required this.id,
    required this.unlocked,
    required this.stars,
    required this.onBuy,
  });

  final String id;
  final bool unlocked;
  final int stars;
  final VoidCallback onBuy;

  @override
  Widget build(BuildContext context) {
    final cost = kAccessoryCost[id] ?? 0;
    final canAfford = stars >= cost;
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text(_accessoryEmoji[id] ?? '🎁', style: const TextStyle(fontSize: 32)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              _accessoryTitle[id] ?? id,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          if (unlocked)
            const Icon(Icons.check_circle_rounded, color: AppColors.success)
          else
            CandyButton(
              height: 44,
              color: canAfford ? AppColors.star : AppColors.inkMuted,
              enabled: canAfford,
              onPressed: canAfford ? onBuy : null,
              child: Text('⭐ $cost'),
            ),
        ],
      ),
    );
  }
}
