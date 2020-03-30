import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// Target visual:
/// https://dribbble.com/shots/6214624-Colored-Tab-Bar-Interactions
///
class ColorfulBottomNavigationItem {
  final ImageProvider image;
  final String text;
  final Color color;
  final VoidCallback onTap;

  ColorfulBottomNavigationItem({this.image, this.text, this.color, this.onTap});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ColorfulBottomNavigationItem &&
          runtimeType == other.runtimeType &&
          image == other.image &&
          text == other.text &&
          color == other.color;

  @override
  int get hashCode => image.hashCode ^ text.hashCode ^ color.hashCode;
}

class ColorfulBottomNavigation extends StatefulWidget {
  final Map<int, ColorfulBottomNavigationItem> children;

  ColorfulBottomNavigation({List<ColorfulBottomNavigationItem> children})
      : this.children = children.asMap();

  @override
  _ColorfulBottomNavigationState createState() =>
      _ColorfulBottomNavigationState();
}

class _ColorfulBottomNavigationState extends State<ColorfulBottomNavigation>
    with SingleTickerProviderStateMixin {
  int _selectedPosition = 0;

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      color: widget.children.entries.last.value.color,
      child: Stack(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: widget.children.entries
              .map((entry) => Expanded(
                    child: Transform(
                      transform: Matrix4.skewX(-0.2),
                      child: Container(
                        color: entry.value.color,
                      ),
                    ),
                  ))
              .toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: widget.children.entries
              .map((entry) => Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedPosition = entry.key;
                          _animationController.animateTo(
                              (_selectedPosition + 1) / widget.children.length,
                              curve: Curves.easeInOut);
                        });
                        entry.value.onTap();
                      },
                      child: Transform.translate(
                        offset: Offset(
                            entry.key == 0 ||
                                    entry.key == widget.children.length - 1
                                ? 0
                                : -5,
                            0),
                        child: Center(
                          child: AnimatedBuilder(
                            animation: _animationController,
                            builder: (context, child) => Expanded(
                              flex: 1,
                              child: Opacity(
                                  opacity: getOpacity(
                                      _animationController.value, entry.key),
                                  child: child),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Image(image: entry.value.image),
                                Text(
                                  entry.value.text,
                                  maxLines: 1,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ))
              .toList(),
        )
      ]),
    );
  }

  int getFlex(double animationValue, int position) {
    double perfectPosition = (position + 1) / widget.children.length;
    return (1 - (animationValue - perfectPosition).abs() * 30).round();
  }

  double getOpacity(double animationValue, int position) {
    double perfectPosition = (position + 1) / widget.children.length;
    return min(1.0, (1 - (animationValue - perfectPosition).abs()) + 0.25);
  }
}
