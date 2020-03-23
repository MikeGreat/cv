import 'package:cv/consts/hero.dart';
import 'package:cv/ui/page/about.dart';
import 'package:cv/ui/page/playground.dart';
import 'package:cv/ui/page/portfolio/portfolio.dart';
import 'package:cv/ui/page/profile.dart';
import 'package:cv/ui/widget/colorful_bottom_navigation.dart';
import 'package:cv/ui/widget/text_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:transparent_image/transparent_image.dart';

class LandingPage extends StatelessWidget {

  PageController pageViewController = PageController();

  void onAboutClick() {
    pageViewController.animateToPage(0, duration: Duration(seconds: 1), curve: Curves.easeInOut);
  }

  void onProfileClick() {
    pageViewController.animateToPage(1, duration: Duration(seconds: 1), curve: Curves.easeInOut);
  }

  void onPortfolioClick() {
    pageViewController.animateToPage(2, duration: Duration(seconds: 1), curve: Curves.easeInOut);
  }

  void onPlaygroundClick() {
    pageViewController.animateToPage(3, duration: Duration(seconds: 1), curve: Curves.easeInOut);
  }

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
            ColorfulBottomNavigationItem(
                image: AssetImage(
                    'assets/images/ic_information_outline_white.png'),
                text: 'About',
                color: Color(0xFFD51515),
                onTap: onAboutClick),
            ColorfulBottomNavigationItem(
                image: AssetImage('assets/images/ic_account_outline_white.png'),
                text: 'Profile',
                color: Color(0xFFE57910),
                onTap: onProfileClick),
            ColorfulBottomNavigationItem(
                image:
                    AssetImage('assets/images/ic_book_open_outline_white.png'),
                text: 'Portfolio',
                color: Color(0xFF104E5A),
                onTap: onPortfolioClick),
            ColorfulBottomNavigationItem(
                image:
                    AssetImage('assets/images/ic_pinwheel_outline_white.png'),
                text: 'Playground',
                color: Color(0xFF040B11),
                onTap: onPlaygroundClick),
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
                    child: PageView(
                      controller: pageViewController,
                  children: <Widget>[
                    AboutPage(),
                    ProfilePage(),
                    PortfolioPage(),
                    PlaygroundPage()
                  ],
                )),
              ]),
        ),
      ])),
    );
  }
}
