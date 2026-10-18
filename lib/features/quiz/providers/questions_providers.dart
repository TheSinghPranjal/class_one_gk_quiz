import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utils/seeded_random.dart';
import '../data/models/question.dart';
import '../data/models/section.dart';
import '../data/question_repository.dart';
import '../data/sections_data.dart';

part 'questions_providers.g.dart';

@riverpod
List<Section> sections(Ref ref) => kSections;

@riverpod
QuestionRepository questionRepository(Ref ref) => QuestionRepository();

@riverpod
Future<List<Question>> allQuestions(Ref ref) async {
  final repo = ref.watch(questionRepositoryProvider);
  return repo.loadAll();
}

@riverpod
Future<List<Question>> questionsBySection(Ref ref, String sectionId) async {
  final all = await ref.watch(allQuestionsProvider.future);
  return all.where((q) => q.sectionId == sectionId).toList();
}

@riverpod
Future<List<Question>> questionsBySectionBookOnly(
  Ref ref,
  String sectionId,
) async {
  final all = await ref.watch(questionsBySectionProvider(sectionId).future);
  return all.where((q) => q.source == QuestionSource.book).toList()
    ..sort((a, b) => (a.page ?? 0).compareTo(b.page ?? 0));
}

/// 5 questions chosen the same way for every player on a given calendar day.
@riverpod
Future<List<Question>> dailyChallenge(Ref ref) async {
  final all = await ref.watch(allQuestionsProvider.future);
  final shuffled = [...all]..shuffle(todaySeededRandom());
  return shuffled.take(5).toList();
}
