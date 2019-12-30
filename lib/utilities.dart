import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:validators/validators.dart';

// Constants

final appIcon = Image.asset('res/logo.png');

const HomeRoute = 'Home';
const LogInRoute = 'LogIn';
const SettingsRoute = 'Settings';
const WaniKaniApiTokenRoute = 'WaniKaniApiToken';
const WaniKaniLogInRoute = 'WaniKaniLogIn';

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

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String route) {
    if ((route == HomeRoute) || (route == LogInRoute)) {
      while (navigatorKey.currentState.canPop()) {
        navigatorKey.currentState.pop();
      }

      return navigatorKey.currentState.pushReplacementNamed(route);
    } else {
      return navigatorKey.currentState.pushNamed(route);
    }
  }
}

void registerNavigationService() {
  GetIt.instance.registerLazySingleton(() => NavigationService());
}

GlobalKey<NavigatorState> navigatorKey() {
  return GetIt.instance<NavigationService>().navigatorKey;
}

Future<dynamic> navigateTo(String route) {
  return GetIt.instance<NavigationService>().navigateTo(route);
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
                  navigateTo(urlOrRoute);
                }
              });
}
