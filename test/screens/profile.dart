import 'package:keep/main.dart';
import 'package:flutter/material.dart';
import 'package:keep/constants/text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('Navigates to Profile Page', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(
      child: MyApp(),
    ));

    // Onboarding
    expect(find.text(skip), findsOneWidget);
    await tester.tap(find.text(skip));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    // Home
    expect(find.byIcon(Icons.account_circle_rounded), findsOneWidget);
    await tester.tap(find.byIcon(Icons.account_circle_rounded));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    // Profile
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    expect(find.text(profile), findsOneWidget);
    expect(find.text(firstName), findsOneWidget);
    expect(find.text(lastName), findsOneWidget);
    expect(find.text(email), findsOneWidget);
    expect(find.text(currentPassword), findsOneWidget);
    expect(find.text(newPassword), findsOneWidget);
  });
}
