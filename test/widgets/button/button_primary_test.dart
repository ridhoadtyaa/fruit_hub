import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fruit_hub/widgets/button/button_primary.dart';

void main() {
  group('ButtonPrimary Widget Tests', () {
    testWidgets('ButtonPrimary renders correctly with given text',
        (WidgetTester tester) async {
      // Arrange
      const buttonText = 'Click Me';
      bool isPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ButtonPrimary(
              text: buttonText,
              onPressed: () => isPressed = true,
            ),
          ),
        ),
      );

      // Act
      final buttonFinder = find.text(buttonText);

      // Assert
      expect(buttonFinder, findsOneWidget);
    });

    testWidgets('ButtonPrimary triggers onPressed callback when tapped',
        (WidgetTester tester) async {
      // Arrange
      bool isPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ButtonPrimary(
              text: 'Click Me',
              onPressed: () => isPressed = true,
            ),
          ),
        ),
      );

      // Act
      final buttonFinder = find.byType(ElevatedButton);
      await tester.tap(buttonFinder);
      await tester.pumpAndSettle();

      // Assert
      expect(isPressed, true);
    });

    testWidgets('ButtonPrimary has correct styling',
        (WidgetTester tester) async {
      // Arrange
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ButtonPrimary(
              text: 'Styled Button',
              onPressed: () {},
            ),
          ),
        ),
      );

      // Act
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));

      // Assert
      final buttonStyle = button.style!;
      expect(buttonStyle.backgroundColor?.resolve({}), const Color(0xFFFFA451));
      expect(buttonStyle.minimumSize?.resolve({}), const Size.fromHeight(56));
      expect(buttonStyle.padding?.resolve({}),
          const EdgeInsets.symmetric(vertical: 16));
      expect(buttonStyle.shape?.resolve({}) is RoundedRectangleBorder, true);

      final roundedBorder =
          buttonStyle.shape!.resolve({}) as RoundedRectangleBorder;
      expect(roundedBorder.borderRadius, BorderRadius.circular(10));
    });
  });
}
