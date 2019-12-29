import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:validators/validators.dart';

const space = 8.0;

final appIcon = Image.asset('res/logo.png');

TextStyle bodyStyle(BuildContext context) {
  return Theme.of(context).textTheme.body1;
}

TextStyle linkStyle(BuildContext context) {
  final ThemeData themeData = Theme.of(context);

  return themeData.textTheme.body1.copyWith(color: themeData.accentColor);
}

class LinkTextSpan extends TextSpan {
  LinkTextSpan(
      {String text, TextStyle style, String urlOrRoute, BuildContext context})
      : super(
            text: text ?? urlOrRoute,
            style: style,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                if (isURL(urlOrRoute)) {
                  launch(urlOrRoute);
                } else {
                  NavigatorState navigatorState = Navigator.of(context);

                  navigatorState.pushNamed(urlOrRoute);
                }
              });
}
