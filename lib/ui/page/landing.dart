import 'package:cv/consts/hero.dart';
import 'package:cv/ui/widget/text_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  double _opacity = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _opacity = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).backgroundColor,
      child: SafeArea(
          child: Stack(children: [
        Center(
          child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextLogo(
                    text: 'Ján Kandráč',
                    tag: HERO_TAG_NAME,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: AnimatedOpacity(
                    duration: Duration(seconds: 1),
                    opacity: _opacity,
                    child: ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 100,
                            height: 100,
                            child: Neumorphic(
                              boxShape: NeumorphicBoxShape.circle(),
                              style: NeumorphicStyle(
                                  lightSource: LightSource.topLeft, depth: 4.0),
                              child: Image.asset('assets/images/profil.jpeg'),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text('Curriculum',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline6),
                        SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Text('''Hi.

Welcome to my minimalistic CV application.

I've myself promise, I'll add at least 1 new feature every single week. This way I'll be able to progress with my self study of Flutter. Yes this application will be about flutter development.

Hope you will like it more and more.
Next non developemnt step -> actual CV
                          '''),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
        ),
      ])),
    );
  }
}
