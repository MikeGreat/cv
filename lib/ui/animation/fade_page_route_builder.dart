import 'package:flutter/material.dart';

class FadePageRouteBuilder extends PageRouteBuilder {
  final Widget page;

  FadePageRouteBuilder({this.page, Duration transitionDuration})
      : super(
          pageBuilder: (_, __, ___) => page,
          transitionDuration: transitionDuration,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
