import 'package:flutter/material.dart';
import 'package:keep/screens/about.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('show to About Page', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: About(),
    ));
  });
}