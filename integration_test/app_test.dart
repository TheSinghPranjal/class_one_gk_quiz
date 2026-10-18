// Drives the real golden path end to end on a real engine (Chrome or a
// device/simulator): onboarding -> home map -> section intro -> a full
// quiz -> results. Run with:
//   flutter test integration_test/app_test.dart -d chrome
//   flutter test integration_test/app_test.dart -d <simulator-id>
import 'package:class_one_gk_quiz/app.dart';
import 'package:class_one_gk_quiz/core/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('play a full quiz from onboarding to results', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          hiveStorageProvider.overrideWithValue(HiveStorageService.inMemory()),
          sharedPreferencesProvider.overrideWithValue(prefs),
        ],
        child: const App(),
      ),
    );
    // NOTE: the splash screen has a perpetually-pulsing button, so
    // pumpAndSettle() would spin forever waiting for animations to stop.
    // Use bounded pumps on every screen that has a looping animation.
    await tester.pump(const Duration(seconds: 2));

    // Splash -> onboarding (no profile yet).
    expect(find.byKey(const ValueKey('lets-play')), findsOneWidget);
    await tester.tap(find.byKey(const ValueKey('lets-play')));
    await tester.pump(const Duration(seconds: 1));

    // Onboarding: type a name and pick an avatar.
    expect(find.text("Hi there! What's your name?"), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'Ananya');
    await tester.pump(const Duration(milliseconds: 500));
    await tester.tap(find.text('🦁'));
    await tester.pump(const Duration(milliseconds: 500));
    await tester.tap(find.text('Start Playing! 🚀'));
    await tester.pump(const Duration(seconds: 1));

    // Home: open the Animal World section.
    expect(find.text('Animal World'), findsOneWidget);
    await tester.tap(find.text('Animal World'));
    await tester.pump(const Duration(seconds: 1));

    // Section intro: start Quiz mode.
    expect(find.text('Quiz'), findsOneWidget);
    await tester.tap(find.text('Quiz'));
    await tester.pump(const Duration(seconds: 1));

    // Answer every question (tap option A each time) until results appear.
    var guard = 0;
    while (find.text('Quiz Complete!').evaluate().isEmpty && guard < 20) {
      guard++;
      final optionA = find.text('A').first;
      await tester.tap(optionA);
      await tester.pump(const Duration(milliseconds: 900));

      final finishButton = find.text('Finish 🏁');
      final nextButton = find.text('Next ➜');
      if (finishButton.evaluate().isNotEmpty) {
        await tester.tap(finishButton);
      } else if (nextButton.evaluate().isNotEmpty) {
        await tester.tap(nextButton);
      }
      await tester.pump(const Duration(milliseconds: 900));
    }

    expect(find.text('Quiz Complete!'), findsOneWidget);
  });
}
