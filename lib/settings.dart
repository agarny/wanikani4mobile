import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wanikani4mobile/application.dart';
import 'package:wanikani4mobile/utilities.dart';

class Settings extends ChangeNotifier {
  static final Settings _instance = Settings._();

  SharedPreferences _prefs;
  static const _emailAddressPref = 'E-mail address';
  static const _apiTokenPref = 'API token';

  factory Settings() {
    return _instance;
  }

  Settings._();

  Settings.init(SharedPreferences prefs) {
    _instance._prefs = prefs;
  }

  String get emailAddress => _prefs?.getString(_emailAddressPref) ?? '';

  set emailAddress(String value) {
    _prefs?.setString(_emailAddressPref, value);

    notifyListeners();
  }

  String get apiToken => _prefs?.getString(_apiTokenPref) ?? '';

  set apiToken(String value) {
    _prefs?.setString(_apiTokenPref, value);

    notifyListeners();
  }

  Future<void> reset() async {
    _prefs.clear().then((_) {});
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton.icon(
            icon: Image.asset(
              LogOut,
              width: Theme.of(context).textTheme.subhead.fontSize,
            ),
            label: Text('Log out'),
            onPressed: () {
              Application.reset(resetAll: true);

              Navigation().navigateTo(LogInRoute);
            },
          ),
        ],
      ),
    );
  }
}
