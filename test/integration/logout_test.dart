import 'package:flutter/material.dart';
import 'package:keep/constants/text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keep/widgets/app_start_up.dart';
import 'package:keep/providers/lean_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('Logout user', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({skipOnboard: true});
    final sharedPreferences = await SharedPreferences.getInstance();
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          sharedPreferencesProvider.overrideWithValue(sharedPreferences)
        ],
        child: AppStartUp(),
      ),
    );

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

    // Home
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.more_vert), findsOneWidget);
    await tester.tap(find.byIcon(Icons.more_vert));
    await tester.pumpAndSettle(const Duration(seconds: 5));
    expect(find.text(about), findsOneWidget);
    expect(find.text(profile), findsOneWidget);
    expect(find.text(settings), findsOneWidget);

    expect(find.text(logout), findsOneWidget);
    await tester.tap(find.text(logout));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    // Login
    expect(find.text(welcomeBack), findsOneWidget);
  });
}
