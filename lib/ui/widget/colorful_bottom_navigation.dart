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
  int get hashCode =>
      image.hashCode ^
      text.hashCode ^
      color.hashCode;
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
      child: CustomPaint(
        child: Row(
          children: widget.children.entries
              .map((entry) =>
              AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) =>
                      Expanded(
                        flex: 1,
                        child: Material(
                          color: Colors.transparent,
                          child: Opacity(
                              opacity: getOpacity(
                                  _animationController.value, entry.key),
                              child: child),
                        ),
                      ),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPosition = entry.key;
                        _animationController.animateTo(
                            (_selectedPosition + 1) /
                                widget.children.length,
                            curve: Curves.easeInOut);
                      });
                      entry.value.onTap();
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
        painter: _BackgroundPainter(_animationController.value,
            widget.children.values.map((e) => e.color).toList()),
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

// TODO: rework this to ClipPath
class _BackgroundPainter extends CustomPainter {

  static const double skew = 20;
  final List<Paint> paints;
  final double progress;

  _BackgroundPainter(this.progress, List<Color> colors) :
        paints = colors.map((e) =>
        Paint()
          ..color = e
          ..isAntiAlias = true
          ..style = PaintingStyle.fill
        ).toList();

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < paints.length; i++) {
      final xPivot = i * size.width / paints.length;
      canvas.drawPath(
          Path()
            ..moveTo((i == 0) ? 0 : xPivot + skew/2, 0)
            ..lineTo((i == paints.length -1) ? size.width : xPivot + size.width / paints.length + skew/2, 0)
            ..lineTo((i == paints.length -1) ? size.width : xPivot + size.width / paints.length- skew/2, size.height)
            ..lineTo((i == 0) ? 0 : xPivot + 0 / paints.length- skew/2, size.height)
            ..close()
          , paints[i]);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    final old = (oldDelegate as _BackgroundPainter);
    return (old.progress != progress) || old.paints != paints;
  }
}
