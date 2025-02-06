import 'package:flutter/material.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/widgets/app_start_up.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keep/providers/lean_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  testWidgets('Navigates to Search Page', (WidgetTester tester) async {
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
    expect(find.byIcon(Icons.more_vert), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
    await tester.tap(find.byIcon(Icons.search));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    // Search
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    expect(find.text(placeholder), findsOneWidget);
    expect(find.byIcon(Icons.close), findsOneWidget);
  });
}
