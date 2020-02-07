import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wanikani4mobile/browser.dart';
import 'package:wanikani4mobile/cache.dart';
import 'package:wanikani4mobile/home.dart';
import 'package:wanikani4mobile/log_in.dart';
import 'package:wanikani4mobile/settings.dart';
import 'package:wanikani4mobile/splash_screen.dart';
import 'package:wanikani4mobile/utilities.dart';
import 'package:wanikani4mobile/wanikani.dart';

const _primaryColor = Color(0xFF1975BF);
const _secondaryColor = Color(0xFF13B9FD);

final ColorScheme _colorScheme = ColorScheme.light().copyWith(
  primary: _primaryColor,
  secondary: _secondaryColor,
);

final ThemeData _theme = ThemeData(
  brightness: Brightness.light,
  accentColorBrightness: Brightness.dark,
  colorScheme: _colorScheme,
  primaryColor: _primaryColor,
  buttonColor: _primaryColor,
  indicatorColor: Colors.white,
  toggleableActiveColor: Color(0xFF1E88E5),
  splashColor: Colors.white24,
  splashFactory: InkRipple.splashFactory,
  accentColor: _primaryColor,
  canvasColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  backgroundColor: Colors.white,
  errorColor: Color(0xFFB00020),
  buttonTheme: ButtonThemeData(
    colorScheme: _colorScheme,
    textTheme: ButtonTextTheme.primary,
  ),
);

final ThemeData _darkTheme = ThemeData(
  brightness: Brightness.dark,
  accentColorBrightness: Brightness.dark,
  primaryColor: _primaryColor,
  primaryColorDark: Color(0xFF0050a0),
  primaryColorLight: _secondaryColor,
  buttonColor: _primaryColor,
  indicatorColor: Colors.white,
  toggleableActiveColor: Color(0xFF6997DF),
  accentColor: _primaryColor,
  canvasColor: Color(0xFF202124),
  scaffoldBackgroundColor: Color(0xFF202124),
  backgroundColor: Color(0xFF202124),
  errorColor: Color(0xFFB00020),
  buttonTheme: ButtonThemeData(
    colorScheme: ColorScheme.dark().copyWith(
      primary: _primaryColor,
      secondary: _secondaryColor,
    ),
    textTheme: ButtonTextTheme.primary,
  ),
);

class _NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  _NoAnimationMaterialPageRoute({WidgetBuilder builder})
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
      theme: _theme,
      darkTheme: _darkTheme,
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
          case LessonsRoute:
            widget =
                BrowserPage('Lessons', 'https://wanikani.com/lesson/session');
            break;
          case ReviewsRoute:
            widget =
                BrowserPage('Reviews', 'https://wanikani.com/review/session');
            break;
          case SettingsRoute:
            widget = SettingsPage();
            break;
        }

        if (animation) {
          return MaterialPageRoute(builder: (_) => widget);
        }

        return _NoAnimationMaterialPageRoute(builder: (_) => widget);
      },
    );
  }
}

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();

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
            : 'There are $nbOfReviews reviews waiting to be done.',
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

  static void reset({bool resetAll = false}) {
    WaniKani().reset();

    FlutterAppBadger.removeBadge();

    FlutterLocalNotificationsPlugin().cancelAll();

    if (resetAll) {
      Settings().reset();
      Cache().reset();
    }
  }
}

class _ApplicationState extends State<Application> {
  @override
  initState() {
    super.initState();

    // Page transitions are a bit fast, so slow them down a bit.

    timeDilation = 2.0;
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
          Cache.init(snapshot.data);

          return _Application();
        }

        return SplashScreenPage();
      },
    );
  }
}
