import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

/// Asks whether to abandon the current quiz. Resolves to `true` when the
/// child chooses to leave.
Future<bool> showLeaveQuizDialog(BuildContext context) async {
  final result = await showDialog<bool>(
    context: context,
    barrierColor: AppColors.inkDeep.withValues(alpha: 0.55),
    builder: (context) => const LeaveQuizDialog(),
  );
  return result ?? false;
}

class LeaveQuizDialog extends StatelessWidget {
  const LeaveQuizDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 380),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: AppColors.dialogCream,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.inkDeep.withValues(alpha: 0.25),
                    blurRadius: 24,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, right: 18),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/quiz/leave_owl.png',
                          width: 150,
                          excludeFromSemantics: true,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Leave the quiz?',
                                  style: AppTextStyles.heading(
                                    fontSize: 24,
                                    color: AppColors.inkDeep,
                                    weight: FontWeight.w800,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Your progress on this quiz won't be saved.",
                                  style: AppTextStyles.body(
                                    fontSize: 15.5,
                                    color: AppColors.dialogBody,
                                  ).copyWith(height: 1.4),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 2, 15, 15),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 8,
                          child: _PillButton(
                            label: 'Keep Playing',
                            topColor: AppColors.keepPlayingTop,
                            bottomColor: AppColors.keepPlayingBottom,
                            depthColor: AppColors.keepPlayingDepth,
                            textColor: AppColors.keepPlayingText,
                            onPressed: () => Navigator.of(context).pop(false),
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          flex: 7,
                          child: _PillButton(
                            label: 'Leave',
                            topColor: AppColors.leaveTop,
                            bottomColor: AppColors.leaveBottom,
                            depthColor: AppColors.leaveDepth,
                            textColor: AppColors.surface,
                            onPressed: () => Navigator.of(context).pop(true),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -6,
              right: -4,
              child: Image.asset(
                'assets/images/quiz/leave_leaf.png',
                width: 45,
                excludeFromSemantics: true,
              ),
            ),
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(duration: 150.ms)
        .scale(
          begin: const Offset(0.85, 0.85),
          duration: 280.ms,
          curve: Curves.easeOutBack,
        );
  }
}

/// Glossy pill button with a darker "depth" edge that flattens when pressed.
class _PillButton extends StatefulWidget {
  const _PillButton({
    required this.label,
    required this.topColor,
    required this.bottomColor,
    required this.depthColor,
    required this.textColor,
    required this.onPressed,
  });

  final String label;
  final Color topColor;
  final Color bottomColor;
  final Color depthColor;
  final Color textColor;
  final VoidCallback onPressed;

  @override
  State<_PillButton> createState() => _PillButtonState();
}

class _PillButtonState extends State<_PillButton> {
  static const double _height = 48;
  static const double _depth = 5;
  bool _pressed = false;

  void _setPressed(bool value) {
    if (_pressed == value) return;
    setState(() => _pressed = value);
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: widget.label,
      excludeSemantics: true,
      child: GestureDetector(
        onTapDown: (_) => _setPressed(true),
        onTapUp: (_) {
          _setPressed(false);
          HapticFeedback.lightImpact();
          widget.onPressed();
        },
        onTapCancel: () => _setPressed(false),
        child: SizedBox(
          height: _height + _depth,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 90),
            curve: Curves.easeOut,
            margin: EdgeInsets.only(
              top: _pressed ? _depth : 0,
              bottom: _pressed ? 0 : _depth,
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_height / 2),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [widget.topColor, widget.bottomColor],
              ),
              border: Border.all(
                color: AppColors.surface.withValues(alpha: 0.6),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: widget.depthColor,
                  offset: Offset(0, _pressed ? 0 : _depth),
                ),
                BoxShadow(
                  color: widget.depthColor.withValues(alpha: 0.25),
                  blurRadius: 10,
                  offset: Offset(0, _pressed ? 2 : _depth + 4),
                ),
              ],
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  widget.label,
                  style: AppTextStyles.button(
                    fontSize: 19,
                    color: widget.textColor,
                  ).copyWith(fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
