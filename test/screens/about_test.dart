import 'package:flutter/material.dart';
import 'package:keep/widgets/keep.dart';
import 'package:keep/constants/text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('Navigates to About Page', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(
      child: Keep(),
    ));

    // Onboarding
    expect(find.text(skip), findsOneWidget);
    await tester.tap(find.text(skip));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    // Home
    expect(find.byIcon(Icons.info), findsOneWidget);
    await tester.tap(find.byIcon(Icons.info));
    await tester.pumpAndSettle(const Duration(seconds: 5));

    // About
    expect(find.text(font), findsOneWidget);
    expect(find.text(icons), findsOneWidget);
    expect(find.text(author), findsOneWidget);
    expect(find.text(signOut), findsOneWidget);
    expect(find.text(designer), findsOneWidget);
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
  });
}
