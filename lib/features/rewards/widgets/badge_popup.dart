import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/theme/app_colors.dart';
import '../providers/rewards_state.dart';

/// Shows a celebratory "New Badge!" pop-up dialog. Awaits until the child
/// dismisses it by tapping anywhere.
Future<void> showBadgePopup(BuildContext context, BadgeInfo info) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'New badge',
    barrierColor: Colors.black.withValues(alpha: 0.45),
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, _, _) => _BadgePopupContent(info: info),
  );
}

class _BadgePopupContent extends StatelessWidget {
  const _BadgePopupContent({required this.info});

  final BadgeInfo info;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      behavior: HitTestBehavior.opaque,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(28),
            margin: const EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: AppColors.ink.withValues(alpha: 0.2),
                  blurRadius: 24,
                  offset: const Offset(0, 12),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'New Badge!',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                Text(info.emoji, style: const TextStyle(fontSize: 72))
                    .animate()
                    .scale(
                      begin: const Offset(0, 0),
                      end: const Offset(1, 1),
                      curve: Curves.elasticOut,
                      duration: 700.ms,
                    ),
                const SizedBox(height: 12),
                Text(
                  info.title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: AppColors.primaryDark,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Tap anywhere to continue',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ),
      ),
    ).animate().fadeIn(duration: 200.ms).scale(
          begin: const Offset(0.8, 0.8),
          end: const Offset(1, 1),
          curve: Curves.easeOutBack,
        );
  }
}
