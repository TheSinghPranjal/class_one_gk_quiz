import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/services/sound_service.dart';
import '../../../core/services/tts_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/candy_button.dart';
import '../../../core/widgets/mascot.dart';
import '../../onboarding/providers/profile_provider.dart';
import '../../settings/providers/settings_provider.dart';
import '../data/sections_data.dart';
import '../providers/quiz_controller.dart';
import '../providers/quiz_state.dart';
import 'widgets/fun_fact_card.dart';
import 'widgets/option_button.dart';
import 'widgets/progress_dots.dart';
import 'widgets/question_card.dart';

const _praiseLines = [
  'Super!',
  'Well done!',
  "You're a star!",
  'Shabash!',
  'Brilliant!',
  'Amazing job!',
];

class QuizScreen extends ConsumerStatefulWidget {
  const QuizScreen({
    super.key,
    required this.sectionId,
    required this.mode,
    this.retryQuestionIds,
  });

  final String sectionId;
  final QuizMode mode;
  final List<String>? retryQuestionIds;

  @override
  ConsumerState<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends ConsumerState<QuizScreen> {
  late final ConfettiController _confetti;
  final _random = Random();
  bool _started = false;

  @override
  void initState() {
    super.initState();
    _confetti = ConfettiController(duration: const Duration(seconds: 2));
    WidgetsBinding.instance.addPostFrameCallback((_) => _start());
  }

  Future<void> _start() async {
    final retryIds = widget.retryQuestionIds;
    if (retryIds != null && retryIds.isNotEmpty) {
      await ref
          .read(quizControllerProvider.notifier)
          .startSpecificQuestions(
            retryIds,
            widget.mode,
            sectionId: widget.sectionId,
          );
    } else {
      await ref
          .read(quizControllerProvider.notifier)
          .start(widget.sectionId, widget.mode);
    }
    if (mounted) setState(() => _started = true);
  }

  @override
  void dispose() {
    _confetti.dispose();
    super.dispose();
  }

  Future<bool> _confirmExit() async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: const Text('Leave the quiz?'),
        content: const Text("Your progress on this quiz won't be saved."),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Keep Playing'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Leave'),
          ),
        ],
      ),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final section = widget.sectionId == 'mix' || widget.sectionId == 'daily'
        ? null
        : sectionById(widget.sectionId);
    final accentColor = section != null
        ? Color(section.colorValue)
        : AppColors.primary;
    final profileName = ref.watch(profileProvider).name;
    final title =
        section?.title ??
        (widget.sectionId == 'daily' ? 'Daily Challenge' : 'Surprise Mix');

    ref.listen<QuizState>(quizControllerProvider, (previous, next) {
      final soundService = ref.read(soundServiceProvider);
      if (previous?.status != next.status) {
        switch (next.status) {
          case QuizAnswerStatus.correct:
            soundService.play(SoundEffect.correctChime);
            _confetti.play();
            final line = _praiseLines[_random.nextInt(_praiseLines.length)];
            if (ref.read(settingsProvider).autoReadAloud) {
              ref.read(ttsServiceProvider).speak(line);
            }
          case QuizAnswerStatus.wrong:
            soundService.play(SoundEffect.wrongBoing);
          case QuizAnswerStatus.finished:
            soundService.play(SoundEffect.levelUpFanfare);
            final state = ref.read(quizControllerProvider);
            final sectionId =
                ref.read(quizControllerProvider.notifier).sectionId ??
                widget.sectionId;
            context.pushReplacement(
              '/results',
              extra: {
                'sectionId': sectionId,
                'mode': widget.mode.name,
                'score': state.score,
                'total': state.questions.length,
                'newBadges': state.newlyUnlockedBadges,
                'wrongQuestionIds': state.wrongQuestionIds,
              },
            );
          case QuizAnswerStatus.answering:
            break;
        }
      } else if (next.status == QuizAnswerStatus.answering &&
          next.eliminatedOptions.isNotEmpty &&
          previous?.eliminatedOptions.length != next.eliminatedOptions.length) {
        soundService.play(SoundEffect.tapPop);
      }
    });

    final state = ref.watch(quizControllerProvider);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        if (await _confirmExit() && context.mounted) {
          context.pop();
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.quizCream,
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Image.asset(
                'assets/images/quiz/ground.png',
                fit: BoxFit.fitWidth,
              ),
            ),
            !_started || state.questions.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : _QuizBody(
                    title: title,
                    state: state,
                    accentColor: accentColor,
                    profileName: profileName,
                  ),
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _confetti,
                blastDirection: pi / 2,
                numberOfParticles: 16,
                maxBlastForce: 12,
                minBlastForce: 6,
                gravity: 0.25,
                shouldLoop: false,
                colors: const [
                  AppColors.primary,
                  AppColors.success,
                  AppColors.star,
                  AppColors.starDark,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuizBody extends ConsumerWidget {
  const _QuizBody({
    required this.title,
    required this.state,
    required this.accentColor,
    required this.profileName,
  });

  final String title;
  final QuizState state;
  final Color accentColor;
  final String profileName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final question = state.currentQuestion;
    if (question == null) return const SizedBox.shrink();

    final controller = ref.read(quizControllerProvider.notifier);
    final answered = state.status != QuizAnswerStatus.answering;
    final readAloud = [
      question.question.question,
      for (var i = 0; i < question.shuffledOptions.length; i++)
        '${kOptionLetters[i]}. ${question.shuffledOptions[i]}',
    ].join('. ');

    final width = MediaQuery.sizeOf(context).width;

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: width * _groundAspect * 0.6),
            child: Column(
              children: [
                _QuizScene(
                  title: title,
                  emoji: question.question.emoji,
                  state: state,
                  accentColor: accentColor,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 19),
                  child: Column(
                    children: [
                      Transform.translate(
                        offset: const Offset(0, -8),
                        child: QuestionCard(
                          question: question.question.question,
                          readAloudText: readAloud,
                        ),
                      ),
                      const SizedBox(height: 6),
                      LayoutBuilder(
                        builder: (context, constraints) {
                          final wide = constraints.maxWidth > 480;
                          final options = List.generate(
                            question.shuffledOptions.length,
                            (i) => OptionButton(
                              index: i,
                              label: question.shuffledOptions[i],
                              emoji: question.shuffledOptionEmojis?[i],
                              state: _visualState(
                                state,
                                i,
                                question.correctIndex,
                              ),
                              onTap: answered
                                  ? null
                                  : () => controller.selectOption(i),
                            ),
                          );
                          if (!wide) {
                            return Column(
                              children: [
                                for (final o in options)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 14),
                                    child: o,
                                  ),
                              ],
                            );
                          }
                          return GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 2,
                            mainAxisSpacing: 14,
                            crossAxisSpacing: 12,
                            childAspectRatio: 3.2,
                            children: options,
                          );
                        },
                      ),
                      const SizedBox(height: 10),
                      if (!answered &&
                          state.hintsAllowed &&
                          !state.hintUsedForQuestion)
                        _HintPill(onTap: controller.useHint),
                      if (answered) ...[
                        const SizedBox(height: 8),
                        if (state.status == QuizAnswerStatus.correct)
                          const Mascot(mood: MascotMood.cheering, size: 72)
                        else
                          const Mascot(mood: MascotMood.sad, size: 72),
                        const SizedBox(height: 8),
                        Text(
                          state.status == QuizAnswerStatus.correct
                              ? (profileName.isEmpty
                                    ? 'Well done!'
                                    : 'Well done, $profileName!')
                              : 'Oops! Good try!',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 16),
                        FunFactCard(funFact: question.question.funFact),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // Pinned outside the scroll view so it's always reachable, even if
        // the fun fact card pushes the question content taller than the
        // screen.
        if (answered)
          Padding(
            padding: EdgeInsets.fromLTRB(
              20,
              0,
              20,
              20 + MediaQuery.paddingOf(context).bottom,
            ),
            child: CandyButton(
              width: double.infinity,
              color: accentColor,
              onPressed: controller.next,
              child: Text(state.isLastQuestion ? 'Finish 🏁' : 'Next ➜'),
            ),
          ),
      ],
    );
  }

  OptionVisualState _visualState(QuizState state, int index, int correctIndex) {
    if (state.status == QuizAnswerStatus.answering) {
      return state.eliminatedOptions.contains(index)
          ? OptionVisualState.eliminated
          : OptionVisualState.normal;
    }
    if (index == correctIndex) {
      return state.selectedIndex == index
          ? OptionVisualState.selectedCorrect
          : OptionVisualState.revealedCorrect;
    }
    if (state.selectedIndex == index) {
      return OptionVisualState.selectedWrong;
    }
    return state.eliminatedOptions.contains(index)
        ? OptionVisualState.eliminated
        : OptionVisualState.normal;
  }
}

class _TimerBar extends StatelessWidget {
  const _TimerBar({required this.secondsLeft, required this.color});

  final int secondsLeft;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final ratio = (secondsLeft / kSecondsPerQuestion).clamp(0.0, 1.0);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 10,
        width: double.infinity,
        color: Colors.white,
        alignment: Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: ratio,
          child: Container(color: ratio > 0.3 ? color : AppColors.error),
        ),
      ),
    );
  }
}

// The scene artwork is 821px wide; overlay positions below are measured
// against it so they stay aligned at any screen width.
const _sceneWidth = 821.0;
const _sceneHeight = 580.0;
const _groundAspect = 218 / 821;

/// Painted header: hanging wooden sign with the section title, back button,
/// progress dots, and the question's picture standing on the grassy hill.
class _QuizScene extends StatelessWidget {
  const _QuizScene({
    required this.title,
    required this.emoji,
    required this.state,
    required this.accentColor,
  });

  final String title;
  final String? emoji;
  final QuizState state;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final scale = width / _sceneWidth;
    final height = _sceneHeight * scale;
    final reduceMotion = MediaQuery.of(context).disableAnimations;

    Widget picture = Text(
      emoji ?? '❓',
      style: TextStyle(fontSize: 250 * scale, height: 1),
    );
    if (!reduceMotion) {
      picture = picture
          .animate(onPlay: (c) => c.repeat(reverse: true))
          .moveY(begin: 0, end: -6, duration: 1600.ms, curve: Curves.easeInOut);
    }

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/quiz/scene.png',
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            left: 230 * scale,
            right: (_sceneWidth - 592) * scale,
            top: 134 * scale,
            height: 74 * scale,
            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  title,
                  style:
                      AppTextStyles.heading(
                        fontSize: 28,
                        color: AppColors.woodInk,
                        weight: FontWeight.w800,
                      ).copyWith(
                        shadows: const [
                          Shadow(
                            color: Color(0x66FFE2B0),
                            offset: Offset(0, 1.5),
                          ),
                        ],
                      ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 34 * scale,
            top: 151 * scale,
            child: _BackButton(size: 78 * scale),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 268 * scale,
            child: Column(
              children: [
                ProgressDots(
                  total: state.questions.length,
                  currentIndex: state.currentIndex,
                  color: AppColors.modePractice,
                ),
                if (state.isTimed && state.secondsLeft != null) ...[
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 180,
                    child: _TimerBar(
                      secondsLeft: state.secondsLeft!,
                      color: accentColor,
                    ),
                  ),
                ],
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: (_sceneHeight - 552) * scale,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(left: 20 * scale),
                child: picture,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Back',
      child: GestureDetector(
        onTap: () => Navigator.of(context).maybePop(),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(size * 0.3),
            border: Border.all(color: const Color(0xFFF5E1BC), width: 2),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFD9C29A).withValues(alpha: 0.5),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.inkDeep,
            size: size * 0.48,
          ),
        ),
      ),
    );
  }
}

class _HintPill extends StatelessWidget {
  const _HintPill({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 42,
          padding: const EdgeInsets.symmetric(horizontal: 22),
          decoration: BoxDecoration(
            color: const Color(0xFFFDF0D5),
            borderRadius: BorderRadius.circular(21),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFFE9D3AE).withValues(alpha: 0.5),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('💡', style: TextStyle(fontSize: 22)),
              const SizedBox(width: 12),
              Text(
                'Hint: remove two wrong answers',
                style: AppTextStyles.heading(
                  fontSize: 16,
                  color: AppColors.hintInk,
                  weight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
