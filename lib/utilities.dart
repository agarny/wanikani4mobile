import 'package:flutter/material.dart';

// Constants

final appIcon = Image.asset('res/logo.png');

const HomeRoute = 'Home';
const LogInRoute = 'LogIn';
const SettingsRoute = 'Settings';
const WaniKaniApiTokenRoute = 'WaniKaniApiToken';
const WaniKaniLogInRoute = 'WaniKaniLogIn';

// Navigation

class Navigation {
  static final Navigation _instance = Navigation._();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  factory Navigation() {
    return _instance;
  }

  Navigation._();

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

// GUI

double space(BuildContext context) {
  return 0.5 *
      MediaQuery.of(context).textScaleFactor *
      Theme.of(context).textTheme.caption.fontSize;
}
