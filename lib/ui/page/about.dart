import 'package:cv/localization/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:transparent_image/transparent_image.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 100,
            height: 100,
            child: Neumorphic(
              boxShape: NeumorphicBoxShape.circle(),
              style: NeumorphicStyle(
                  shape: NeumorphicShape.flat,
                  color: Theme.of(context).backgroundColor,
                  lightSource: LightSource.bottom,
                  depth: 4.0),
              child: FadeInImage(
                image: AssetImage('assets/images/profil.jpeg'),
                placeholder: MemoryImage(kTransparentImage),
                fadeInDuration: Duration(milliseconds: 300),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 24,
        ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Text(AppLocalizations.of(context).aboutText),
        )
      ],
    );
  }
}
