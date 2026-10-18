import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/services/storage_service.dart';
import 'progress_state.dart';

part 'progress_provider.g.dart';

@Riverpod(keepAlive: true)
class Progress extends _$Progress {
  @override
  Future<ProgressData> build() async {
    final storage = ref.watch(hiveStorageProvider);
    final json = storage.readJson(kProgressKey);
    if (json == null) return const ProgressData();
    return ProgressData.fromJson(json);
  }

  Future<void> _persist(ProgressData data) async {
    final storage = ref.read(hiveStorageProvider);
    await storage.writeJson(kProgressKey, data.toJson());
    state = AsyncData(data);
  }

  /// Records the outcome of answering [questionId] in [sectionId].
  Future<void> recordAnswer({
    required String sectionId,
    required String questionId,
    required bool correct,
  }) async {
    final current = state.value ?? const ProgressData();
    final section = current.progressFor(sectionId);

    final updatedSection = section.copyWith(
      attemptCount: section.attemptCount + 1,
      correctCount: section.correctCount + (correct ? 1 : 0),
      masteredQuestionIds: correct
          ? {...section.masteredQuestionIds, questionId}
          : section.masteredQuestionIds,
    );

    final wrongKey = questionId;
    final wrongAnswers = <String, WrongAnswerEntry>{...current.wrongAnswers};
    if (!correct) {
      final existing = wrongAnswers[wrongKey];
      wrongAnswers[wrongKey] = WrongAnswerEntry(
        questionId: questionId,
        sectionId: sectionId,
        timesWrong: (existing?.timesWrong ?? 0) + 1,
      );
    }

    final updated = current.copyWith(
      bySection: {...current.bySection, sectionId: updatedSection},
      wrongAnswers: wrongAnswers,
    );
    await _persist(updated);
  }

  Future<void> recordQuizStars(String sectionId, int stars) async {
    final current = state.value ?? const ProgressData();
    final section = current.progressFor(sectionId);
    if (stars <= section.bestStars) return;
    final updated = current.copyWith(
      bySection: {
        ...current.bySection,
        sectionId: section.copyWith(bestStars: stars),
      },
    );
    await _persist(updated);
  }

  Future<void> resetProgress() async {
    await _persist(const ProgressData());
  }
}
