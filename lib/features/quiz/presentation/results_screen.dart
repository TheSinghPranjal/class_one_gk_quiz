import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/scoring.dart';
import '../../../core/widgets/animated_background.dart';
import '../../../core/widgets/candy_button.dart';
import '../../../core/widgets/mascot.dart';
import '../../../core/widgets/star_burst.dart';
import '../../rewards/providers/rewards_state.dart';
import '../../rewards/widgets/badge_popup.dart';
import '../data/sections_data.dart';
import '../providers/quiz_state.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({
    super.key,
    required this.sectionId,
    required this.mode,
    required this.score,
    required this.total,
    this.newBadges = const [],
    this.wrongQuestionIds = const [],
  });

  final String sectionId;
  final QuizMode mode;
  final int score;
  final int total;
  final List<String> newBadges;
  final List<String> wrongQuestionIds;

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  late final ConfettiController _confetti;
  late final int _stars;

  @override
  void initState() {
    super.initState();
    _stars = starsForScore(widget.score, widget.total);
    _confetti = ConfettiController(duration: const Duration(seconds: 3));
    if (_stars == 3) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _confetti.play());
    }
    if (widget.newBadges.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _showBadgePopups());
    }
  }

  Future<void> _showBadgePopups() async {
    for (final badgeId in widget.newBadges) {
      if (!mounted) return;
      final info = kBadgeInfo[badgeId] ?? const BadgeInfo('🏅', 'Badge');
      await showBadgePopup(context, info);
    }
  }

  @override
  void dispose() {
    _confetti.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final section = sectionById(widget.sectionId);
    final accent = section != null
        ? Color(section.colorValue)
        : AppColors.primary;

    return Scaffold(
      body: AnimatedBackground(
        child: Stack(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    Mascot(
                      mood: _stars > 0 ? MascotMood.cheering : MascotMood.sad,
                      size: 120,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Quiz Complete!',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const SizedBox(height: 12),
                    StarBurst(stars: _stars, size: 48, animate: true),
                    const SizedBox(height: 16),
                    Text(
                      '${widget.score} / ${widget.total}',
                      style: Theme.of(
                        context,
                      ).textTheme.headlineLarge?.copyWith(color: accent),
                    ),
                    if (widget.newBadges.isNotEmpty) ...[
                      const SizedBox(height: 24),
                      Text(
                        'New Badge!',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        alignment: WrapAlignment.center,
                        children: [
                          for (final badgeId in widget.newBadges)
                            _BadgeChip(
                              info:
                                  kBadgeInfo[badgeId] ??
                                  const BadgeInfo('🏅', 'Badge'),
                            ),
                        ],
                      ),
                    ],
                    const SizedBox(height: 32),
                    CandyButton(
                      width: double.infinity,
                      color: accent,
                      onPressed: () => context.pushReplacement(
                        '/quiz',
                        extra: {
                          'sectionId': widget.sectionId,
                          'mode': widget.mode.name,
                        },
                      ),
                      child: const Text('Play Again 🔁'),
                    ),
                    const SizedBox(height: 14),
                    if (widget.wrongQuestionIds.isNotEmpty)
                      CandyButton(
                        width: double.infinity,
                        color: AppColors.starDark,
                        onPressed: () => context.pushReplacement(
                          '/quiz',
                          extra: {
                            'sectionId': widget.sectionId,
                            'mode': widget.mode.name,
                            'retryQuestionIds': widget.wrongQuestionIds,
                          },
                        ),
                        child: const Text('Try Mistakes 🎯'),
                      ),
                    if (widget.wrongQuestionIds.isNotEmpty)
                      const SizedBox(height: 14),
                    CandyButton(
                      width: double.infinity,
                      color: AppColors.inkMuted,
                      onPressed: () => context.go('/home'),
                      child: const Text('Back to Map 🗺️'),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _confetti,
                blastDirection: pi / 2,
                numberOfParticles: 24,
                maxBlastForce: 20,
                minBlastForce: 10,
                gravity: 0.25,
                shouldLoop: false,
                colors: const [
                  AppColors.primary,
                  AppColors.success,
                  AppColors.star,
                  AppColors.starDark,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BadgeChip extends StatelessWidget {
  const _BadgeChip({required this.info});

  final BadgeInfo info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: AppColors.ink.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(info.emoji, style: const TextStyle(fontSize: 22)),
          const SizedBox(width: 8),
          Text(info.title, style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
    );
  }
}
