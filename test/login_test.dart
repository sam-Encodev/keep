import 'package:keep/main.dart';
import 'package:flutter/material.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/routes/route_names.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keep/routes/route_navigator.dart';

void main() {
  testWidgets('Navigates to Login Page', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: router(RouteNames.login),
      ),
    );

    expect(find.text(welcomeBack), findsOneWidget);
  });
}
