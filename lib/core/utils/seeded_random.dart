import 'dart:math';

/// A [Random] seeded by today's date, so every player sees the same
/// "Daily Challenge" questions on a given day.
Random todaySeededRandom([DateTime? now]) {
  final date = now ?? DateTime.now();
  final seed = date.year * 10000 + date.month * 100 + date.day;
  return Random(seed);
}
