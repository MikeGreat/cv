import 'package:flutter/material.dart';

class StaggeredAnimationsPage extends StatefulWidget {
  @override
  _StaggeredAnimationsPageState createState() =>
      _StaggeredAnimationsPageState();
}

class _StaggeredAnimationsPageState extends State<StaggeredAnimationsPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _firstElementPosition;
  Animation<double> _secondElementPosition;
  Animation<double> _thirdElementPosition;
  Animation<double> _fourthElementPosition;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _firstElementPosition = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.0, 0.7, curve: Curves.elasticOut)));

    _secondElementPosition = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.1, 0.8, curve: Curves.elasticOut)));

    _thirdElementPosition = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.2, 0.9, curve: Curves.elasticOut)));

    _fourthElementPosition = Tween(begin: -1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: _animationController,
            curve: Interval(0.3, 0.99, curve: Curves.elasticOut)));
  }

  void animate() {
    if (_animationController.isDismissed) {
      print('reverse');
      _animationController.forward();
    } else {
      print('forward');
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      )),
      body: Stack(
        children: <Widget>[
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            child: FlatButton(
              child: Text('Click me!!!'),
              onPressed: animate,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              getAnimatedFractionTranslation(
                  _firstElementPosition, Text('First Element')),
              getAnimatedFractionTranslation(
                  _secondElementPosition, Text('Second Element')),
              getAnimatedFractionTranslation(
                  _thirdElementPosition, Text('Third Element')),
              getAnimatedFractionTranslation(
                  _fourthElementPosition, Text('Fourth Element')),
            ],
          )
        ],
      ),
    );
  }

  Widget getAnimatedFractionTranslation(
          Animation<double> animation, Widget child) =>
      AnimatedBuilder(
        animation: animation,
        builder: (context, child) => FractionalTranslation(
            translation: Offset(animation.value, 0), child: child),
        child: child,
      );
}
