import 'package:keep/main.dart';
import 'package:flutter/material.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/routes/route_names.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keep/routes/route_navigator.dart';

void main() {
  testWidgets('Navigates to About Page', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpWidget(
      MaterialApp.router(
        routerConfig: router(RouteNames.about),
      ),
    );

    expect(find.text(font), findsOneWidget);
    expect(find.text(icons), findsOneWidget);
    expect(find.text(author), findsOneWidget);
    expect(find.text(designer), findsOneWidget);

    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
  });
}
