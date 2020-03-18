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

  ColorfulBottomNavigationItem({this.image, this.text, this.color});
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
    _animationController =
        AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      child: Stack(
        children: <Widget>[
          Row(
            children: widget.children.entries
                .map((entry) => AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) => Expanded(
                          flex: 1,
                          child: Material(
                            color: entry.value.color,
                            child: Opacity(
                                opacity: getOpacity(
                                    _animationController.value, entry.key),
                                child: child),
                          ),
                        ),
                    child: InkWell(
                      splashColor: entry.value.color,
                      onTap: () {
                        setState(() {
                          _selectedPosition = entry.key;
                          _animationController.animateTo(
                              (_selectedPosition + 1) / widget.children.length,
                              curve: Curves.easeInOut);
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
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
                    )))
                .toList(),
          ),
        ],
      ),
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
