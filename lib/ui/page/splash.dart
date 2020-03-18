import 'package:cv/main.dart';
import 'package:cv/ui/animation/fade_page_route_builder.dart';
import 'package:cv/ui/page/landing.dart';
import 'package:flutter/material.dart';
import 'package:cv/consts/hero.dart';
import 'package:cv/ui/widget/text_logo.dart';

///
/// My idea of splashscreen.
///
/// Splashscreen is show right after system splash screen. I prefer system
/// splashscreen to be single color and application splashscreen to fluently
/// reveal some simple content. Best animation to do so is alpha animation
/// [AnimatedOpacity] or maybe revealing using [AnimatedSize].
///
/// Here you can see [AnimatedOpacity] animation of [TextLogo]. After animation
/// finishes, the [LandingPage] is being drawn using [Navigator.pushReplacement]
/// method.
///
class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with RouteAware {
  double _opacity = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    heroRouteObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _opacity = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
        child: Center(
          child: AnimatedOpacity(
            onEnd: () {
              Navigator.pushReplacement(
                context,
                FadePageRouteBuilder(page: LandingPage(), transitionDuration: Duration(seconds: 5)),
              );
            },
            opacity: _opacity,
            duration: Duration(seconds: 2),
            curve: Curves.easeIn,
            child: TextLogo(
              text: 'Ján Kandráč',
              tag: HERO_TAG_NAME
            ),
          ),
        ),
      ),
    );
  }
}
