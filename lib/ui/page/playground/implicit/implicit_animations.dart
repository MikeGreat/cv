import 'package:cv/ui/page/playground/implicit/animated_align.dart';
import 'package:cv/ui/page/playground/implicit/animated_container.dart';
import 'package:cv/ui/page/playground/implicit/animated_crossfade.dart';
import 'package:cv/ui/page/playground/implicit/animated_icon.dart';
import 'package:cv/ui/page/playground/implicit/animated_opacity.dart';
import 'package:cv/ui/page/playground/implicit/animated_padding.dart';
import 'package:cv/ui/page/playground/implicit/animated_positioned.dart';
import 'package:cv/ui/page/playground/implicit/animated_size.dart';
import 'package:cv/ui/page/playground/implicit/animated_switcher.dart';
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
    ImplicitAnimationSubPage(title: 'AnimatedContainer', samplePage: AnimatedContainerPage()),
    ImplicitAnimationSubPage(title: 'AnimatedAlign', samplePage: AnimatedAlignPage()),
    ImplicitAnimationSubPage(title: 'AnimatedSize', samplePage: AnimatedSizePage()),
    ImplicitAnimationSubPage(title: 'AnimatedCrossFade', samplePage: AnimatedCrossFadePage()),
    ImplicitAnimationSubPage(title: 'AnimatedIcon', samplePage: AnimatedIconPage()),
    ImplicitAnimationSubPage(title: 'AnimatedPadding', samplePage: AnimatedPaddingPage()),
    ImplicitAnimationSubPage(title: 'AnimatedPositioned', samplePage: AnimatedPositionedPage()),
    ImplicitAnimationSubPage(title: 'AnimatedSwitcher', samplePage: AnimatedSwitcherPage()),
  ];

  ImplicitAnimationSubPage subPage = subPages[0];

  void selectPage(ImplicitAnimationSubPage page) {
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
