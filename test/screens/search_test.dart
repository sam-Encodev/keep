import 'package:keep/main.dart';
import 'package:flutter/material.dart';
import 'package:keep/constants/text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('Navigates to Search Page', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(
      child: MyApp(),
    ));

    // Onboarding
    expect(find.text(skip), findsOneWidget);
    await tester.tap(find.text(skip));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    // Home
    expect(find.byIcon(Icons.search), findsOneWidget);
    await tester.tap(find.byIcon(Icons.search));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    // Search
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    expect(find.text(placeholder), findsOneWidget);
    expect(find.byIcon(Icons.close), findsOneWidget);
  });
}
