import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:validators/validators.dart';

// Constants

final appIcon = Image.asset('res/logo.png');

const ApiTokenRoute = '/api_token';
const HomeRoute = '/home';
const LogInRoute = '/log_in';
const SettingsRoute = '/settings';
const WaniKaniLogInRoute = '/wanikani_log_in';

// Navigation

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({WidgetBuilder builder})
      : super(builder: builder);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget widget) {
    return widget;
  }
}

void goToPage(String route, BuildContext context) {
  NavigatorState navigatorState = Navigator.of(context);

  if ((route == HomeRoute) || (route == LogInRoute)) {
    while (navigatorState.canPop()) {
      navigatorState.pop();
    }

    navigatorState.pushReplacementNamed(route);
  } else {
    navigatorState.pushNamed(route);
  }
}

// GUI

double space(BuildContext context) {
  return 0.5 *
      MediaQuery.of(context).textScaleFactor *
      Theme.of(context).textTheme.caption.fontSize;
}

TextStyle bodyStyle(BuildContext context) {
  return Theme.of(context).textTheme.body1;
}

TextStyle linkStyle(BuildContext context) {
  final ThemeData themeData = Theme.of(context);

  return themeData.textTheme.body1.copyWith(color: themeData.primaryColor);
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
                  launch(
                    urlOrRoute,
                    forceWebView: true,
                    enableJavaScript: true,
                  );
                } else {
                  goToPage(urlOrRoute, context);
                }
              });
}
