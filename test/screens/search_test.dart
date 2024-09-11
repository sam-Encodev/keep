import 'package:flutter/material.dart';
import 'package:keep/constants/text.dart';
import 'package:keep/routes/route_names.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keep/routes/route_navigator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  testWidgets('Navigates to Search Page', (WidgetTester tester) async {
    await tester.pumpWidget(ProviderScope(
      child: MaterialApp.router(routerConfig: router(RouteNames.search)),
    ));

    expect(find.text(placeholder), findsOneWidget);
    expect(find.byIcon(Icons.close), findsOneWidget);
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
  });
}
