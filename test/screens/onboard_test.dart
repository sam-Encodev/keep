import 'package:flutter/material.dart';
import 'package:keep/constants/text.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keep/routes/route_names.dart';
import 'package:keep/routes/route_navigator.dart';

void main() {
  testWidgets('Navigates to Onboard Page', (WidgetTester tester) async {
    await tester.pumpWidget(ProviderScope(
      child: MaterialApp.router(routerConfig: router(RouteNames.onboard)),
    ));


    expect(find.text(skip), findsOneWidget);
  });
}
