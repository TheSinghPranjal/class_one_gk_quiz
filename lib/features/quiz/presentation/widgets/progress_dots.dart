import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

/// A row of little footprint dots that fill in as the quiz progresses,
/// instead of a plain percentage bar.
class ProgressDots extends StatelessWidget {
  const ProgressDots({
    super.key,
    required this.total,
    required this.currentIndex,
    this.color = AppColors.primary,
  });

  final int total;
  final int currentIndex;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Question ${currentIndex + 1} of $total',
      child: Wrap(
        alignment: WrapAlignment.center,
        spacing: 7,
        runSpacing: 6,
        children: [
          for (var i = 0; i < total; i++)
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: i == currentIndex ? 14 : 11,
              height: i == currentIndex ? 14 : 11,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: i <= currentIndex ? color : const Color(0xFFE1D6C0),
              ),
            ),
        ],
      ),
    );
  }
}
