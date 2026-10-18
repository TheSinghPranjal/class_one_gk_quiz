import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/tts_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../settings/providers/settings_provider.dart';

/// White rounded card with the question text and a pink read-aloud button.
class QuestionCard extends ConsumerWidget {
  const QuestionCard({
    super.key,
    required this.question,
    required this.readAloudText,
  });

  final String question;
  final String readAloudText;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readAloudOn = ref.watch(
      settingsProvider.select((s) => s.autoReadAloud),
    );
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 77),
      padding: const EdgeInsets.fromLTRB(20, 10, 16, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFD9C29A).withValues(alpha: 0.45),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
          const BoxShadow(color: Color(0xFFF1E6D3), offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        children: [
          // Balances the speaker so the text sits in the card's centre.
          if (readAloudOn) const SizedBox(width: 30),
          Expanded(
            child: Text(
              question,
              textAlign: TextAlign.center,
              style: AppTextStyles.heading(
                fontSize: 23,
                color: AppColors.inkDeep,
                weight: FontWeight.w800,
              ).copyWith(height: 1.25),
            ),
          ),
          if (readAloudOn) ...[
            const SizedBox(width: 10),
            _PinkSpeaker(text: readAloudText),
          ],
        ],
      ),
    );
  }
}

class _PinkSpeaker extends ConsumerWidget {
  const _PinkSpeaker({required this.text});

  final String text;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Semantics(
      button: true,
      label: 'Read aloud',
      child: Material(
        color: const Color(0xFFFEE3EE),
        shape: const CircleBorder(),
        child: InkWell(
          customBorder: const CircleBorder(),
          onTap: () => ref.read(ttsServiceProvider).speak(text),
          child: const SizedBox(
            width: 44,
            height: 44,
            child: Icon(
              Icons.volume_up_rounded,
              color: Color(0xFFE91E7A),
              size: 26,
            ),
          ),
        ),
      ),
    );
  }
}
