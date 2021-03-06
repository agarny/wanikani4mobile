import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Constants

const Logo = 'res/logo.png';
const LogOut = 'res/logout.png';

const HomeRoute = 'Home';
const LogInRoute = 'LogIn';
const LessonsRoute = 'Lessons';
const ReviewsRoute = 'Reviews';
const SettingsRoute = 'Settings';

// Debug

final JsonDecoder _jsonDecoder = JsonDecoder();
final JsonEncoder _jsonEncoder = JsonEncoder.withIndent('  ');

void prettyPrintJson(String json) {
  _jsonEncoder
      .convert(_jsonDecoder.convert(json))
      .split('\n')
      .forEach((element) => log(element));
}

// Miscellaneous

Future<bool> open(String url) {
  return launch(
    url,
    forceWebView: true,
    enableJavaScript: true,
    enableDomStorage: true,
  );
}

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

double space2x(BuildContext context) {
  return 2.0 * space(context);
}

double space3x(BuildContext context) {
  return 3.0 * space(context);
}

Divider thinDivider() {
  return Divider(
    height: 1.0,
  );
}

Widget drawer(BuildContext context) {
  Widget drawerItem({IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Theme.of(context).primaryColor,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: space(context),
            ),
            child: Text(text),
          ),
        ],
      ),
      onTap: onTap,
    );
  }

  return Drawer(
    child: ListView(
      children: <Widget>[
        UserAccountsDrawerHeader(
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage(Logo),
          ),
          accountName: Text(
            'WaniKani for Mobile',
            style: Theme.of(context).accentTextTheme.headline6,
          ),
          accountEmail: Text(
            'by Alan Garny',
            style: Theme.of(context).accentTextTheme.caption,
          ),
        ),
        drawerItem(
          icon: Icons.star,
          text: 'WaniKani',
          onTap: () {
            open('https://wanikani.com/');
          },
        ),
        Divider(),
        drawerItem(
          icon: Icons.code,
          text: 'Source code',
          onTap: () {
            open('https://github.com/agarny/wanikani4mobile');
          },
        ),
        drawerItem(
          icon: Icons.bug_report,
          text: 'Report an issue',
          onTap: () {
            open('https://github.com/agarny/wanikani4mobile/issues/new');
          },
        ),
        Divider(),
        drawerItem(
          icon: Icons.mail,
          text: 'Contact the author',
          onTap: () {
            launch(
                'mailto:agarny@hellix.com?subject=About%20WaniKani%20for%20Mobile');
          },
        ),
        Divider(),
      ],
    ),
  );
}
