import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wanikani4mobile/home.dart';
import 'package:wanikani4mobile/log_in.dart';
import 'package:wanikani4mobile/settings.dart';
import 'package:wanikani4mobile/splash_screen.dart';
import 'package:wanikani4mobile/utilities.dart';
import 'package:wanikani4mobile/wanikani_api_token.dart';
import 'package:wanikani4mobile/wanikani_log_in.dart';

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
      navigatorKey: GetIt.instance<NavigationService>().navigatorKey,
      onGenerateRoute: (RouteSettings settings) {
        Widget widget = SplashScreenPage();
        bool animation = true;

        switch (settings.name) {
          case HomeRoute:
            widget = HomePage();
            animation = false;
            break;
          case LogInRoute:
            widget = LogInPage();
            animation = false;
            break;
          case SettingsRoute:
            widget = SettingsPage();
            break;
          case WaniKaniApiTokenRoute:
            widget = WaniKaniApiTokenPage();
            break;
          case WaniKaniLogInRoute:
            widget = WaniKaniLogInPage();
            break;
        }

        if (animation) {
          return MaterialPageRoute(builder: (_) => widget);
        }

        return NoAnimationMaterialPageRoute(builder: (_) => widget);
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
