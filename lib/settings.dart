import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wanikani4mobile/utilities.dart';

class Settings extends ChangeNotifier {
  final SharedPreferences _prefs;

  static final String _apiTokenPref = 'API token';

  Settings(this._prefs);

  String get apiToken => _prefs?.getString(_apiTokenPref) ?? '';

  void setApiToken(String value) {
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
              Provider.of<Settings>(context, listen: false).reset().then((_) {
                GetIt.instance<NavigationService>().navigateTo(LogInRoute);
              });
            },
          ),
        ],
      ),
    );
  }
}
