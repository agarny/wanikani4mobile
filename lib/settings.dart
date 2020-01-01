import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wanikani4mobile/utilities.dart';

class Settings extends ChangeNotifier {
  static final Settings _instance = Settings._internal();

  SharedPreferences _prefs;
  static const String _apiTokenPref = 'API token';

  factory Settings() {
    return _instance;
  }

  Settings._internal();

  Settings.init(SharedPreferences prefs) {
    _instance._prefs = prefs;
  }

  String get apiToken => _prefs?.getString(_apiTokenPref) ?? '';

  set apiToken(String value) {
    _prefs?.setString(_apiTokenPref, value);

    notifyListeners();
  }

  Future<bool> reset() {
    return _prefs.clear();
  }
}

class SettingsPage extends StatefulWidget {
  @override
  SettingsPageState createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          OutlineButton(
            child: Text('Log out'),
            onPressed: () {
              Settings().reset().then((_) {
                Navigation().navigateTo(LogInRoute);
              });
            },
          ),
        ],
      ),
    );
  }
}
