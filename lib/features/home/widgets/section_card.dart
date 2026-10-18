import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../quiz/data/models/section.dart';
import '../../quiz/providers/questions_providers.dart';
import '../../rewards/providers/progress_provider.dart';
import 'clay_tile.dart';

class SectionCard extends ConsumerStatefulWidget {
  const SectionCard({
    super.key,
    required this.section,
    required this.onTap,
    this.index = 0,
  });

  final Section section;
  final VoidCallback onTap;
  final int index;

  @override
  ConsumerState<SectionCard> createState() => _SectionCardState();
}

class _SectionCardState extends ConsumerState<SectionCard>
    with SingleTickerProviderStateMixin {
  late final AnimationController _wobble;

  @override
  void initState() {
    super.initState();
    _wobble = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    _wobble.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color = Color(widget.section.colorValue);
    final questionsAsync = ref.watch(
      questionsBySectionProvider(widget.section.id),
    );
    final progressAsync = ref.watch(progressProvider);

    final total = questionsAsync.value?.length ?? 0;
    final mastered =
        progressAsync.value
            ?.progressFor(widget.section.id)
            .masteredQuestionIds
            .length ??
        0;
    final stars =
        progressAsync.value?.progressFor(widget.section.id).bestStars ?? 0;
    final progress = total == 0 ? 0.0 : (mastered / total).clamp(0.0, 1.0);

    return AnimatedBuilder(
          animation: _wobble,
          builder: (context, child) {
            final wobble = (1 - _wobble.value) * _wobble.value * 4;
            return Transform.rotate(angle: wobble * 0.05, child: child);
          },
          child: ClayTile(
            color: color,
            title: widget.section.title,
            stars: stars,
            progress: progress,
            semanticsLabel:
                '${widget.section.title}, $mastered of $total mastered, '
                '$stars stars',
            onTap: () {
              _wobble.forward(from: 0);
              widget.onTap();
            },
            icon: Hero(
              tag: 'section-emoji-${widget.section.id}',
              child: Text(widget.section.emoji),
            ),
          ),
        )
        .animate(delay: (60 * widget.index).ms)
        .fadeIn(duration: 350.ms)
        .scale(
          begin: const Offset(0.7, 0.7),
          end: const Offset(1, 1),
          curve: Curves.easeOutBack,
        );
  }
}
