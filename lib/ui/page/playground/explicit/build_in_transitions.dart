import 'package:flutter/material.dart';

class BuiltInTransitionsPage extends StatefulWidget {
  @override
  _BuiltInTransitionsPageState createState() => _BuiltInTransitionsPageState();
}

class _BuiltInTransitionsPageState extends State<BuiltInTransitionsPage>
    with TickerProviderStateMixin {
  AnimationController _transitionAnimation;
  Animatable<double> _sizeTransitionAnimatable;
  Animatable<AlignmentGeometry> _alignmentTransitionAnimatable;
  Animatable<double> _fadeTransitionAnimatable;
  Animatable<double> _rotationTransitionAnimatable;
  Animatable<Decoration> _decorationTransitionAnimatable;
  Animatable<TextStyle> _textStyleTransitionAnimatable;

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

    _fadeTransitionAnimatable = CurveTween(
      curve: Curves.easeIn,
    );

    _rotationTransitionAnimatable = CurveTween(
      curve: Curves.easeIn,
    );

    _decorationTransitionAnimatable = DecorationTween(
      begin: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.black, style: BorderStyle.solid, width: 1)
      ),
      end: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(50)),
          border: Border.all(color: Colors.white, style: BorderStyle.solid, width: 10)
    ),
    );

    _textStyleTransitionAnimatable = TextStyleTween(
      begin: TextStyle(color: Colors.white, fontSize: 30, letterSpacing: 1, fontWeight: FontWeight.w400),
      end: TextStyle(color: Colors.black, fontSize: 20, letterSpacing: 2, fontWeight: FontWeight.w800)
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Text('SizeTransition'),
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
        Text('AlignTransition'),
        Container(
          height: 200,
          color: Colors.grey,
          child: AlignTransition(
            alignment:
                _transitionAnimation.drive(_alignmentTransitionAnimatable),
            child: Container(width: 100, height: 100, color: Colors.red),
          ),
        ),
        Text('FadeTransition'),
        Container(
          height: 200,
          color: Colors.grey,
          child: FadeTransition(
            opacity: _transitionAnimation.drive(_fadeTransitionAnimatable),
            child: Center(
              child: Container(width: 100, height: 100, color: Colors.red),
            ),
          ),
        ),
        Text('RotationTransition'),
        Container(
          height: 200,
          color: Colors.grey,
          child: RotationTransition(
            turns: _transitionAnimation.drive(_rotationTransitionAnimatable),
            child: Center(
              child: Container(width: 100, height: 100, color: Colors.red),
            ),
          ),
        ),
        Text('DecoratedBoxTransition'),
        Container(
          height: 200,
          color: Colors.grey,
          child: Center(
            child: Container(
              width: 100,
              height: 100,
              child: DecoratedBoxTransition(
                decoration:
                    _transitionAnimation.drive(_decorationTransitionAnimatable),
                child: Container(),
              ),
            ),
          ),
        ),
        Text('DefaultTextStyleTransition'),
        Container(
          height: 200,
          color: Colors.grey,
          child: DefaultTextStyleTransition(
            style: _transitionAnimation.drive(_textStyleTransitionAnimatable),
            child: Text('Hello World')
          ),
        ),
      ],
    );
  }
}
