import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cache extends ChangeNotifier {
  static final Cache _instance = Cache._();

  SharedPreferences _prefs;
  static const String _userNamePref = 'User name';
  static const String _levelPref = 'Level';
  static const String _lessonsAvailablePref = 'Lessons available';
  static const String _reviewsAvailablePref = 'Reviews available';

  factory Cache() {
    return _instance;
  }

  Cache._();

  Cache.init(SharedPreferences prefs) {
    _instance._prefs = prefs;
  }

  String get userName => _prefs?.getString(_userNamePref) ?? '';

  set userName(String value) {
    _prefs?.setString(_userNamePref, value);

    notifyListeners();
  }

  String get level => _prefs?.getString(_levelPref) ?? '';

  set level(String value) {
    _prefs?.setString(_levelPref, value);

    notifyListeners();
  }

  String get lessonsAvailable =>
      _prefs?.getString(_lessonsAvailablePref) ?? '0';

  set lessonsAvailable(String value) {
    _prefs?.setString(_lessonsAvailablePref, value);

    notifyListeners();
  }

  String get reviewsAvailable =>
      _prefs?.getString(_reviewsAvailablePref) ?? '0';

  set reviewsAvailable(String value) {
    _prefs?.setString(_reviewsAvailablePref, value);

    notifyListeners();
  }

  void reset() {
    _prefs.clear();
  }
}
