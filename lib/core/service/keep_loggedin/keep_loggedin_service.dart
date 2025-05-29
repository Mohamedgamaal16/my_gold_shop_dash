import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsManager {
  static final SharedPrefsManager _instance = SharedPrefsManager._internal();
  static SharedPreferences? _prefs;

  static const String _keyIsLoggedIn = 'isLoggedIn';

  SharedPrefsManager._internal();

  static Future<void> init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  static SharedPrefsManager get instance => _instance;

  Future<void> saveLoginStatus(bool isLoggedIn) async {
    await _prefs?.setBool(_keyIsLoggedIn, isLoggedIn);
  }

  bool get isLoggedIn => _prefs?.getBool(_keyIsLoggedIn) ?? false;

  Future<void> clearAll() async {
    await _prefs?.clear();
  }
}
