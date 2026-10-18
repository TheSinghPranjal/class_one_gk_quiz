import 'package:flutter/material.dart';

/// Central colour palette for the whole app. No widget should hard-code a
/// colour value directly — add it here first.
abstract final class AppColors {
  static const Color background = Color(0xFFFFF8E7);
  static const Color surface = Colors.white;
  static const Color ink = Color(0xFF4A3B2A);
  static const Color inkMuted = Color(0xFF8A7A68);
  static const Color inkDeep = Color(0xFF2E1A0B);
  static const Color woodInk = Color(0xFF55361A);
  static const Color hintInk = Color(0xFF82455E);
  static const Color quizCream = Color(0xFFFCF3DF);

  static const Color primary = Color(0xFFFF7EB6);
  static const Color primaryDark = Color(0xFFE85FA0);

  static const Color success = Color(0xFF4CAF6D);
  static const Color successDark = Color(0xFF389156);
  static const Color error = Color(0xFFEF7A6C);
  static const Color errorDark = Color(0xFFD65E50);

  static const Color star = Color(0xFFFFC93C);
  static const Color starDark = Color(0xFFE0A800);

  // Claymorphism scene palette (section intro screen).
  static const Color clayCream = Color(0xFFFEF4E0);
  static const Color wood = Color(0xFFB8673A);
  static const Color woodLight = Color(0xFFE2A66E);
  static const Color leaf = Color(0xFF7CC26B);
  static const Color leafDark = Color(0xFF4E9A45);
  static const Color hill = Color(0xFFC9E4A3);
  static const Color sand = Color(0xFFF3D9A6);
  static const Color cloud = Color(0xFFE8F0FF);
  static const Color rock = Color(0xFFBDB6AE);

  // Play-mode card colours.
  static const Color modePractice = Color(0xFFFC7823);
  static const Color modeQuiz = Color(0xFFFAAF12);
  static const Color modeBook = Color(0xFFFD4A7E);

  static const List<Color> blobs = [
    Color(0xFFFFD6E8),
    Color(0xFFD6F5E8),
    Color(0xFFD6E8FF),
    Color(0xFFFFF0C2),
  ];

  /// Section accent colours, keyed by section id (see [Section]).
  static const Map<String, Color> sectionColors = {
    'animals': Color(0xFFFF8A3D),
    'birds-insects': Color(0xFF8BC34A),
    'fruits-veggies': Color(0xFFFF5A5F),
    'my-body': Color(0xFFFF7EB6),
    'food-health': Color(0xFFFFB300),
    'colours-shapes': Color(0xFF9C6BFF),
    'numbers-time': Color(0xFF38B6FF),
    'family-home': Color(0xFFF06292),
    'helpers': Color(0xFF3F7BFF),
    'transport': Color(0xFF14B8A6),
    'nature-weather': Color(0xFF22C55E),
    'space': Color(0xFF5B5BD6),
    'india': Color(0xFFFF9933),
    'festivals': Color(0xFFFFD23F),
    'sports-games': Color(0xFF43A047),
    'safety': Color(0xFFE53935),
  };

  static Color forSection(String sectionId) =>
      sectionColors[sectionId] ?? primary;

  /// Darker shade used for the chunky "candy button" bottom shadow.
  static Color darken(Color color, [double amount = 0.18]) {
    final hsl = HSLColor.fromColor(color);
    final l = (hsl.lightness - amount).clamp(0.0, 1.0);
    return hsl.withLightness(l).toColor();
  }

  /// Lighter shade used for clay highlights.
  static Color lighten(Color color, [double amount = 0.12]) {
    final hsl = HSLColor.fromColor(color);
    final l = (hsl.lightness + amount).clamp(0.0, 1.0);
    return hsl.withLightness(l).toColor();
  }
}
