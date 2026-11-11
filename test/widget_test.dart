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
    expect(find.text('by'), findsOneWidget);
    expect(find.text('The Lazy Bear Club'), findsOneWidget);
    expect(find.byKey(const ValueKey('studio-byline')), findsOneWidget);

    // Dispose the tree so looping animations release their timers before
    // the test binding asserts no timers are left pending.
    await tester.pumpWidget(const SizedBox());
  });

  testWidgets('studio byline stays on screen below the play button', (
    tester,
  ) async {
    final sizes = <Size>[
      const Size(320, 568),
      const Size(360, 640),
      const Size(390, 844),
      const Size(768, 1024),
      const Size(800, 360),
      const Size(1024, 768),
    ];
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    addTearDown(tester.view.resetPadding);
    addTearDown(tester.view.resetViewPadding);

    for (final size in sizes) {
      tester.view.physicalSize = size;
      tester.view.devicePixelRatio = 1;
      await _pumpSplash(tester);

      final button = tester.getRect(find.byKey(const ValueKey('lets-play')));
      final byline = tester.getRect(
        find.byKey(const ValueKey('studio-byline')),
      );
      expect(
        byline.top + 0.5,
        greaterThanOrEqualTo(button.bottom),
        reason: 'byline overlaps the play button at $size',
      );
      expect(
        byline.left,
        greaterThanOrEqualTo(-0.5),
        reason: 'off the left at $size',
      );
      expect(
        byline.right,
        lessThanOrEqualTo(size.width + 0.5),
        reason: 'off the right at $size',
      );
      expect(
        byline.bottom,
        lessThanOrEqualTo(size.height + 0.5),
        reason: 'off the bottom at $size',
      );
      expect(
        byline.width,
        greaterThan(80),
        reason: 'byline too small at $size',
      );
      expect(
        byline.height,
        greaterThan(24),
        reason: 'byline too short at $size',
      );

      await tester.pumpWidget(const SizedBox());
    }

    // Home-indicator inset: the credit stays inside the safe area and still
    // clears the play button.
    const phone = Size(390, 844);
    tester.view.physicalSize = phone;
    tester.view.devicePixelRatio = 1;
    tester.view.padding = const FakeViewPadding(top: 47, bottom: 34);
    tester.view.viewPadding = const FakeViewPadding(top: 47, bottom: 34);
    await _pumpSplash(tester);
    final button = tester.getRect(find.byKey(const ValueKey('lets-play')));
    final byline = tester.getRect(find.byKey(const ValueKey('studio-byline')));
    expect(byline.top + 0.5, greaterThanOrEqualTo(button.bottom));
    expect(byline.bottom, lessThanOrEqualTo(phone.height - 34));
    await tester.pumpWidget(const SizedBox());
  });
}

Future<void> _pumpSplash(WidgetTester tester) async {
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
  await tester.pump(const Duration(milliseconds: 1500));
}
