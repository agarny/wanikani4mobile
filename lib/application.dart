import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wanikani4mobile/home.dart';
import 'package:wanikani4mobile/log_in.dart';
import 'package:wanikani4mobile/settings.dart';
import 'package:wanikani4mobile/splash_screen.dart';
import 'package:wanikani4mobile/utilities.dart';
import 'package:wanikani4mobile/wanikani.dart';

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({WidgetBuilder builder})
      : super(builder: builder);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget widget) {
    return widget;
  }
}

class _Application extends StatelessWidget {
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
        iconTheme: IconThemeData(color: Colors.white),
      ),
      title: 'WaniKani for Mobile',
      home: Settings().apiToken.isEmpty ? LogInPage() : HomePage(),
      navigatorKey: Navigation().navigatorKey,
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
        }

        if (animation) {
          return MaterialPageRoute(builder: (_) => widget);
        }

        return NoAnimationMaterialPageRoute(builder: (_) => widget);
      },
    );
  }
}

class Application extends StatefulWidget {
  @override
  ApplicationState createState() => ApplicationState();

  static void updateBadge(int nbOfReviews) {
    FlutterAppBadger.updateBadgeCount(nbOfReviews);
  }

  static void notifyReviews(int nbOfReviews) {
    if (nbOfReviews != 0) {
      FlutterLocalNotificationsPlugin().show(
        0,
        '',
        (nbOfReviews == 1)
            ? 'There is 1 review waiting to be done.'
            : 'There are 123 reviews waiting to be done.',
        NotificationDetails(
            AndroidNotificationDetails(
              'Channel id',
              'Channel name',
              'Channel description',
            ),
            IOSNotificationDetails()),
      );
    }
  }

  static void reset() {
    WaniKani().reset();

    FlutterAppBadger.removeBadge();

    FlutterLocalNotificationsPlugin().cancelAll();
  }
}

class ApplicationState extends State<Application> {
  @override
  initState() {
    super.initState();

    // Page transitions are a bit fast, so slow them down a bit.

    timeDilation = 2.0;

    // Getting ready to receive notifications.

    FlutterLocalNotificationsPlugin().initialize(InitializationSettings(
        AndroidInitializationSettings(Logo), IOSInitializationSettings()));
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder:
          (BuildContext context, AsyncSnapshot<SharedPreferences> snapshot) {
        if (snapshot.hasData) {
          Settings.init(snapshot.data);

          return _Application();
        }

        return SplashScreenPage();
      },
    );
  }
}
