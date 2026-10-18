// Validates every JSON file in assets/questions/:
//   - it parses into the Question model
//   - every question has exactly 4 unique options
//   - correctIndex is 0-3
//   - there are no duplicate ids or duplicate question texts (globally)
//   - each section has at least 20 questions
//
// Run with: dart run tool/validate_questions.dart
// ignore_for_file: avoid_print
import 'dart:convert';
import 'dart:io';

import 'package:class_one_gk_quiz/features/quiz/data/models/question.dart';

// Kept as a plain, Flutter-free list (not importing sections_data.dart) so
// this script also runs with the bare `dart run`, not just `flutter run`.
const List<String> kExpectedSectionIds = [
  'animals',
  'birds-insects',
  'fruits-veggies',
  'my-body',
  'food-health',
  'colours-shapes',
  'numbers-time',
  'family-home',
  'helpers',
  'transport',
  'nature-weather',
  'space',
  'india',
  'festivals',
  'sports-games',
  'safety',
];

Future<void> main() async {
  var hasErrors = false;
  final seenIds = <String, String>{}; // id -> file
  final seenQuestionTexts = <String, String>{}; // normalised text -> id
  final countsBySection = <String, int>{};
  final bookCountsBySection = <String, int>{};
  final generatedCountsBySection = <String, int>{};

  for (final sectionId in kExpectedSectionIds) {
    final file = File('assets/questions/$sectionId.json');
    if (!file.existsSync()) {
      print('ERROR: missing assets/questions/$sectionId.json');
      hasErrors = true;
      continue;
    }

    final raw = await file.readAsString();
    List<dynamic> list;
    try {
      list = jsonDecode(raw) as List<dynamic>;
    } catch (e) {
      print('ERROR: ${file.path} is not valid JSON: $e');
      hasErrors = true;
      continue;
    }

    for (final item in list) {
      late Question q;
      try {
        q = Question.fromJson(item as Map<String, dynamic>);
      } catch (e) {
        print(
          'ERROR: ${file.path} has a question that does not match the '
          'Question model: $e',
        );
        hasErrors = true;
        continue;
      }

      if (q.sectionId != sectionId) {
        print(
          'ERROR: ${q.id} has sectionId "${q.sectionId}" but lives in '
          '${file.path}',
        );
        hasErrors = true;
      }
      if (q.options.length != 4) {
        print('ERROR: ${q.id} does not have exactly 4 options');
        hasErrors = true;
      }
      if (q.options.toSet().length != q.options.length) {
        print('ERROR: ${q.id} has duplicate options');
        hasErrors = true;
      }
      if (q.correctIndex < 0 || q.correctIndex > 3) {
        print(
          'ERROR: ${q.id} has an out-of-range correctIndex '
          '(${q.correctIndex})',
        );
        hasErrors = true;
      }
      if (seenIds.containsKey(q.id)) {
        print(
          'ERROR: duplicate id "${q.id}" in ${file.path} '
          '(already seen in ${seenIds[q.id]})',
        );
        hasErrors = true;
      } else {
        seenIds[q.id] = file.path;
      }

      final normalisedText = q.question.trim().toLowerCase();
      if (seenQuestionTexts.containsKey(normalisedText)) {
        print(
          'ERROR: duplicate question text for "${q.id}" '
          '(matches "${seenQuestionTexts[normalisedText]}")',
        );
        hasErrors = true;
      } else {
        seenQuestionTexts[normalisedText] = q.id;
      }

      countsBySection.update(sectionId, (v) => v + 1, ifAbsent: () => 1);
      if (q.source == QuestionSource.book) {
        bookCountsBySection.update(sectionId, (v) => v + 1, ifAbsent: () => 1);
      } else {
        generatedCountsBySection.update(
          sectionId,
          (v) => v + 1,
          ifAbsent: () => 1,
        );
      }
    }
  }

  print('\nSection            | Total | Book | Generated');
  print('--------------------|-------|------|----------');
  var totalAll = 0;
  var totalBook = 0;
  var totalGenerated = 0;
  for (final sectionId in kExpectedSectionIds) {
    final total = countsBySection[sectionId] ?? 0;
    final book = bookCountsBySection[sectionId] ?? 0;
    final generated = generatedCountsBySection[sectionId] ?? 0;
    totalAll += total;
    totalBook += book;
    totalGenerated += generated;
    final warn = total < 20 ? '  <-- needs at least 20' : '';
    print(
      '${sectionId.padRight(19)} | ${total.toString().padLeft(5)} | '
      '${book.toString().padLeft(4)} | ${generated.toString().padLeft(9)}'
      '$warn',
    );
    if (total < 20) hasErrors = true;
  }
  print('--------------------|-------|------|----------');
  print(
    '${'TOTAL'.padRight(19)} | ${totalAll.toString().padLeft(5)} | '
    '${totalBook.toString().padLeft(4)} | '
    '${totalGenerated.toString().padLeft(9)}',
  );

  if (hasErrors) {
    print('\nValidation FAILED.');
    exit(1);
  } else {
    print('\nValidation passed.');
  }
}
