import 'package:flutter/material.dart';

class AnimatedPaddingPage extends StatefulWidget {
  @override
  _AnimatedPaddingPageState createState() => _AnimatedPaddingPageState();
}

class _AnimatedPaddingPageState extends State<AnimatedPaddingPage> {
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
            child: AnimatedPadding(
              duration: Duration(milliseconds: 300),
              padding: EdgeInsets.all(show ? 75.0 : 50.0),
              child: Container(
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
