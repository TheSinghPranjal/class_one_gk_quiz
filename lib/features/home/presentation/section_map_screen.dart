import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/animated_background.dart';
import '../../../core/widgets/clay.dart';
import '../../onboarding/providers/profile_provider.dart';
import '../../quiz/providers/questions_providers.dart';
import '../../rewards/providers/rewards_provider.dart';
import '../../settings/providers/settings_provider.dart';
import '../widgets/clay_tile.dart';
import '../widgets/section_card.dart';

class SectionMapScreen extends ConsumerWidget {
  const SectionMapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileProvider);
    final rewards = ref.watch(rewardsProvider);
    final sections = ref.watch(sectionsProvider);
    final settings = ref.watch(settingsProvider);

    return Scaffold(
      body: AnimatedBackground(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 6),
                child: Row(
                  children: [
                    Clay(
                      color: AppColors.clayCream,
                      circle: true,
                      width: 58,
                      height: 58,
                      child: Center(
                        child: Text(
                          profile.avatarEmoji.isEmpty
                              ? '🙂'
                              : profile.avatarEmoji,
                          style: const TextStyle(fontSize: 32),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Hi, ${profile.name}!',
                        style: AppTextStyles.heading(
                          fontSize: 24,
                          weight: FontWeight.w800,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    _StatChip(icon: '⭐', value: '${rewards.totalStars}'),
                    const SizedBox(width: 6),
                    _StatChip(icon: '🔥', value: '${rewards.streakDays}'),
                    const SizedBox(width: 6),
                    _HeaderButton(
                      tooltip: settings.soundOn ? 'Mute sound' : 'Unmute sound',
                      onPressed: () => ref
                          .read(settingsProvider.notifier)
                          .setSoundOn(!settings.soundOn),
                      child: Icon(
                        settings.soundOn
                            ? Icons.volume_up_rounded
                            : Icons.volume_off_rounded,
                        color: AppColors.ink,
                        size: 22,
                      ),
                    ),
                    const SizedBox(width: 6),
                    _HeaderButton(
                      tooltip: 'Sticker book',
                      onPressed: () => context.push('/rewards'),
                      child: const Text('🏆', style: TextStyle(fontSize: 20)),
                    ),
                    const SizedBox(width: 6),
                    _HeaderButton(
                      tooltip: 'Parent area',
                      onPressed: () => context.push('/parent'),
                      child: const Icon(
                        Icons.lock_rounded,
                        color: AppColors.ink,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final isPhone = constraints.maxWidth < 600;
                    final crossAxisCount = isPhone
                        ? 2
                        : constraints.maxWidth < 1024
                        ? 3
                        : 4;
                    final items = <Widget>[
                      _SpecialTile(
                        emoji: '🎲',
                        title: 'Surprise Mix',
                        color: AppColors.primary,
                        onTap: () => context.push(
                          '/quiz',
                          extra: {'sectionId': 'mix', 'mode': 'mix'},
                        ),
                      ),
                      _SpecialTile(
                        emoji: '📅',
                        title: 'Daily Challenge',
                        color: AppColors.modeQuiz,
                        onTap: () => context.push(
                          '/quiz',
                          extra: {'sectionId': 'daily', 'mode': 'daily'},
                        ),
                      ),
                      for (var i = 0; i < sections.length; i++)
                        SectionCard(
                          index: i,
                          section: sections[i],
                          onTap: () =>
                              context.push('/section/${sections[i].id}'),
                        ),
                    ];
                    return GridView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 16,
                        childAspectRatio: 0.86,
                      ),
                      itemCount: items.length,
                      itemBuilder: (context, i) => items[i],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({required this.icon, required this.value});

  final String icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Clay(
      color: AppColors.clayCream,
      borderRadius: 20,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(icon, style: const TextStyle(fontSize: 18)),
          const SizedBox(width: 4),
          Text(
            value,
            style: AppTextStyles.heading(fontSize: 17, weight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}

class _HeaderButton extends StatelessWidget {
  const _HeaderButton({
    required this.tooltip,
    required this.onPressed,
    required this.child,
  });

  final String tooltip;
  final VoidCallback onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: ClayButton(
        color: AppColors.clayCream,
        circle: true,
        width: 42,
        height: 42,
        semanticsLabel: tooltip,
        onPressed: onPressed,
        child: Center(child: child),
      ),
    );
  }
}

class _SpecialTile extends StatelessWidget {
  const _SpecialTile({
    required this.emoji,
    required this.title,
    required this.color,
    required this.onTap,
  });

  final String emoji;
  final String title;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ClayTile(color: color, title: title, icon: Text(emoji), onTap: onTap)
        .animate()
        .fadeIn(duration: 350.ms)
        .scale(
          begin: const Offset(0.7, 0.7),
          end: const Offset(1, 1),
          curve: Curves.easeOutBack,
        );
  }
}
