import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api_token_page.dart';
import 'home_page.dart';
import 'log_in_page.dart';
import 'settings.dart';
import 'splash_screen_page.dart';

class _Application extends StatelessWidget {
  _Application({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFF294DDC, <int, Color>{
          50: Color.fromRGBO(41, 77, 220, 0.1),
          100: Color.fromRGBO(41, 77, 220, 0.2),
          200: Color.fromRGBO(41, 77, 220, 0.3),
          300: Color.fromRGBO(41, 77, 220, 0.4),
          400: Color.fromRGBO(41, 77, 220, 0.5),
          500: Color.fromRGBO(41, 77, 220, 0.6),
          600: Color.fromRGBO(41, 77, 220, 0.7),
          700: Color.fromRGBO(41, 77, 220, 0.8),
          800: Color.fromRGBO(41, 77, 220, 0.9),
          900: Color.fromRGBO(41, 77, 220, 1.0),
        }),
      ),
      title: 'WaniKani for Mobile',
      home: Provider.of<Settings>(context).apiToken.isEmpty
          ? LogInPage()
          : HomePage(),
      routes: <String, WidgetBuilder>{
        '/api_token': (BuildContext context) => ApiTokenPage(),
      },
    );
  }
}

class Application extends StatelessWidget {
  Application({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        if (snapshot.hasData) {
          return ChangeNotifierProvider<Settings>.value(
            value: Settings(snapshot.data),
            child: _Application(),
          );
        }

        return SplashScreenPage();
      },
    );
  }
}
