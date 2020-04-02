import 'package:flutter/material.dart';

class AnimatedSizePage extends StatefulWidget {
  @override
  _AnimatedSizePageState createState() => _AnimatedSizePageState();
}

class _AnimatedSizePageState extends State<AnimatedSizePage>
    with TickerProviderStateMixin {
  bool resized = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              resized = !resized;
            });
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.grey,
            child: Center(
              child: AnimatedSize(
                vsync: this,
                curve: Curves.easeInOut,
                duration: Duration(milliseconds: 300),
                child: Container(
                  width: resized ? 100 : 50,
                  height: resized ? 100 : 50,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
