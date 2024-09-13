import 'package:keep/main.dart';
import 'package:flutter/material.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/constants/onboard.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('paints Onboard Page', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(
      child: MyApp(),
    ));

    // Onboarding 1
    expect(find.text(skip), findsOneWidget);
    expect(find.byIcon(Icons.arrow_left), findsNothing);
    expect(find.byIcon(Icons.arrow_right), findsOneWidget);
    expect(find.text(stages[0]["title"].toString()), findsOneWidget);

    await tester.tap(find.byIcon(Icons.arrow_right));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    // Onboarding 2
    expect(find.text(skip), findsOneWidget);
    expect(find.byIcon(Icons.arrow_left), findsOneWidget);
    expect(find.byIcon(Icons.arrow_right), findsOneWidget);
    expect(find.text(stages[1]["title"].toString()), findsOneWidget);

    await tester.tap(find.byIcon(Icons.arrow_right));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    // Onboarding 3
    expect(find.text(skip), findsOneWidget);
    expect(find.byIcon(Icons.arrow_left), findsOneWidget);
    expect(find.byIcon(Icons.arrow_right), findsOneWidget);
    expect(find.text(stages[2]["title"].toString()), findsOneWidget);
  });
}
