import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends ChangeNotifier {
  final SharedPreferences _prefs;

  static final String _apiTokenPref = 'API token';

  Settings(this._prefs);

  String get apiToken => _prefs?.getString(_apiTokenPref) ?? '';

  void setApiToken(String value) {
    _prefs?.setString(_apiTokenPref, value);

    notifyListeners();
  }
}
