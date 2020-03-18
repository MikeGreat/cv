import 'package:flutter/material.dart';

///
/// Modification of hero animation curve, since by default hero animation is
/// extremely fast from beginning. Animation therefor might look laggy.
///
/// Use this RectTween in order to override animation [curve]
///
/// Heavily inspired by this article:
///
///
/// https://roszkowski.dev/2019/custom-hero-curve/
///
class CustomCurveRectTween extends RectTween {

  CustomCurveRectTween({this.a, this.b, this.curve = Curves.easeOut}) : super(begin: a, end: b);

  final Rect a;
  final Rect b;
  final Curve curve;

  @override
  Rect lerp(double t) {
    curve.transform(t);
    return Rect.fromLTRB(
      lerpDouble(a.left, b.left, t),
      lerpDouble(a.top, b.top, t),
      lerpDouble(a.right, b.right, t),
      lerpDouble(a.bottom, b.bottom, t),
    );
  }

  double lerpDouble(num a, num b, double t) {
    if (a == null && b == null) return null;
    a ??= 0.0;
    b ??= 0.0;
    return a + (b - a) * t;
  }
}
