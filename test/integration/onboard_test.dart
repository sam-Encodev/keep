import '../provider.dart';
import 'package:flutter/material.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/constants/onboard.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('paints Onboard Page', (WidgetTester tester) async {
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
