import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

import 'models/question.dart';
import 'sections_data.dart';

/// Loads and caches question JSON assets bundled with the app.
class QuestionRepository {
  List<Question>? _cache;

  Future<List<Question>> loadAll() async {
    final cached = _cache;
    if (cached != null) return cached;

    final all = <Question>[];
    for (final section in kSections) {
      final raw = await rootBundle.loadString(
        'assets/questions/${section.id}.json',
      );
      final list = jsonDecode(raw) as List<dynamic>;
      for (final item in list) {
        all.add(Question.fromJson(item as Map<String, dynamic>));
      }
    }

    assert(_validate(all));
    _cache = all;
    return all;
  }

  bool _validate(List<Question> questions) {
    final seenIds = <String>{};
    for (final q in questions) {
      assert(q.options.length == 4, '${q.id} must have exactly 4 options');
      assert(q.options.toSet().length == 4, '${q.id} has duplicate options');
      assert(
        q.correctIndex >= 0 && q.correctIndex < 4,
        '${q.id} has an out-of-range correctIndex',
      );
      assert(seenIds.add(q.id), 'Duplicate question id: ${q.id}');
    }
    return true;
  }
}
