import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  int state = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              state++;
            });
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.grey,
            child: Center(
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                color: state % 4 == 0 ? Colors.yellow : Colors.cyan,
                width: state % 4 == 1 ? 200 : 100,
                height: state % 4 == 2 ? 200 : 100,
                transform: Matrix4.rotationZ(state % 4 == 3 ? pi / 2 : 0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
