import 'package:cv/ui/page/playground/implicit/animated_container.dart';
import 'package:cv/ui/page/playground/implicit/animated_opacity.dart';
import 'package:flutter/material.dart';

class ImplicitAnimationSubPage {
  final String title;
  final Widget samplePage;

  ImplicitAnimationSubPage({this.title, this.samplePage});
}

class ImplicitAnimationsPage extends StatefulWidget {

  @override
  _ImplicitAnimationsPageState createState() => _ImplicitAnimationsPageState();
}

class _ImplicitAnimationsPageState extends State<ImplicitAnimationsPage> {

  static final List<ImplicitAnimationSubPage> subPages = [
    ImplicitAnimationSubPage(title: 'AnimatedOpacity', samplePage: AnimatedOpacityPage()),
    ImplicitAnimationSubPage(title: 'AnimatedContainer', samplePage: AnimatedContainerPage())
  ];

  ImplicitAnimationSubPage subPage = subPages[0];

  void selectPage(int id) {
    setState(() {
      subPage = subPages[id];
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subPage.title),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(title: Text(subPages[0].title), onTap: () { selectPage(0); }),
            ListTile(title: Text(subPages[1].title), onTap: () { selectPage(1); }),
            ListTile(title: Text('AnimatedAlign')),
            ListTile(title: Text('AnimatedSize')),
            ListTile(title: Text('AnimatedCrossFade')),
            ListTile(title: Text('AnimatedCrossFade')),
            ListTile(title: Text('AnimatedIcon')),
            ListTile(title: Text('AnimatedPadding')),
            ListTile(title: Text('AnimatedPositioned')),
            ListTile(title: Text('AnimatedSwitcher')),
          ],
        ),
      ),
      body: subPage.samplePage,
    );
  }
}
