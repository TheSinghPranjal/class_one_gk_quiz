import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/settings/providers/settings_provider.dart';
import '../services/tts_service.dart';
import '../theme/app_colors.dart';

/// A round speaker icon button that reads [text] aloud using [TtsService].
class SpeakerButton extends ConsumerWidget {
  const SpeakerButton({super.key, required this.text, this.size = 44});

  final String text;
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!ref.watch(settingsProvider.select((s) => s.autoReadAloud))) {
      return const SizedBox.shrink();
    }
    return Semantics(
      button: true,
      label: 'Read aloud',
      child: Material(
        color: AppColors.primary.withValues(alpha: 0.15),
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: () => ref.read(ttsServiceProvider).speak(text),
          child: SizedBox(
            width: size,
            height: size,
            child: Icon(
              Icons.volume_up_rounded,
              color: AppColors.primaryDark,
              size: size * 0.6,
            ),
          ),
        ),
      ),
    );
  }
}
