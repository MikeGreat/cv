import 'package:flutter/material.dart';

class AnimatedOpacityPage extends StatefulWidget {
  @override
  _AnimatedOpacityPageState createState() => _AnimatedOpacityPageState();
}

class _AnimatedOpacityPageState extends State<AnimatedOpacityPage> {
  bool transparent = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              transparent = !transparent;
            });
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.grey,
            child: Center(
              child: AnimatedOpacity(
                duration: Duration(seconds: 1),
                opacity: transparent ? 0 : 1,
                child: Container(
                  width: 100,
                  height: 100,
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
