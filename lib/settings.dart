import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wanikani4mobile/utilities.dart';

class SettingsService extends ChangeNotifier {
  SharedPreferences _prefs;
  static const String _apiTokenPref = 'API token';

  init(SharedPreferences prefs) {
    _prefs = prefs;
  }

  String get apiToken => _prefs?.getString(_apiTokenPref) ?? '';

  void setApiToken(String value) {
    _prefs?.setString(_apiTokenPref, value);

    notifyListeners();
  }

  Future<bool> reset() {
    return _prefs.clear();
  }
}

SettingsService initSettings(SharedPreferences prefs) {
  SettingsService res = GetIt.instance<SettingsService>();

  res.init(prefs);

  return res;
}

Future<bool> resetSettings() {
  return GetIt.instance<SettingsService>().reset();
}

String waniKaniApiToken() {
  return GetIt.instance<SettingsService>().apiToken;
}

void setWaniKaniApiToken(String value) {
  GetIt.instance<SettingsService>().setApiToken(value);
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
              resetSettings().then((_) {
                navigateTo(LogInRoute);
              });
            },
          ),
        ],
      ),
    );
  }
}
