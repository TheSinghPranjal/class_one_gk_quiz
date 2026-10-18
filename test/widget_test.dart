import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:class_one_gk_quiz/app.dart';
import 'package:class_one_gk_quiz/core/services/storage_service.dart';

void main() {
  testWidgets('App boots to the splash screen', (WidgetTester tester) async {
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
    await tester.pump();
    // Advance past all the entrance-animation delays (staggered title,
    // subtitle, button) so their internal timers fire and clear.
    await tester.pump(const Duration(milliseconds: 1500));

    expect(find.byKey(const ValueKey('lets-play')), findsOneWidget);

    // Dispose the tree so looping animations release their timers before
    // the test binding asserts no timers are left pending.
    await tester.pumpWidget(const SizedBox());
  });
}
