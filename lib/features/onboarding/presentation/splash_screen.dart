import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
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
    final screen = MediaQuery.sizeOf(context);
    // Phones crop the art edge-to-edge; tablets show all of it on cream.
    final fit = screen.aspectRatio > 0.56 ? BoxFit.contain : BoxFit.cover;

    return Scaffold(
      backgroundColor: AppColors.clayCream,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: SizedBox.expand(
          child: FittedBox(
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
                            .animate(onPlay: (c) => c.repeat(reverse: true))
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
        ),
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
