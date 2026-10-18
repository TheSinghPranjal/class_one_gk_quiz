import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/animated_background.dart';
import '../../quiz/data/models/question.dart';
import '../../quiz/providers/questions_providers.dart';
import '../../rewards/providers/progress_provider.dart';
import '../../rewards/providers/rewards_provider.dart';
import '../../settings/providers/settings_provider.dart';
import '../math_lock.dart';

class ParentAreaScreen extends ConsumerStatefulWidget {
  const ParentAreaScreen({super.key});

  @override
  ConsumerState<ParentAreaScreen> createState() => _ParentAreaScreenState();
}

class _ParentAreaScreenState extends ConsumerState<ParentAreaScreen> {
  bool _unlocked = false;

  @override
  Widget build(BuildContext context) {
    if (!_unlocked) {
      return MathLock(onUnlocked: () => setState(() => _unlocked = true));
    }

    final sections = ref.watch(sectionsProvider);
    final progressAsync = ref.watch(progressProvider);
    final settings = ref.watch(settingsProvider);
    final allQuestionsAsync = ref.watch(allQuestionsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Parent Area')),
      body: AnimatedBackground(
        child: SafeArea(
          child: progressAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Something went wrong: $e')),
            data: (progress) {
              final accuracyBars = <BarChartGroupData>[];
              for (var i = 0; i < sections.length; i++) {
                final acc = progress.accuracyFor(sections[i].id);
                accuracyBars.add(
                  BarChartGroupData(x: i, barRods: [
                    BarChartRodData(
                      toY: acc * 100,
                      color: Color(sections[i].colorValue),
                      width: 10,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ]),
                );
              }

              final weakest = [...sections]..sort((a, b) =>
                  progress.accuracyFor(a.id).compareTo(progress.accuracyFor(b.id)));
              final weakestFew = weakest.take(3).toList();

              final questionsById = <String, Question>{
                for (final q in allQuestionsAsync.value ?? <Question>[])
                  q.id: q,
              };
              final mostMissed = progress.mostMissed.take(8).toList();

              return ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  Text('Progress by Section',
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 180,
                    child: BarChart(
                      BarChartData(
                        maxY: 100,
                        barGroups: accuracyBars,
                        titlesData: const FlTitlesData(
                          topTitles: AxisTitles(),
                          rightTitles: AxisTitles(),
                          bottomTitles: AxisTitles(),
                          leftTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: true, reservedSize: 32),
                          ),
                        ),
                        gridData: const FlGridData(show: true),
                        borderData: FlBorderData(show: false),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text('Weakest Topics',
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 8),
                  for (final s in weakestFew)
                    ListTile(
                      leading: Text(s.emoji, style: const TextStyle(fontSize: 22)),
                      title: Text(s.title),
                      trailing: Text(
                        '${(progress.accuracyFor(s.id) * 100).round()}%',
                      ),
                    ),
                  const SizedBox(height: 24),
                  Text('Most Missed Questions',
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 8),
                  if (mostMissed.isEmpty)
                    const Text('No mistakes recorded yet — great job!'),
                  for (final entry in mostMissed)
                    ListTile(
                      title: Text(
                        questionsById[entry.questionId]?.question ??
                            entry.questionId,
                      ),
                      trailing: Text('${entry.timesWrong}x'),
                    ),
                  const SizedBox(height: 24),
                  Text('Settings', style: Theme.of(context).textTheme.headlineSmall),
                  SwitchListTile(
                    title: const Text('Sound effects'),
                    value: settings.soundOn,
                    onChanged: (v) => ref.read(settingsProvider.notifier).setSoundOn(v),
                  ),
                  SwitchListTile(
                    title: const Text('Auto read-aloud'),
                    value: settings.autoReadAloud,
                    onChanged: (v) =>
                        ref.read(settingsProvider.notifier).setAutoReadAloud(v),
                  ),
                  SwitchListTile(
                    title: const Text('Timer in Quiz mode'),
                    value: settings.timerOn,
                    onChanged: (v) => ref.read(settingsProvider.notifier).setTimerOn(v),
                  ),
                  SwitchListTile(
                    title: const Text('Show only book questions'),
                    value: settings.bookOnlyMode,
                    onChanged: (v) =>
                        ref.read(settingsProvider.notifier).setBookOnlyMode(v),
                  ),
                  ListTile(
                    title: const Text('Speech speed'),
                    subtitle: Slider(
                      value: settings.speechSpeed,
                      min: 0.25,
                      max: 0.75,
                      onChanged: (v) =>
                          ref.read(settingsProvider.notifier).setSpeechSpeed(v),
                    ),
                  ),
                  ListTile(
                    title: const Text('Questions per quiz'),
                    trailing: DropdownButton<int>(
                      value: settings.questionsPerQuiz,
                      items: const [5, 10, 15]
                          .map((n) => DropdownMenuItem(value: n, child: Text('$n')))
                          .toList(),
                      onChanged: (v) {
                        if (v != null) {
                          ref.read(settingsProvider.notifier).setQuestionsPerQuiz(v);
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.error,
                      side: const BorderSide(color: AppColors.error),
                    ),
                    onPressed: () => _confirmReset(context, ref),
                    child: const Text('Reset All Progress'),
                  ),
                  const SizedBox(height: 24),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _confirmReset(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Reset all progress?'),
        content: const Text(
          'This will erase all stars, badges and quiz history. This cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Reset'),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await ref.read(progressProvider.notifier).resetProgress();
      ref.read(rewardsProvider.notifier).resetAll();
    }
  }
}
