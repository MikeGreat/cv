import 'package:cv/consts/hero.dart';
import 'package:cv/localization/app_localization.dart';
import 'package:cv/ui/page/about.dart';
import 'package:cv/ui/page/playground.dart';
import 'package:cv/ui/page/portfolio/portfolio.dart';
import 'package:cv/ui/page/profile.dart';
import 'package:cv/ui/widget/colorful_bottom_navigation.dart';
import 'package:cv/ui/widget/text_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int currentIndex = 0;

  void onAboutClick() {
    changeCurrentPage(0);
  }

  void onProfileClick() {
    changeCurrentPage(1);
  }

  void onPortfolioClick() {
    changeCurrentPage(2);
  }

  void onPlaygroundClick() {
    changeCurrentPage(3);
  }

  void changeCurrentPage(int index) {
    setState(() {
      currentIndex = index;
    });
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
                text: AppLocalizations.of(context).landingTabAbout,
                color: Color(0xFFD51515),
                onTap: onAboutClick),
            ColorfulBottomNavigationItem(
                image: AssetImage('assets/images/ic_account_outline_white.png'),
                text: AppLocalizations.of(context).landingTabProfile,
                color: Color(0xFFE57910),
                onTap: onProfileClick),
            ColorfulBottomNavigationItem(
                image:
                    AssetImage('assets/images/ic_book_open_outline_white.png'),
                text: AppLocalizations.of(context).landingTabPortfolio,
                color: Color(0xFF104E5A),
                onTap: onPortfolioClick),
            ColorfulBottomNavigationItem(
                image:
                    AssetImage('assets/images/ic_pinwheel_outline_white.png'),
                text: AppLocalizations.of(context).landingTabPlayground,
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
                    text: AppLocalizations.of(context).logoText,
                    tag: HERO_TAG_NAME,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: getContent(),
                ),
              ]),
        ),
      ])),
    );
  }

  Widget getContent() {
    switch (currentIndex) {
      case 0:
        return AboutPage();
      case 1:
        return ProfilePage();
      case 2:
        return PortfolioPage();
      case 3:
        return PlaygroundPage();
      default:
        throw Exception("Only 4 pages available - choose page in range <0;3>");
    }
  }
}
