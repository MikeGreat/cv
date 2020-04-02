import 'package:flutter/material.dart';

class AnimatedPositionedPage extends StatefulWidget {
  @override
  _AnimatedPositionedPageState createState() => _AnimatedPositionedPageState();
}

class _AnimatedPositionedPageState extends State<AnimatedPositionedPage> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              show = !show;
            });
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.grey,
            child: Stack(children: [
              AnimatedPositioned(
                left: show ? 0 : 100,
                top: show ? 0 : 100,
                bottom: show ? 100 : 0,
                right: show ? 100 : 0,
                curve: Curves.easeInOut,
                duration: Duration(milliseconds: 300),
                child: Container(
                  color: Colors.red,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
