import 'package:cv/ui/page/playground/implicit/implicit_animations.dart';
import 'package:flutter/material.dart';

class PlaygroundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.adjust),
          title: Text('Implicit Animations'),
          isThreeLine: true,
          subtitle: Text('AnimatedSomething Widgets and TweenAnimationBuilder'),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ImplicitAnimationsPage()));
          },
        ),
        ListTile(
          leading: Icon(Icons.all_inclusive),
          title: Text('Explicit Animations'),
          subtitle:
              Text('SomethingTransition, AnimatedBuilder, AnimatedWidget'),
          isThreeLine: true,
        ),
        ListTile(
          leading: Icon(Icons.flare),
          title: Text('Animation Frameworks'),
          subtitle: Text('Flare and Lottie'),
          isThreeLine: true,
        ),
        ListTile(
          leading: Icon(Icons.category),
          title: Text('UI Challenges'),
          subtitle: Text('Remakes of existing UI ideas'),
          isThreeLine: true,
        ),
      ],
    );
  }
}
