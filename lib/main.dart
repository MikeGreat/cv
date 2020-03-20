import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cv/ui/page/splash.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

FirebaseAnalytics analytics = FirebaseAnalytics();

void main() {
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  runApp(Application());
}

///
/// This is my common application widget. It contains only [MaterialApp] widget
/// with optional routing (I'd like to see it on larger projects) and theming.
///
class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blueGrey,
          backgroundColor: Colors.blueGrey,
          scaffoldBackgroundColor: Colors.blueGrey,
          splashColor: Colors.blueGrey,
        ),
        navigatorObservers: [
          FirebaseAnalyticsObserver(analytics: analytics),
        ],
        home: SplashPage(),
      ));
}
