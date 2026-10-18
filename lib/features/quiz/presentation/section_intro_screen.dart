import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/services/tts_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/clay.dart';
import '../../settings/providers/settings_provider.dart';
import '../data/models/section.dart';
import '../data/sections_data.dart';
import '../providers/quiz_state.dart';

class SectionIntroScreen extends ConsumerStatefulWidget {
  const SectionIntroScreen({super.key, required this.sectionId});

  final String sectionId;

  @override
  ConsumerState<SectionIntroScreen> createState() => _SectionIntroScreenState();
}

class _SectionIntroScreenState extends ConsumerState<SectionIntroScreen> {
  @override
  void initState() {
    super.initState();
    final section = sectionById(widget.sectionId);
    if (section != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        if (ref.read(settingsProvider).autoReadAloud) {
          ref.read(ttsServiceProvider).speak(section.mascotLine);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final section = sectionById(widget.sectionId);
    if (section == null) {
      return const Scaffold(body: Center(child: Text('Section not found')));
    }

    final heroAsset = _heroAssets[section.id];
    final width = MediaQuery.sizeOf(context).width;
    final groundHeight = width * _groundAspect;

    return Scaffold(
      backgroundColor: AppColors.clayCream,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              'assets/images/section_intro/ground.png',
              width: width,
              fit: BoxFit.fitWidth,
            ),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: groundHeight + 8),
            child: Column(
              children: [
                if (heroAsset != null)
                  _IllustratedHero(asset: heroAsset, line: section.mascotLine)
                else
                  SafeArea(
                    bottom: false,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                      child: _HeroScene(section: section),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(17, 6, 17, 0),
                  child: Column(
                    children: [
                      const _ChooseHeading(),
                      const SizedBox(height: 14),
                      _ModeCard(
                        icon: 'assets/images/section_intro/mode_practice.png',
                        title: 'Practice',
                        subtitle: 'No timer, unlimited hints',
                        color: AppColors.modePractice,
                        index: 0,
                        onTap: () => _start(context, QuizMode.practice),
                      ),
                      const SizedBox(height: 12),
                      _ModeCard(
                        icon: 'assets/images/section_intro/mode_quiz.png',
                        title: 'Quiz',
                        subtitle: '10 questions, gentle timer',
                        color: AppColors.modeQuiz,
                        index: 1,
                        onTap: () => _start(context, QuizMode.quiz),
                      ),
                      const SizedBox(height: 12),
                      _ModeCard(
                        icon: 'assets/images/section_intro/mode_book.png',
                        title: 'Book Questions Only',
                        subtitle: 'Revise straight from the book',
                        color: AppColors.modeBook,
                        index: 2,
                        onTap: () => _start(context, QuizMode.bookOnly),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _start(BuildContext context, QuizMode mode) {
    context.push(
      '/quiz',
      extra: {'sectionId': widget.sectionId, 'mode': mode.name},
    );
  }
}

/// Painted hero artwork per section; sections without one fall back to the
/// clay-built [_HeroScene].
const _heroAssets = {'animals': 'assets/images/section_intro/animals_hero.png'};

// Source artwork is 820px wide; these keep overlays aligned to it.
const _heroAspect = 869 / 820;
const _groundAspect = 132 / 820;

/// Full-bleed painted scene (runs under the status bar) with the mascot's
/// line written onto the blank wooden sign.
class _IllustratedHero extends StatelessWidget {
  const _IllustratedHero({required this.asset, required this.line});

  final String asset;
  final String line;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = width * _heroAspect;

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned.fill(child: Image.asset(asset, fit: BoxFit.fill)),
          // Blank face of the sign, measured from the artwork.
          Positioned(
            left: width * (140 / 820),
            right: width * (110 / 820),
            top: height * (684 / 869),
            height: height * (102 / 869),
            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  line,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.heading(
                    fontSize: 28,
                    color: AppColors.inkDeep,
                    weight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 400.ms);
  }
}

/// The illustrated stage: hills, clouds, bushes, the section's hero animal,
/// the owl mascot, and a wooden sign carrying the mascot's line.
class _HeroScene extends StatelessWidget {
  const _HeroScene({required this.section});

  final Section section;

  @override
  Widget build(BuildContext context) {
    final reduceMotion = MediaQuery.of(context).disableAnimations;

    Widget bob(Widget child, {Duration? delay, double by = -8}) {
      if (reduceMotion) return child;
      return child
          .animate(delay: delay, onPlay: (c) => c.repeat(reverse: true))
          .moveY(begin: 0, end: by, duration: 1600.ms, curve: Curves.easeInOut);
    }

    return SizedBox(
          height: 330,
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              const Positioned(
                left: -20,
                right: -20,
                bottom: 40,
                height: 150,
                child: CustomPaint(painter: _HillsPainter()),
              ),
              Positioned(
                left: 0,
                top: 40,
                child: bob(const _ClayCloud(width: 96), by: -5),
              ),
              Positioned(
                right: 4,
                top: 18,
                child: bob(const _ClayCloud(width: 80), delay: 500.ms, by: -5),
              ),
              const Positioned(
                left: -6,
                bottom: 52,
                child: Text('🌿', style: TextStyle(fontSize: 64)),
              ),
              const Positioned(
                right: -4,
                bottom: 56,
                child: Text('🌿', style: TextStyle(fontSize: 54)),
              ),
              const Positioned(
                left: 18,
                bottom: 40,
                child: Clay(
                  color: AppColors.rock,
                  width: 54,
                  height: 34,
                  borderRadius: 20,
                ),
              ),
              const Positioned(
                right: 30,
                bottom: 46,
                child: Clay(
                  color: AppColors.rock,
                  width: 62,
                  height: 38,
                  borderRadius: 22,
                ),
              ),
              // Hero animal, peeking over the sign.
              Positioned(
                top: 30,
                child: bob(
                  Hero(
                    tag: 'section-emoji-${section.id}',
                    child: Text(
                      section.emoji,
                      style: const TextStyle(fontSize: 150),
                    ),
                  ),
                ),
              ),
              // The owl perched on the right rock.
              Positioned(
                right: 34,
                bottom: 72,
                child: bob(
                  const Text('🦉', style: TextStyle(fontSize: 62)),
                  delay: 300.ms,
                  by: -6,
                ),
              ),
              Positioned(
                bottom: 18,
                left: 36,
                right: 36,
                child: _WoodenSign(text: section.mascotLine),
              ),
            ],
          ),
        )
        .animate()
        .fadeIn(duration: 400.ms)
        .scale(
          begin: const Offset(0.94, 0.94),
          end: const Offset(1, 1),
          curve: Curves.easeOutBack,
        );
  }
}

class _WoodenSign extends StatelessWidget {
  const _WoodenSign({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Clay(
      color: AppColors.woodLight,
      borderRadius: 22,
      padding: const EdgeInsets.all(10),
      child: Clay(
        color: AppColors.clayCream,
        borderRadius: 18,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: AppTextStyles.heading(fontSize: 20, weight: FontWeight.w700),
        ),
      ),
    );
  }
}

class _ChooseHeading extends StatelessWidget {
  const _ChooseHeading();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const _Sparkle(mirror: true),
        const SizedBox(width: 10),
        Flexible(
          child: Text(
            'Choose how you want to\nplay',
            textAlign: TextAlign.center,
            style: AppTextStyles.heading(
              fontSize: 23,
              color: AppColors.inkDeep,
              weight: FontWeight.w800,
            ).copyWith(height: 1.2),
          ),
        ),
        const SizedBox(width: 10),
        const _Sparkle(),
      ],
    );
  }
}

/// Three little "shine" strokes, like a cartoon sparkle.
class _Sparkle extends StatelessWidget {
  const _Sparkle({this.mirror = false});

  final bool mirror;

  @override
  Widget build(BuildContext context) {
    Widget stroke(double angle, double length) => Transform.rotate(
      angle: angle,
      child: Container(
        width: 5,
        height: length,
        decoration: BoxDecoration(
          color: AppColors.star,
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    );

    final sparkle = SizedBox(
      width: 26,
      height: 30,
      child: Stack(
        children: [
          Positioned(left: 2, top: 0, child: stroke(-0.5, 14)),
          Positioned(left: 12, top: 4, child: stroke(0.2, 12)),
          Positioned(left: 4, top: 18, child: stroke(1.3, 12)),
        ],
      ),
    );
    return mirror ? Transform.flip(flipX: true, child: sparkle) : sparkle;
  }
}

class _ModeCard extends StatelessWidget {
  const _ModeCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.index,
    required this.onTap,
  });

  final String icon;
  final String title;
  final String subtitle;
  final Color color;
  final int index;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textShadow = [
      Shadow(color: AppColors.darken(color, 0.2), offset: const Offset(0, 2)),
    ];
    final paw = Icon(
      Icons.pets_rounded,
      size: 22,
      color: AppColors.darken(color, 0.12).withValues(alpha: 0.35),
    );

    return ClayButton(
          color: color,
          width: double.infinity,
          height: 91,
          borderRadius: 40,
          padding: const EdgeInsets.fromLTRB(12, 0, 13, 0),
          semanticsLabel: '$title. $subtitle',
          onPressed: onTap,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Positioned(
                right: 70,
                top: 10,
                child: Transform.rotate(angle: -0.2, child: paw),
              ),
              Positioned(
                right: 58,
                top: 30,
                child: Transform.rotate(angle: 0.2, child: paw),
              ),
              Row(
                children: [
                  Image.asset(icon, width: 72, height: 72),
                  const SizedBox(width: 13),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            title,
                            style: AppTextStyles.heading(
                              fontSize: 27,
                              color: Colors.white,
                              weight: FontWeight.w800,
                            ).copyWith(shadows: textShadow),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.heading(
                            fontSize: 17,
                            color: Colors.white,
                            weight: FontWeight.w500,
                          ).copyWith(shadows: textShadow),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Clay(
                    color: AppColors.clayCream,
                    circle: true,
                    width: 49,
                    height: 49,
                    child: Icon(
                      Icons.chevron_right_rounded,
                      color: AppColors.inkDeep,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
        .animate(delay: (120 * index).ms)
        .fadeIn(duration: 300.ms)
        .moveY(begin: 24, end: 0, curve: Curves.easeOutBack);
  }
}

/// A puffy clay cloud built from overlapping circles.
class _ClayCloud extends StatelessWidget {
  const _ClayCloud({required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, width * 0.55),
      painter: const _CloudPainter(),
    );
  }
}

class _CloudPainter extends CustomPainter {
  const _CloudPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final path = Path()
      ..addOval(
        Rect.fromCircle(center: Offset(w * 0.3, h * 0.62), radius: h * 0.36),
      )
      ..addOval(
        Rect.fromCircle(center: Offset(w * 0.55, h * 0.45), radius: h * 0.45),
      )
      ..addOval(
        Rect.fromCircle(center: Offset(w * 0.76, h * 0.64), radius: h * 0.33),
      )
      ..addRRect(
        RRect.fromLTRBR(
          w * 0.12,
          h * 0.55,
          w * 0.9,
          h * 0.98,
          Radius.circular(h * 0.25),
        ),
      );

    canvas.drawShadow(path, AppColors.darken(AppColors.cloud, 0.35), 6, false);
    final rect = Offset.zero & size;
    canvas.drawPath(
      path,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, AppColors.cloud],
        ).createShader(rect),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _HillsPainter extends CustomPainter {
  const _HillsPainter();

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final back = Path()
      ..moveTo(0, h * 0.55)
      ..quadraticBezierTo(w * 0.2, h * 0.05, w * 0.45, h * 0.4)
      ..quadraticBezierTo(w * 0.7, h * 0.0, w, h * 0.45)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close();
    canvas.drawPath(
      back,
      Paint()..color = AppColors.hill.withValues(alpha: 0.7),
    );

    final front = Path()
      ..moveTo(0, h * 0.8)
      ..quadraticBezierTo(w * 0.5, h * 0.45, w, h * 0.8)
      ..lineTo(w, h)
      ..lineTo(0, h)
      ..close();
    canvas.drawPath(
      front,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColors.lighten(AppColors.leaf, 0.12), AppColors.hill],
        ).createShader(Offset.zero & size),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
