import 'package:cv/consts/hero.dart';
import 'package:cv/ui/widget/colorful_bottom_navigation.dart';
import 'package:cv/ui/widget/text_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:transparent_image/transparent_image.dart';

class LandingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Neumorphic(
        style: NeumorphicStyle(
            shape: NeumorphicShape.flat,
            color: Theme.of(context).backgroundColor,
            lightSource: LightSource.bottom,
            depth: 4.0),
        boxShape: NeumorphicBoxShape.roundRect(),
        child: ColorfulBottomNavigation(
          children: [
            ColorfulBottomNavigationItem(image: AssetImage('assets/images/ic_account_outline_white.png'), text: 'Profile', color: Color(0xFFD51515)),
            ColorfulBottomNavigationItem(image: AssetImage('assets/images/ic_book_open_outline_white.png'), text: 'Portfolio', color: Color(0xFFE57910)),
            ColorfulBottomNavigationItem(image: AssetImage('assets/images/ic_information_outline_white.png'), text: 'About', color: Color(0xFF104E5A)),
            ColorfulBottomNavigationItem(image: AssetImage('assets/images/ic_pinwheel_outline_white.png'), text: 'Playground', color: Color(0xFF040B11)),
          ],
        ),
      ),
      body: SafeArea(
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
                                shape: NeumorphicShape.flat,
                                color: Theme.of(context).backgroundColor,
                                lightSource: LightSource.bottom,
                                depth: 4.0),
                            child: FadeInImage(
                              image: AssetImage('assets/images/profil.jpeg'),
                              placeholder: MemoryImage(kTransparentImage),
                              fadeInDuration: Duration(milliseconds: 300),
                            ),
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
              ]),
        ),
      ])),
    );
  }
}
