import 'package:flutter/material.dart';

class BuiltInTransitionsPage extends StatefulWidget {
  @override
  _BuiltInTransitionsPageState createState() => _BuiltInTransitionsPageState();
}

class _BuiltInTransitionsPageState extends State<BuiltInTransitionsPage> with TickerProviderStateMixin {

  AnimationController _transitionAnimation;
  Animatable<double> _sizeTransitionAnimatable;
  Animatable<AlignmentGeometry> _alignmentTransitionAnimatable;

  @override
  void initState() {
    super.initState();

    _transitionAnimation = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);

    _sizeTransitionAnimatable = CurveTween(
      curve: Curves.easeIn,
    );

    _alignmentTransitionAnimatable = AlignmentTween(
      begin: Alignment.centerRight,
      end: Alignment.centerLeft,
    );

  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Text("SizeTransition"),
        Container(
          height: 200,
          color: Colors.grey,
          child: Center(
            child: SizeTransition(
              sizeFactor: _transitionAnimation.drive(_sizeTransitionAnimatable),
              child: Container(
                color: Colors.red,
                width: 100,
                height: 100,
              ),
            ),
          ),
        ),
        Text("AlignTransition"),
        Container(
          height: 200,
          color: Colors.grey,
          child: AlignTransition(
            alignment: _transitionAnimation.drive(_alignmentTransitionAnimatable),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.red
            ),
          ),
        ),
//        Text(""),
//        FadeTransition(),
//        Text(""),
//        RotationTransition(),
      ],
    );
  }
}
