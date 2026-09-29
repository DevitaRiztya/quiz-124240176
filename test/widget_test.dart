import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:devita_kuiz/main.dart';

void main() {
  testWidgets('app loads login screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Login'), findsOneWidget);
    expect(find.text('Username'), findsOneWidget);
  });
}
