import 'package:flutter/material.dart';

class AnimatedAlignPage extends StatefulWidget {
  @override
  _AnimatedAlignPageState createState() => _AnimatedAlignPageState();
}

class _AnimatedAlignPageState extends State<AnimatedAlignPage> {
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
            child: AnimatedAlign(
              duration: Duration(milliseconds: 300),
              alignment: state % 9 == 0 ? Alignment.center :
              state % 9 == 1 ? Alignment.topLeft :
              state % 9 == 2 ? Alignment.topCenter :
              state % 9 == 3 ? Alignment.topRight :
              state % 9 == 4 ? Alignment.centerRight :
              state % 9 == 5 ? Alignment.bottomRight :
              state % 9 == 6 ? Alignment.bottomCenter :
              state % 9 == 7 ? Alignment.bottomLeft :
               Alignment.centerLeft,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
