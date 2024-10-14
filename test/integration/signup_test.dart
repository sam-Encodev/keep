import 'package:flutter/material.dart';
import 'package:keep/widgets/keep.dart';
import 'package:keep/constants/text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('Navigates to Signup Page', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(
      child: Keep(),
    ));

    // Login
    expect(find.text(welcomeBack), findsOneWidget);
    expect(find.text(noAccount), findsOneWidget);
    expect(find.text(signUp), findsOneWidget);
    expect(find.text(email), findsOneWidget);
    expect(find.text(password), findsOneWidget);
    expect(find.text(login), findsOneWidget);
    await tester.tap(find.text(signUp));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    // Signup
    expect(find.text(getStarted), findsOneWidget);
    expect(find.text(signUp), findsOneWidget);
    expect(find.text(email), findsOneWidget);
    expect(find.text(password), findsOneWidget);
    Finder emailField = find.byKey(const Key(email));
    await tester.enterText(emailField, newUserEmail);
    Finder passwordField = find.byKey(const Key(password));
    await tester.enterText(passwordField, newUserPassword);
    await tester.tap(find.byKey(const Key(signUp)));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    // Onboarding
    expect(find.text(skip), findsOneWidget);
  });
}
