import 'package:flutter/material.dart';
import 'package:keep/widgets/keep.dart';
import 'package:keep/constants/text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('Navigates to Profile Page', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(
      child: Keep(),
    ));

    // Login
    expect(find.text(welcomeBack), findsOneWidget);
    expect(find.text(noAccount), findsOneWidget);
    expect(find.text(signUp), findsOneWidget);
    expect(find.text(email), findsOneWidget);
    expect(find.text(password), findsOneWidget);
    Finder emailField = find.byKey(const Key(email));
    await tester.enterText(emailField, userEmail);
    Finder passwordField = find.byKey(const Key(password));
    await tester.enterText(passwordField, userPassword);
    await tester.tap(find.byKey(const Key(login)));
    await tester.pumpAndSettle(const Duration(seconds: 5));

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
