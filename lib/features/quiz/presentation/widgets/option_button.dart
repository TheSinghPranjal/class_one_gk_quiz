import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../data/option_emojis.dart';

enum OptionVisualState {
  normal,
  eliminated,
  selectedCorrect,
  selectedWrong,
  revealedCorrect,
}

const List<Color> kOptionPastels = [
  Color(0xFFFEC2DB), // A - pink
  Color(0xFFBDDAFD), // B - blue
  Color(0xFFFED968), // C - yellow
  Color(0xFFC4F7CA), // D - green
];

/// Darker rim along the bottom of each pastel, giving the card its 3D lip.
const List<Color> _optionRims = [
  Color(0xFFFC90B9),
  Color(0xFF92BCFB),
  Color(0xFFF7BE3A),
  Color(0xFF9DE1AD),
];

const List<String> kOptionLetters = ['A', 'B', 'C', 'D'];

class OptionButton extends StatefulWidget {
  const OptionButton({
    super.key,
    required this.index,
    required this.label,
    this.emoji,
    required this.state,
    required this.onTap,
  });

  final int index;
  final String label;
  final String? emoji;
  final OptionVisualState state;
  final VoidCallback? onTap;

  @override
  State<OptionButton> createState() => _OptionButtonState();
}

class _OptionButtonState extends State<OptionButton> {
  bool _pressed = false;

  Color get _backgroundColor {
    switch (widget.state) {
      case OptionVisualState.selectedCorrect:
      case OptionVisualState.revealedCorrect:
        return AppColors.success;
      case OptionVisualState.selectedWrong:
        return AppColors.error;
      case OptionVisualState.eliminated:
        return AppColors.inkMuted.withValues(alpha: 0.15);
      case OptionVisualState.normal:
        return kOptionPastels[widget.index % kOptionPastels.length];
    }
  }

  Color get _textColor {
    switch (widget.state) {
      case OptionVisualState.selectedCorrect:
      case OptionVisualState.revealedCorrect:
      case OptionVisualState.selectedWrong:
        return Colors.white;
      case OptionVisualState.eliminated:
        return AppColors.inkMuted;
      case OptionVisualState.normal:
        return AppColors.inkDeep;
    }
  }

  Color get _rimColor {
    switch (widget.state) {
      case OptionVisualState.selectedCorrect:
      case OptionVisualState.revealedCorrect:
        return AppColors.successDark;
      case OptionVisualState.selectedWrong:
        return AppColors.errorDark;
      case OptionVisualState.eliminated:
        return Colors.transparent;
      case OptionVisualState.normal:
        return _optionRims[widget.index % _optionRims.length];
    }
  }

  bool get _tappable =>
      widget.onTap != null &&
      widget.state != OptionVisualState.eliminated &&
      widget.state != OptionVisualState.selectedCorrect &&
      widget.state != OptionVisualState.selectedWrong &&
      widget.state != OptionVisualState.revealedCorrect;

  @override
  Widget build(BuildContext context) {
    final isEliminated = widget.state == OptionVisualState.eliminated;

    final emoji = widget.emoji ?? emojiForOption(widget.label);
    final answered =
        widget.state != OptionVisualState.normal &&
        widget.state != OptionVisualState.eliminated;

    Widget content = AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeOut,
      constraints: const BoxConstraints(minHeight: 67),
      padding: const EdgeInsets.fromLTRB(15, 8, 16, 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.lighten(_backgroundColor, 0.04), _backgroundColor],
        ),
        borderRadius: BorderRadius.circular(30),
        border: widget.state == OptionVisualState.revealedCorrect
            ? Border.all(color: AppColors.successDark, width: 3)
            : null,
        boxShadow: isEliminated
            ? null
            : [
                BoxShadow(
                  color: _rimColor.withValues(alpha: 0.35),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
                BoxShadow(color: _rimColor, offset: const Offset(0, 4)),
              ],
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFFFF5FA).withValues(alpha: 0.95),
              boxShadow: [
                BoxShadow(
                  color: _rimColor.withValues(alpha: 0.4),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Text(
              kOptionLetters[widget.index % kOptionLetters.length],
              style: AppTextStyles.heading(
                fontSize: 21,
                color: AppColors.inkDeep,
                weight: FontWeight.w800,
              ).copyWith(height: 1),
            ),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Text(
              widget.label,
              style: AppTextStyles.heading(
                fontSize: 22,
                color: _textColor,
                weight: FontWeight.w700,
              ),
            ),
          ),
          if (emoji != null && !answered) ...[
            const SizedBox(width: 8),
            Text(emoji, style: const TextStyle(fontSize: 44, height: 1.1)),
            const SizedBox(width: 6),
          ],
          if (widget.state == OptionVisualState.selectedCorrect ||
              widget.state == OptionVisualState.revealedCorrect)
            const Icon(
              Icons.check_circle_rounded,
              color: Colors.white,
              size: 32,
            ),
          if (widget.state == OptionVisualState.selectedWrong)
            const Icon(Icons.cancel_rounded, color: Colors.white, size: 32),
        ],
      ),
    );

    if (widget.state == OptionVisualState.selectedCorrect) {
      content = content
          .animate()
          .scale(
            begin: const Offset(1, 1),
            end: const Offset(1.04, 1.04),
            curve: Curves.elasticOut,
            duration: 400.ms,
          )
          .then()
          .scale(end: const Offset(1, 1));
    } else if (widget.state == OptionVisualState.selectedWrong) {
      content = content.animate().shake(hz: 5, duration: 400.ms);
    }

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 250),
      opacity: isEliminated ? 0.35 : 1,
      child: Semantics(
        button: true,
        enabled: _tappable,
        label: '${kOptionLetters[widget.index % 4]}. ${widget.label}',
        child: GestureDetector(
          onTapDown: _tappable ? (_) => setState(() => _pressed = true) : null,
          onTapCancel: _tappable
              ? () => setState(() => _pressed = false)
              : null,
          onTapUp: _tappable
              ? (_) {
                  setState(() => _pressed = false);
                  HapticFeedback.lightImpact();
                  widget.onTap?.call();
                }
              : null,
          child: AnimatedScale(
            duration: const Duration(milliseconds: 100),
            scale: _pressed ? 0.95 : 1.0,
            child: content,
          ),
        ),
      ),
    );
  }
}
