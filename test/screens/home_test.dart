import 'package:flutter/material.dart';
import 'package:keep/widgets/keep.dart';
import 'package:keep/constants/text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('Navigates to Home Page', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(
      child: Keep(),
    ));

    // Onboarding
    expect(find.text(skip), findsOneWidget);
    await tester.tap(find.text(skip));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    // Home
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.info), findsOneWidget);
    expect(find.byIcon(Icons.account_circle_rounded), findsOneWidget);
    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}
