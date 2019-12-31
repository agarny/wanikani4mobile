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

Future<dynamic> navigateTo(String route) {
  return GetIt.instance<NavigationService>().navigateTo(route);
}

// GUI

double space(BuildContext context) {
  return 0.5 *
      MediaQuery.of(context).textScaleFactor *
      Theme.of(context).textTheme.caption.fontSize;
}
