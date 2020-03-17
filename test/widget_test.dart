import 'package:cv/ui/page/landing.dart';
import 'package:cv/ui/page/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  testWidgets('Test Splash Page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: SplashPage()));
    expect(find.text('Ján Kandráč'), findsOneWidget);
  });

  testWidgets('Test Landing Page', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LandingPage()));
    expect(find.byWidgetPredicate((widget) => (widget is Text) && widget.data.contains('Welcome to my minimalistic CV application')), findsOneWidget);
  });
}
