import 'package:cv/ui/animation/hero_tween.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///
/// ## Presentation:
///
/// Miniature ui.widget sample with just 2 attributes and other widgets reused
///
/// Widget that displays textual logo. Since it is logo, it can be used
/// as hero ui.widget (just specify [tag]). The [GoogleFonts.montserrat] font will
/// be used along with [TextTheme.headline6] style
///
class TextLogo extends StatelessWidget {
  final String text;
  final String tag;
  final CreateRectTween createRectTween;

  TextLogo({@required this.text, this.tag, this.createRectTween});

  @override
  Widget build(BuildContext context) {
    return tag == null
        ? _getText(context)
        : Hero(
            tag: tag,
            createRectTween: createRectTween,
            child: _getText(context),
          );
  }

  _getText(BuildContext context) => Text(
        text,
        style: GoogleFonts.magra(
          fontWeight: FontWeight.w800,
          letterSpacing: 1.5,
          color: Colors.white,
          textStyle: Theme.of(context).textTheme.headline4,
        ),
      );
}
