import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/theme/app_colors.dart';
import '../providers/profile_provider.dart';

/// Sprite for each entry in [kAvatarEmojis], in the same order.
const List<String> _kAvatarSprites = [
  'assets/images/onboarding/avatar_lion.png',
  'assets/images/onboarding/avatar_panda.png',
  'assets/images/onboarding/avatar_monkey.png',
  'assets/images/onboarding/avatar_fox.png',
  'assets/images/onboarding/avatar_rabbit.png',
  'assets/images/onboarding/avatar_dog.png',
  'assets/images/onboarding/avatar_cat.png',
  'assets/images/onboarding/avatar_tiger.png',
];

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  // Pixel size of the illustrated background, and where the live widgets sit
  // inside it. The owl, sign and "Pick your avatar!" label are baked into the
  // art; the name field, avatars and button are drawn on top.
  static const _artSize = Size(818, 1698);
  static const _fieldRect = Rect.fromLTWH(46, 687, 730, 103);
  static const _buttonRect = Rect.fromLTWH(156, 1317, 510, 134);
  static const _avatarRadius = 76.0;
  static const _avatarColumns = [147.0, 323.0, 499.0, 675.0];
  static const _avatarRows = [1015.5, 1189.0];

  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  String _selectedAvatar = kAvatarEmojis.first;
  int _nudge = 0;

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _start() {
    final name = _controller.text.trim();
    if (name.isEmpty) {
      HapticFeedback.mediumImpact();
      setState(() => _nudge++);
      _focusNode.requestFocus();
      return;
    }
    HapticFeedback.lightImpact();
    ref
        .read(profileProvider.notifier)
        .save(name: name, avatarEmoji: _selectedAvatar);
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.sizeOf(context);
    // Phones crop the art edge-to-edge; tablets show all of it on cream.
    final fit = screen.aspectRatio > 0.56 ? BoxFit.contain : BoxFit.cover;

    return Scaffold(
      backgroundColor: AppColors.quizCream,
      // The art is laid out at a fixed size; the keyboard just covers the
      // lower half while the name field stays visible above it.
      resizeToAvoidBottomInset: false,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => FocusScope.of(context).unfocus(),
          child: SizedBox.expand(
            child: FittedBox(
              fit: fit,
              child: SizedBox.fromSize(
                size: _artSize,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Semantics(
                        header: true,
                        label: "Hi there! What's your name? Pick your avatar!",
                        child: Image.asset(
                          'assets/images/onboarding/background.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Positioned.fromRect(
                      rect: _fieldRect,
                      child:
                          _NameField(
                                controller: _controller,
                                focusNode: _focusNode,
                                onChanged: () => setState(() {}),
                                onSubmitted: _start,
                              )
                              .animate(
                                key: ValueKey(_nudge),
                                autoPlay: _nudge > 0,
                              )
                              .shakeX(hz: 5, amount: 10, duration: 450.ms),
                    ),
                    for (var i = 0; i < kAvatarEmojis.length; i++)
                      Positioned(
                        left: _avatarColumns[i % 4] - _avatarRadius,
                        top: _avatarRows[i ~/ 4] - _avatarRadius,
                        child: _AvatarChoice(
                          emoji: kAvatarEmojis[i],
                          sprite: _kAvatarSprites[i],
                          radius: _avatarRadius,
                          selected: kAvatarEmojis[i] == _selectedAvatar,
                          onTap: () {
                            HapticFeedback.selectionClick();
                            setState(() => _selectedAvatar = kAvatarEmojis[i]);
                          },
                        ),
                      ),
                    Positioned.fromRect(
                      rect: _buttonRect,
                      child: _StartButton(onPressed: _start),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NameField extends StatelessWidget {
  const _NameField({
    required this.controller,
    required this.focusNode,
    required this.onChanged,
    required this.onSubmitted,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onChanged;
  final VoidCallback onSubmitted;

  @override
  Widget build(BuildContext context) {
    const radius = BorderRadius.all(Radius.circular(52));
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: radius,
        border: Border.all(color: AppColors.nameFieldBorder, width: 3.5),
        boxShadow: [
          BoxShadow(
            color: AppColors.woodInk.withValues(alpha: 0.12),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 96),
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              textAlign: TextAlign.center,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.done,
              maxLength: 20,
              cursorColor: AppColors.avatarRing,
              cursorWidth: 4,
              cursorHeight: 48,
              style: GoogleFonts.nunito(
                fontSize: 42,
                fontWeight: FontWeight.w600,
                color: AppColors.ink,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: '',
                isCollapsed: true,
              ),
              onChanged: (_) => onChanged(),
              onSubmitted: (_) => onSubmitted(),
            ),
          ),
          if (controller.text.isNotEmpty)
            Positioned(
              right: 30,
              child: Semantics(
                button: true,
                label: 'Clear name',
                child: GestureDetector(
                  onTap: () {
                    controller.clear();
                    onChanged();
                  },
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: const BoxDecoration(
                      color: AppColors.clearButton,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.close_rounded,
                      color: AppColors.surface,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _AvatarChoice extends StatelessWidget {
  const _AvatarChoice({
    required this.emoji,
    required this.sprite,
    required this.radius,
    required this.selected,
    required this.onTap,
  });

  final String emoji;
  final String sprite;
  final double radius;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      selected: selected,
      label: 'Avatar $emoji',
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: radius * 2,
          height: radius * 2,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: AppColors.surface,
            shape: BoxShape.circle,
            boxShadow: [
              if (selected)
                const BoxShadow(color: AppColors.avatarRing, spreadRadius: 7),
              BoxShadow(
                color: AppColors.woodInk.withValues(alpha: 0.12),
                blurRadius: 14,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Image.asset(sprite),
        ).animate(target: selected ? 1 : 0).scale(
              begin: const Offset(1, 1),
              end: const Offset(1.06, 1.06),
              curve: Curves.easeOutBack,
            ),
      ),
    );
  }
}

class _StartButton extends StatefulWidget {
  const _StartButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  State<_StartButton> createState() => _StartButtonState();
}

class _StartButtonState extends State<_StartButton> {
  bool _pressed = false;

  void _setPressed(bool value) {
    if (_pressed == value) return;
    setState(() => _pressed = value);
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Start Playing',
      child: GestureDetector(
        onTapDown: (_) => _setPressed(true),
        onTapUp: (_) {
          _setPressed(false);
          widget.onPressed();
        },
        onTapCancel: () => _setPressed(false),
        child: AnimatedScale(
          scale: _pressed ? 0.95 : 1,
          duration: const Duration(milliseconds: 90),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(67),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryDark.withValues(alpha: 0.35),
                  blurRadius: 22,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Image.asset(
              'assets/images/onboarding/start_button.png',
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
