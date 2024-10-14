import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:keep/screens/empty_state.dart';

void main() {
  testWidgets('show to Empty Page', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: EmptyState(uri: "service_book.svg"),
    ));
  });
}