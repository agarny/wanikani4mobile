import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Constants

const Logo = 'res/logo.png';

const HomeRoute = 'Home';
const LogInRoute = 'LogIn';
const SettingsRoute = 'Settings';
const WaniKaniApiTokenRoute = 'WaniKaniApiToken';
const WaniKaniLogInRoute = 'WaniKaniLogIn';

// Debug

final JsonDecoder _jsonDecoder = JsonDecoder();
final JsonEncoder _jsonEncoder = JsonEncoder.withIndent('  ');

void prettyPrintJson(String json) {
  _jsonEncoder
      .convert(_jsonDecoder.convert(json))
      .split('\n')
      .forEach((element) => print(element));
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

Widget drawer(BuildContext context) {
  Widget drawerItem({IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: space(context)),
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
          accountName: Text('WaniKani for Mobile'),
          accountEmail: Text(
            'by Alan Garny',
            style: TextStyle(
              fontSize: 12,
              fontStyle: FontStyle.italic,
              color: Colors.white30,
            ),
          ),
        ),
        drawerItem(
          icon: Icons.star,
          text: 'WaniKani',
          onTap: () {
            launch('https://wanikani.com/');
          },
        ),
        Divider(),
        drawerItem(
          icon: Icons.code,
          text: 'Source code',
          onTap: () {
            launch('https://github.com/agarny/wanikani4mobile');
          },
        ),
        drawerItem(
          icon: Icons.bug_report,
          text: 'Report an issue',
          onTap: () {
            launch('https://github.com/agarny/wanikani4mobile/issues/new');
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
