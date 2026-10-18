import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/animated_background.dart';
import '../../../core/widgets/candy_button.dart';
import '../../../core/widgets/mascot.dart';
import '../providers/profile_provider.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _controller = TextEditingController();
  String? _selectedAvatar;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _canContinue =>
      _controller.text.trim().isNotEmpty && _selectedAvatar != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Column(
              children: [
                const Mascot(mood: MascotMood.happy, size: 100),
                const SizedBox(height: 16),
                Text(
                  "Hi there! What's your name?",
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _controller,
                  textAlign: TextAlign.center,
                  textCapitalization: TextCapitalization.words,
                  style: Theme.of(context).textTheme.bodyLarge,
                  decoration: InputDecoration(
                    hintText: 'Type your name',
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onChanged: (_) => setState(() {}),
                ),
                const SizedBox(height: 32),
                Text(
                  'Pick your avatar!',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 14,
                  runSpacing: 14,
                  alignment: WrapAlignment.center,
                  children: [
                    for (final emoji in kAvatarEmojis)
                      _AvatarChoice(
                        emoji: emoji,
                        selected: emoji == _selectedAvatar,
                        onTap: () => setState(() => _selectedAvatar = emoji),
                      ),
                  ],
                ),
                const SizedBox(height: 40),
                CandyButton(
                  width: 220,
                  enabled: _canContinue,
                  onPressed: _canContinue
                      ? () {
                          ref.read(profileProvider.notifier).save(
                                name: _controller.text.trim(),
                                avatarEmoji: _selectedAvatar!,
                              );
                          context.go('/home');
                        }
                      : null,
                  child: const Text('Start Playing! 🚀'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AvatarChoice extends StatelessWidget {
  const _AvatarChoice({
    required this.emoji,
    required this.selected,
    required this.onTap,
  });

  final String emoji;
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
          width: 64,
          height: 64,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(
              color: selected ? AppColors.primary : Colors.transparent,
              width: 3,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.ink.withValues(alpha: 0.10),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Text(emoji, style: const TextStyle(fontSize: 32)),
        ).animate(target: selected ? 1 : 0).scale(
              begin: const Offset(1, 1),
              end: const Offset(1.12, 1.12),
              curve: Curves.easeOutBack,
            ),
      ),
    );
  }
}
