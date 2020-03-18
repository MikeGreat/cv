import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cv/ui/page/splash.dart';
import 'package:cv/ui/animation/hero_tween.dart';

void main() => runApp(Application());

// Looks like HeroController won't help at all while using MaterialApp as
// root widget. I'll keep this in Git for reference. I've also asked question
// here: https://stackoverflow.com/questions/60735046/flutter-is-overriding-herocontroller-in-materialapp-possible
final NavigatorObserver heroNavigatorObserver = HeroController(
  createRectTween: (begin, end) {
    return CustomCurveRectTween(
        a: begin, b: end, curve: Curves.bounceInOut);
  },
);

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
          splashColor: Colors.blueGrey,
        ),
        navigatorObservers: [heroNavigatorObserver],
        home: SplashPage(),
      ));
}
