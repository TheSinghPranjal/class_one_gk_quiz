import '../../../core/theme/app_colors.dart';
import 'models/section.dart';

/// The fixed list of GK sections shown on the home map. Order here is the
/// order they appear on the adventure path.
const List<Section> kSections = [
  Section(
    id: 'animals',
    title: 'Animal World',
    emoji: '🦁',
    colorValue: 0xFFFF8A3D,
    mascotLine: "Let's meet some animals!",
  ),
  Section(
    id: 'birds-insects',
    title: 'Birds & Insects',
    emoji: '🦜',
    colorValue: 0xFF8BC34A,
    mascotLine: 'Ready to spot some birds and bugs?',
  ),
  Section(
    id: 'fruits-veggies',
    title: 'Fruits & Vegetables',
    emoji: '🍎',
    colorValue: 0xFFFF5A5F,
    mascotLine: "Let's munch on some tasty questions!",
  ),
  Section(
    id: 'my-body',
    title: 'My Body & Senses',
    emoji: '🖐️',
    colorValue: 0xFFFF7EB6,
    mascotLine: "Let's discover our amazing body!",
  ),
  Section(
    id: 'food-health',
    title: 'Food & Good Habits',
    emoji: '🥛',
    colorValue: 0xFFFFB300,
    mascotLine: 'Time to learn healthy habits!',
  ),
  Section(
    id: 'colours-shapes',
    title: 'Colours & Shapes',
    emoji: '🔺',
    colorValue: 0xFF9C6BFF,
    mascotLine: "Let's paint the world with shapes!",
  ),
  Section(
    id: 'numbers-time',
    title: 'Numbers, Days & Months',
    emoji: '🔢',
    colorValue: 0xFF38B6FF,
    mascotLine: "Let's count and explore time!",
  ),
  Section(
    id: 'family-home',
    title: 'My Family & Home',
    emoji: '🏠',
    colorValue: 0xFFF06292,
    mascotLine: 'Home sweet home, come on in!',
  ),
  Section(
    id: 'helpers',
    title: 'Community Helpers',
    emoji: '👮',
    colorValue: 0xFF3F7BFF,
    mascotLine: 'Meet the helpers of our community!',
  ),
  Section(
    id: 'transport',
    title: 'Transport',
    emoji: '🚂',
    colorValue: 0xFF14B8A6,
    mascotLine: 'All aboard for a transport adventure!',
  ),
  Section(
    id: 'nature-weather',
    title: 'Nature, Seasons & Weather',
    emoji: '🌦️',
    colorValue: 0xFF22C55E,
    mascotLine: "Let's explore nature and the weather!",
  ),
  Section(
    id: 'space',
    title: 'Sun, Moon & Stars',
    emoji: '🌙',
    colorValue: 0xFF5B5BD6,
    mascotLine: 'Blast off into outer space!',
  ),
  Section(
    id: 'india',
    title: 'Our India',
    emoji: '🇮🇳',
    colorValue: 0xFFFF9933,
    mascotLine: "Let's celebrate our incredible India!",
  ),
  Section(
    id: 'festivals',
    title: 'Festivals',
    emoji: '🪔',
    colorValue: 0xFFFFD23F,
    mascotLine: "It's festival time!",
  ),
  Section(
    id: 'sports-games',
    title: 'Sports & Games',
    emoji: '⚽',
    colorValue: 0xFF43A047,
    mascotLine: "Let's play and win!",
  ),
  Section(
    id: 'safety',
    title: 'Safety Rules',
    emoji: '🚦',
    colorValue: 0xFFE53935,
    mascotLine: 'Safety first, always!',
  ),
];

/// Sanity check: colours here must match [AppColors.sectionColors].
Section? sectionById(String id) {
  for (final s in kSections) {
    if (s.id == id) return s;
  }
  return null;
}
