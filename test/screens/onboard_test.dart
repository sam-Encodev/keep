import 'package:keep/main.dart';
import 'package:keep/constants/text.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Navigates to Onboard Page', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text(skip), findsOneWidget);
  });
}
