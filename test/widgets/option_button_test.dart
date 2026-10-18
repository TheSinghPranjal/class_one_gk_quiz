import 'package:class_one_gk_quiz/features/quiz/presentation/widgets/option_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _wrap(Widget child) => MaterialApp(home: Scaffold(body: child));

void main() {
  group('OptionButton', () {
    testWidgets('shows its label and letter badge', (tester) async {
      await tester.pumpWidget(
        _wrap(
          OptionButton(
            index: 0,
            label: 'Lion',
            state: OptionVisualState.normal,
            onTap: () {},
          ),
        ),
      );

      expect(find.text('Lion'), findsOneWidget);
      expect(find.text('A'), findsOneWidget);
    });

    testWidgets('correct state shows a check icon and is not tappable', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          OptionButton(
            index: 0,
            label: 'Lion',
            state: OptionVisualState.selectedCorrect,
            onTap: () => tapped = true,
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byIcon(Icons.check_circle_rounded), findsOneWidget);
      await tester.tap(find.text('Lion'));
      await tester.pump();
      expect(tapped, isFalse);

      await tester.pumpWidget(const SizedBox());
    });

    testWidgets('wrong state shows a cancel icon', (tester) async {
      await tester.pumpWidget(
        _wrap(
          OptionButton(
            index: 1,
            label: 'Tiger',
            state: OptionVisualState.selectedWrong,
            onTap: () {},
          ),
        ),
      );
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byIcon(Icons.cancel_rounded), findsOneWidget);
      expect(find.text('B'), findsOneWidget);

      await tester.pumpWidget(const SizedBox());
    });

    testWidgets('eliminated options are faded and not tappable', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          OptionButton(
            index: 2,
            label: 'Elephant',
            state: OptionVisualState.eliminated,
            onTap: () => tapped = true,
          ),
        ),
      );

      await tester.tap(find.text('Elephant'));
      await tester.pump();
      expect(tapped, isFalse);
    });

    testWidgets('normal state responds to taps', (tester) async {
      var tapped = false;
      await tester.pumpWidget(
        _wrap(
          OptionButton(
            index: 3,
            label: 'Bear',
            state: OptionVisualState.normal,
            onTap: () => tapped = true,
          ),
        ),
      );

      await tester.tap(find.text('Bear'));
      await tester.pump();
      expect(tapped, isTrue);
    });
  });
}
