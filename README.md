# GK Adventure

A bright, playful General Knowledge quiz app for Class 1 kids (ages 5-7) in
India. Built with Flutter + Riverpod, fully offline, runs on Android, iOS,
and the web.

## Running the app

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs   # generates *.g.dart / *.freezed.dart
flutter run                                                 # pick a device, or:
flutter run -d chrome                                       # web
flutter run -d <ios-simulator-id>                            # iOS simulator
```

The app is offline-only — no backend, no API keys, no network calls.

## Project layout

```
lib/
  main.dart              Hive/SharedPreferences bootstrap, ProviderScope
  app.dart                MaterialApp.router + theme
  core/
    theme/                 AppColors, AppTextStyles, AppTheme (Material 3, light-only)
    router/                go_router configuration (core/router/app_router.dart)
    services/               sound_service, tts_service, storage_service (Hive wrapper)
    utils/                  shuffle, seeded_random, scoring
    widgets/                CandyButton, AnimatedBackground, Mascot, StarBurst, SpeakerButton
  features/
    onboarding/            splash + name/avatar screen, profileProvider
    home/                   section map (adventure grid) + section_card widget
    quiz/
      data/                 Question/Section models (freezed+json_serializable), question_repository
      providers/            questions_providers, quiz_controller (Notifier), quiz_state
      presentation/          section_intro, quiz_screen, results_screen + widgets/
    rewards/                progress + rewards providers (Hive-backed), sticker book screen, badge popup
    parent/                 math-lock gate + parent dashboard (fl_chart, settings)
    settings/               settingsProvider (SharedPreferences-backed)
assets/
  questions/*.json         question bank, one file per section
  sounds/*.wav             short synthesized sound effects (tap, correct, wrong, sparkle, fanfare)
tool/
  extract_pdf.py            one-time PDF -> text extraction (pdfplumber)
  ocr_pdf.py                 OCR fallback for scanned PDFs (pytesseract + pdf2image)
  validate_questions.dart    validates the question bank (schema, duplicates, per-section counts)
source/                    original GK book PDFs + their extracted/OCR'd text
test/                      unit + widget tests
integration_test/          full golden-path test (onboarding -> quiz -> results) on a real engine
```

## The question bank

Every question lives in `assets/questions/<section-id>.json` as a flat JSON
array matching the `Question` model (`lib/features/quiz/data/models/question.dart`):

```json
{
  "id": "animals-001",
  "sectionId": "animals",
  "question": "Which animal is called the King of the Jungle?",
  "emoji": "👑",
  "options": ["Lion", "Tiger", "Elephant", "Bear"],
  "correctIndex": 0,
  "funFact": "A lion's roar can be heard 8 km away!",
  "difficulty": 1,
  "source": "generated",
  "page": null
}
```

- `options` must have exactly 4 entries, no duplicates, no "All of the
  above" / "None of these".
- `correctIndex` is the position of the right answer **in this file** — the
  app shuffles it at runtime (`core/utils/shuffle.dart`), so don't worry
  about always putting the answer first.
- `source` is `"book"` (came from one of the source PDFs — set `page` too)
  or `"generated"` (written to match the book's style/difficulty).
- `difficulty` is 1 (easiest) to 3 (hardest).

### Adding new questions

1. Open (or create) `assets/questions/<section-id>.json`.
2. Add an object matching the shape above, with a unique `id`
   (`<section-id>-NNN`).
3. Run the validator:
   ```bash
   dart run tool/validate_questions.dart
   ```
   It checks every file parses, every question has exactly 4 unique
   options, `correctIndex` is 0-3, there are no duplicate ids or duplicate
   question texts, and prints a book-vs-generated count per section.
4. If you add a brand-new section, also register it in
   `lib/features/quiz/data/sections_data.dart` (`kSections`) and give it a
   colour in `lib/core/theme/app_colors.dart` (`AppColors.sectionColors`).

### Re-running PDF extraction

The original source books live in `source/*.pdf`. Two of them are scanned
image PDFs with no text layer, so extraction is two steps:

```bash
# 1. Try direct text extraction first (fast, exact)
python3 -m venv .venv && source .venv/bin/activate   # optional but recommended
pip install pdfplumber
python3 tool/extract_pdf.py
# -> writes source/<name>.txt, and warns if a PDF looks scanned/has no text

# 2. For any PDF flagged as scanned, OCR it instead
pip install pytesseract pdf2image
brew install tesseract poppler   # (or apt-get on Linux) - needed by the two OCR libs above
python3 tool/ocr_pdf.py <pdf-stem-without-extension>
# -> writes source/<name>.ocr.txt
```

Then read the resulting `.txt`/`.ocr.txt` files and hand-convert any new
book questions into the JSON schema above (see "Adding new questions").
OCR text is noisy — always sanity-check numbers, spellings and national
symbols against a reliable source before adding a book-sourced question.

## Quality checks

```bash
flutter analyze                                   # must show 0 issues
dart run tool/validate_questions.dart              # question bank schema + counts
flutter test                                       # unit + widget tests
flutter test integration_test/app_test.dart -d <device-id>   # full golden-path run
```

Note: this app relies on `flutter_animate` in several places (the mascot,
the pulsing "Let's Play!" button, floating question emoji, `AnimatedBackground`'s
drifting blobs). Several of those animations loop forever by design, so
tests must use bounded `tester.pump(duration)` calls rather than
`tester.pumpAndSettle()`, which will spin until it hits its retry limit on
any screen with a looping animation.

## Building for release

```bash
flutter build apk --release     # Android APK
flutter build appbundle         # Android App Bundle (Play Store)
flutter build ios --release     # iOS (then archive via Xcode)
flutter build web               # Web build, output in build/web/
```

## Tech stack

Flutter (Material 3) · Riverpod (`flutter_riverpod` + `riverpod_annotation`
+ `riverpod_generator`, code-generated `@riverpod` providers) · `freezed` +
`json_serializable` for models · `go_router` for navigation · `hive_ce` for
progress/stars/badges/history, `shared_preferences` for settings/profile ·
`flutter_animate` + `confetti` for motion · `audioplayers` for sound effects
· `flutter_tts` for read-aloud · `google_fonts` (Baloo 2 / Nunito) ·
`fl_chart` for the parent dashboard.

Everything is local — no backend, no accounts, no network access required.
