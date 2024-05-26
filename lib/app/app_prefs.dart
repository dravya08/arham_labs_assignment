import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/condition/condition_model.dart';

const String PREFS_KEY_IS_PHONE_NUMBER = "PREFS_KEY_IS_PHONE_NUMBER";
const String PREFS_KEY_IS_GET_CONDITIONS = "PREFS_KEY_IS_GET_CONDITIONS";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  Future<void> setPhoneNumber(String value) async {
    _sharedPreferences.setString(PREFS_KEY_IS_PHONE_NUMBER, value);
  }

  Future<String> getPhoneNumber() async {
    return _sharedPreferences.getString(PREFS_KEY_IS_PHONE_NUMBER) ?? "";
  }

  Future<void> setConditions(List<Datapoint> value) async {
    List<String> jsonList =
        value.map((object) => jsonEncode(object.toJson())).toList();
    _sharedPreferences.setStringList(PREFS_KEY_IS_GET_CONDITIONS, jsonList);
  }

  Future<List<Datapoint>> getConditions() async {
    List<String>? jsonList =
        _sharedPreferences.getStringList(PREFS_KEY_IS_GET_CONDITIONS);

    if (jsonList != null) {
      return jsonList.map((jsonString) {
        Map<String, dynamic> json = jsonDecode(jsonString);
        return Datapoint.fromJson(json);
      }).toList();
    } else {
      return [];
    }

    // return json.decode(
    //     _sharedPreferences.getString(PREFS_KEY_IS_GET_CONDITIONS) ?? "");
    // return _sharedPreferences.getString(PREFS_KEY_IS_GET_CONDITIONS) ?? "";
  }
}
