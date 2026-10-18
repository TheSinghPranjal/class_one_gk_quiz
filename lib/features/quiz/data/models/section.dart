import 'package:freezed_annotation/freezed_annotation.dart';

part 'section.freezed.dart';

@freezed
abstract class Section with _$Section {
  const factory Section({
    required String id,
    required String title,
    required String emoji,
    required int colorValue,
    required String mascotLine,
  }) = _Section;
}
