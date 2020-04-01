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

class _LandingPageState extends State<LandingPage>
    with SingleTickerProviderStateMixin {
  static final List<Widget> pages = [
    AboutPage(),
    ProfilePage(),
    PortfolioPage(),
    PlaygroundPage()
  ];

  Widget _currentPage = pages[0];

  AnimationController _drawerAnimationController;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _drawerAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation =
        CurveTween(curve: Curves.easeInOut).animate(_drawerAnimationController);
  }

  @override
  void dispose() {
    super.dispose();
    _drawerAnimationController.dispose();
  }

  void toggleDrawerAnimation() => _drawerAnimationController.isDismissed
      ? _drawerAnimationController.forward()
      : _drawerAnimationController.reverse();

  void onAboutClick() {
    changeCurrentPage(0);
    _drawerAnimationController.reverse();
  }

  void onProfileClick() {
    changeCurrentPage(1);
    _drawerAnimationController.reverse();
  }

  void onPortfolioClick() {
    changeCurrentPage(2);
    _drawerAnimationController.reverse();
  }

  void onPlaygroundClick() {
    changeCurrentPage(3);
    _drawerAnimationController.reverse();
  }

  void changeCurrentPage(int index) {
    setState(() {
      _currentPage = pages[index];
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
            child: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _drawerAnimationController,
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
                      title: Text(AppLocalizations.of(context).landingTabAbout),
                      leading: Image.asset(
                          'assets/images/ic_information_outline_white.png')),
                  ListTile(
                      onTap: onProfileClick,
                      title:
                          Text(AppLocalizations.of(context).landingTabProfile),
                      leading: Image.asset(
                          'assets/images/ic_account_outline_white.png')),
                  ListTile(
                      onTap: onPortfolioClick,
                      title: Text(
                          AppLocalizations.of(context).landingTabPortfolio),
                      leading: Image.asset(
                          'assets/images/ic_book_open_outline_white.png')),
                  ListTile(
                      onTap: onPlaygroundClick,
                      title: Text(
                          AppLocalizations.of(context).landingTabPlayground),
                      leading: Image.asset(
                          'assets/images/ic_pinwheel_outline_white.png')),
                ],
              ),
            ),
          ),
          AnimatedBuilder(
              child: Container(
                color: Theme.of(context).backgroundColor,
                width: double.maxFinite,
                height: double.maxFinite,
                child: Center(
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: AnimatedSwitcher(
                              duration: Duration(milliseconds: 500),
                              child: _currentPage),
                        ),
                      ]),
                ),
              ),
              animation: _drawerAnimationController,
              builder: (context, widget) {
                final double translate = _animation.value * width / 4;
                final double scale = 1 - (_animation.value * 0.3);
                print('translate. scale = $translate / $scale');
                return Transform(
                    transform: Matrix4.identity()
                      ..translate(translate)
                      ..scale(scale),
                    alignment: Alignment.centerRight,
                    child: widget);
              })
        ])),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    if (_drawerAnimationController.isDismissed)
      return true;
    else {
      _drawerAnimationController.reverse();
      return false;
    }
  }
}
