import '../provider.dart';
import 'package:flutter/material.dart';
import 'package:keep/constants/text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('Navigates to Home Page', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({skipOnboard: false});
    final pref = await SharedPreferences.getInstance();
    await tester.pumpWidget(BaseProvider(sharedPreferences: pref));

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
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.more_vert), findsOneWidget);
    await tester.tap(find.byIcon(Icons.more_vert));
    await tester.pumpAndSettle(const Duration(seconds: 5));
    expect(find.text(about), findsOneWidget);
    expect(find.text(profile), findsOneWidget);
    expect(find.text(settings), findsOneWidget);
    expect(find.text(logout), findsOneWidget);
  });
}
