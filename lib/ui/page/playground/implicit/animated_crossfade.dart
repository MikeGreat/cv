import 'package:flutter/material.dart';

class AnimatedCrossFadePage extends StatefulWidget {
  @override
  _AnimatedCrossFadePageState createState() => _AnimatedCrossFadePageState();
}

class _AnimatedCrossFadePageState extends State<AnimatedCrossFadePage> {
  CrossFadeState crossFadeState = CrossFadeState.showFirst;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              if (crossFadeState == CrossFadeState.showFirst) {
                crossFadeState = CrossFadeState.showSecond;
              } else {
                crossFadeState = CrossFadeState.showFirst;
              }
            });
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.grey,
            child: Center(
              child: AnimatedCrossFade(
                crossFadeState: crossFadeState,
                firstCurve: Curves.easeInOut,
                secondCurve: Curves.easeInOut,
                firstChild: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                  child: Center(child: Icon(Icons.email)),
                ),
                secondChild: Container(
                  width: 100,
                  height: 100,
                  color: Colors.blue,
                  child: Center(child: Icon(Icons.lock_open)),
                ),
                duration: Duration(milliseconds: 1000),
                reverseDuration: Duration(milliseconds: 1000),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
