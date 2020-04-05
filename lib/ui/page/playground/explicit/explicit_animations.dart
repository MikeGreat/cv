import 'package:cv/ui/page/playground/explicit/build_in_transitions.dart';
import 'package:flutter/material.dart';

class ExplicitAnimationSubPage {
  final String title;
  final Widget samplePage;

  ExplicitAnimationSubPage({this.title, this.samplePage});
}

class ExplicitAnimationsPage extends StatefulWidget {
  @override
  _ExplicitAnimationsPageState createState() => _ExplicitAnimationsPageState();
}

class _ExplicitAnimationsPageState extends State<ExplicitAnimationsPage> {
  static final List<ExplicitAnimationSubPage> subPages = [
    ExplicitAnimationSubPage(title: 'Built-in Transitions', samplePage: BuiltInTransitionsPage()),
  ];

  ExplicitAnimationSubPage subPage = subPages[0];

  void selectPage(ExplicitAnimationSubPage page) {
    setState(() {
      subPage = page;
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
          children: subPages
              .map((subPage) => ListTile(
              title: Text(subPage.title),
              onTap: () {
                selectPage(subPage);
              }))
              .toList(),
        ),
      ),
      body: subPage.samplePage,
    );
  }
}
