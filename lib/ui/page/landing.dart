import 'package:cv/consts/hero.dart';
import 'package:cv/localization/app_localization.dart';
import 'package:cv/ui/page/about.dart';
import 'package:cv/ui/page/playground/playground.dart';
import 'package:cv/ui/page/portfolio/portfolio.dart';
import 'package:cv/ui/page/profile.dart';
import 'package:cv/ui/widget/text_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  static final List<Widget> pages = [
    AboutPage(),
    ProfilePage(),
    PortfolioPage(),
    PlaygroundPage()
  ];

  bool menuOpen = false;

  Widget _currentPage = pages[0];

  void toggleDrawerAnimation() {
    setState(() {
      menuOpen = !menuOpen;
    });
  }

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
      _currentPage = pages[index];
      menuOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: toggleDrawerAnimation,
            child: Center(
              child: Icon(
                Icons.menu,
              ),
            ),
          ),
          centerTitle: true,
          title: TextLogo(
            text: AppLocalizations.of(context).logoText,
            tag: HERO_TAG_NAME,
          ),
        ),
        body: WillPopScope(
            onWillPop: _onWillPop,
            child: SafeArea(
              child: Stack(children: [
                Container(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  color: Colors.black12,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ListTile(
                            onTap: onAboutClick,
                            title: Text(
                                AppLocalizations.of(context).landingTabAbout),
                            leading: Image.asset(
                                'assets/images/ic_information_outline_white.png')),
                        ListTile(
                            onTap: onProfileClick,
                            title: Text(
                                AppLocalizations.of(context).landingTabProfile),
                            leading: Image.asset(
                                'assets/images/ic_account_outline_white.png')),
                        ListTile(
                            onTap: onPortfolioClick,
                            title: Text(AppLocalizations.of(context)
                                .landingTabPortfolio),
                            leading: Image.asset(
                                'assets/images/ic_book_open_outline_white.png')),
                        ListTile(
                            onTap: onPlaygroundClick,
                            title: Text(AppLocalizations.of(context)
                                .landingTabPlayground),
                            leading: Image.asset(
                                'assets/images/ic_pinwheel_outline_white.png')),
                      ],
                    ),
                  ),
                ),
                AnimatedContainer(
                  color: Theme.of(context).backgroundColor,
                  duration: Duration(milliseconds: 400),
                  alignment: Alignment.centerRight,
                  transform: Matrix4.identity()
                    ..scale(menuOpen ? 0.5 : 1.0)
                    ..translate(
                        menuOpen ? width * 1.5 : 0.0, menuOpen ? 100 : 0.0),
                  child: AnimatedSwitcher(
                      duration: Duration(milliseconds: 500),
                      child: _currentPage),
                ),
              ]),
            )));
  }

  Future<bool> _onWillPop() async {
    if (!menuOpen)
      return true;
    else {
      setState(() {
        menuOpen = false;
      });
      return false;
    }
  }
}
