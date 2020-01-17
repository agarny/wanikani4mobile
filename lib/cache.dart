import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cache extends ChangeNotifier {
  static final Cache _instance = Cache._();

  SharedPreferences _prefs;
  static const String _lessonsAvailablePref = 'Lessons available';
  static const String _reviewsAvailablePref = 'Reviews available';

  factory Cache() {
    return _instance;
  }

  Cache._();

  Cache.init(SharedPreferences prefs) {
    _instance._prefs = prefs;
  }

  String get lessonsAvailable => _prefs?.getString(_lessonsAvailablePref) ?? '0';

  set lessonsAvailable(String value) {
    _prefs?.setString(_lessonsAvailablePref, value);

    notifyListeners();
  }

  String get reviewsAvailable => _prefs?.getString(_reviewsAvailablePref) ?? '0';

  set reviewsAvailable(String value) {
    _prefs?.setString(_reviewsAvailablePref, value);

    notifyListeners();
  }

  Future<void> reset() async {
    _prefs.clear().then((_) {});
  }
}
