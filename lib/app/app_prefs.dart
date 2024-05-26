import 'package:shared_preferences/shared_preferences.dart';

const String PREFS_KEY_IS_PHONE_NUMBER = "PREFS_KEY_IS_PHONE_NUMBER";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<void> setPhoneNumber(String value) async {
    _sharedPreferences.setString(PREFS_KEY_IS_PHONE_NUMBER, value);
  }

  Future<String> getPhoneNumber() async {
    return _sharedPreferences.getString(PREFS_KEY_IS_PHONE_NUMBER) ?? "";
  }
}
