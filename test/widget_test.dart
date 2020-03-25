import 'package:cv/localization/app_localization.dart';
import 'package:cv/ui/page/landing.dart';
import 'package:cv/ui/page/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

MaterialApp getTestingApp({String locale, Widget home}) =>
    MaterialApp(
      home: home,
      locale: Locale(locale),
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('sk'),
      ],
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blueGrey,
        backgroundColor: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.blueGrey,
        splashColor: Colors.blueGrey,
      ),
    );

void main() {

  testWidgets('Test Splash Page SK', (WidgetTester tester) async {
    await tester.pumpWidget(getTestingApp(home: SplashPage(), locale: 'sk'));
    expect(find.text('Ján Kandráč'), findsOneWidget);
  });

  testWidgets('Test Splash Page EN', (WidgetTester tester) async {
    await tester.pumpWidget(getTestingApp(home: SplashPage(), locale: 'en'));
    expect(find.text('Jan Kandrac'), findsOneWidget);
  });

  testWidgets('Test Splash Page ES', (WidgetTester tester) async {
    await tester.pumpWidget(getTestingApp(home: SplashPage(), locale: 'es'));
    expect(find.text('Jan Kandrac'), findsOneWidget);
  });

  testWidgets('Test Landing Page SK', (WidgetTester tester) async {
    await tester.pumpWidget(getTestingApp(home: LandingPage(), locale: 'sk'));
    expect(find.byWidgetPredicate((widget) => (widget is Text) && widget.data.contains('Vítam vás v mojej minimalistickej CV aplikácii')), findsOneWidget);
  });

  testWidgets('Test Landing Page EN', (WidgetTester tester) async {
    await tester.pumpWidget(getTestingApp(home: LandingPage(), locale: 'en'));
    expect(find.byWidgetPredicate((widget) => (widget is Text) && widget.data.contains('Welcome to my minimalistic CV application')), findsOneWidget);
  });

  testWidgets('Test Landing Page ES', (WidgetTester tester) async {
    await tester.pumpWidget(getTestingApp(home: LandingPage(), locale: 'es'));
    expect(find.byWidgetPredicate((widget) => (widget is Text) && widget.data.contains('Welcome to my minimalistic CV application')), findsOneWidget);
  });
}
