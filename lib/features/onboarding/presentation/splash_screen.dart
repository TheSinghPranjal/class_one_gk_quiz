import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/clay.dart';
import '../providers/profile_provider.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  // Pixel size of the illustrated background, and where the play button
  // sprite sits inside it. The button is a separate sprite so it can pulse
  // and press while the rest of the art stays put.
  static const _artSize = Size(812, 1709);
  static const _buttonRect = Rect.fromLTWH(151, 1242, 515, 138);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasProfile = ref.watch(profileProvider).hasProfile;

    return Scaffold(
      backgroundColor: AppColors.clayCream,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screen = constraints.biggest;
            // Phones crop the art edge-to-edge; tablets show all of it on cream.
            final fit = screen.aspectRatio > 0.56
                ? BoxFit.contain
                : BoxFit.cover;

            return Stack(
              fit: StackFit.expand,
              children: [
                FittedBox(
                  fit: fit,
                  child: SizedBox.fromSize(
                    size: _artSize,
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset(
                            'assets/images/splash/background.png',
                            fit: BoxFit.fill,
                          ).animate().fadeIn(duration: 400.ms),
                        ),
                        Positioned.fromRect(
                          rect: _buttonRect,
                          child:
                              _PlayButton(
                                    key: const ValueKey('lets-play'),
                                    onPressed: () => context.go(
                                      hasProfile ? '/home' : '/onboarding',
                                    ),
                                  )
                                  .animate(
                                    onPlay: (c) => c.repeat(reverse: true),
                                  )
                                  .fadeIn(delay: 500.ms, duration: 300.ms)
                                  .scale(
                                    delay: 500.ms,
                                    begin: const Offset(1, 1),
                                    end: const Offset(1.04, 1.04),
                                    duration: 900.ms,
                                    curve: Curves.easeInOut,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
                _studioByline(context, screen, fit),
              ],
            );
          },
        ),
      ),
    );
  }
}

/// Studio credit, kept in the gap under the play sprite so the illustrated
/// splash, its pulse, and the tap target stay as they are.
Positioned _studioByline(BuildContext context, Size screen, BoxFit fit) {
  final padding = MediaQuery.paddingOf(context);
  final fitted = applyBoxFit(fit, SplashScreen._artSize, screen);
  final scale = fitted.destination.width / SplashScreen._artSize.width;
  final dy = (screen.height - fitted.destination.height) / 2;
  final buttonBottom = dy + SplashScreen._buttonRect.bottom * scale;

  final left = math.max(12.0, padding.left + 8);
  final right = math.max(12.0, padding.right + 8);
  final bottomInset = math.min(padding.bottom + 8, screen.height * 0.2);
  final gapTop = buttonBottom + 10;
  final gapBottom = screen.height - bottomInset;
  // Stay below the button whenever the screen leaves a real gap. On a very
  // short window, keep a thin strip in the bottom safe area instead.
  final top = gapBottom - gapTop >= 28 ? gapTop : math.max(0.0, gapBottom - 36);

  return Positioned(
    left: left,
    right: right,
    top: top,
    bottom: bottomInset,
    child: const IgnorePointer(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        alignment: Alignment.bottomCenter,
        child: _StudioByline(),
      ),
    ).animate().fadeIn(duration: 400.ms),
  );
}

class _StudioByline extends StatelessWidget {
  const _StudioByline();

  @override
  Widget build(BuildContext context) {
    final byStyle = AppTextStyles.body(
      fontSize: 12,
      color: AppColors.woodInk,
      weight: FontWeight.w700,
    ).copyWith(height: 1.05);
    final nameStyle = AppTextStyles.heading(
      fontSize: 15,
      color: AppColors.inkDeep,
      weight: FontWeight.w700,
    ).copyWith(height: 1.05);

    return Clay(
      key: const ValueKey('studio-byline'),
      color: AppColors.surface,
      borderRadius: 18,
      depth: 0.7,
      padding: const EdgeInsets.fromLTRB(6, 6, 12, 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/branding/lazy_bear_club.png',
              width: 36,
              height: 36,
              fit: BoxFit.cover,
              excludeFromSemantics: true,
            ),
          ),
          const SizedBox(width: 8),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('by', style: byStyle),
              Text('The Lazy Bear Club', style: nameStyle),
            ],
          ),
        ],
      ),
    );
  }
}

class _PlayButton extends StatefulWidget {
  const _PlayButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  State<_PlayButton> createState() => _PlayButtonState();
}

class _PlayButtonState extends State<_PlayButton> {
  bool _pressed = false;

  void _setPressed(bool value) {
    if (_pressed == value) return;
    setState(() => _pressed = value);
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: "Let's Play",
      child: GestureDetector(
        onTapDown: (_) => _setPressed(true),
        onTapUp: (_) {
          _setPressed(false);
          HapticFeedback.lightImpact();
          widget.onPressed();
        },
        onTapCancel: () => _setPressed(false),
        child: AnimatedScale(
          scale: _pressed ? 0.95 : 1,
          duration: const Duration(milliseconds: 90),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(69),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.35),
                  blurRadius: 24,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Image.asset(
              'assets/images/splash/play_button.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
