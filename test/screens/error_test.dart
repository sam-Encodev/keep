import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keep/screens/error_screen.dart';

void main() {
  testWidgets('show to Error Page', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: ErrorScreen(),
    ));
  });
}