import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/condition/condition_model.dart';

const String PREFS_KEY_IS_PHONE_NUMBER = "PREFS_KEY_IS_PHONE_NUMBER";
const String PREFS_KEY_IS_GET_CONDITIONS = "PREFS_KEY_IS_GET_CONDITIONS";

class AppPreferences {
  // The SharedPreferences instance that will be used to store and retrieve data
  final SharedPreferences _sharedPreferences;

  // Constructor to initialize the SharedPreferences instance
  AppPreferences(this._sharedPreferences);

  // Method to store the phone number as a string in SharedPreferences
  Future<void> setPhoneNumber(String value) async {
    _sharedPreferences.setString(PREFS_KEY_IS_PHONE_NUMBER, value);
  }

  // Method to retrieve the phone number from SharedPreferences
  Future<String> getPhoneNumber() async {
    return _sharedPreferences.getString(PREFS_KEY_IS_PHONE_NUMBER) ?? "";
  }

  // Method to store a list of Datapoint objects in SharedPreferences
  Future<void> setConditions(List<Datapoint> value) async {
    List<String> jsonList =
        value.map((object) => jsonEncode(object.toJson())).toList();

    _sharedPreferences.setStringList(PREFS_KEY_IS_GET_CONDITIONS, jsonList);
  }

  // Method to retrieve a list of Datapoint objects from SharedPreferences
  Future<List<Datapoint>> getConditions() async {
    List<String>? jsonList =
        _sharedPreferences.getStringList(PREFS_KEY_IS_GET_CONDITIONS);

    if (jsonList != null) {
      return jsonList.map((jsonString) {
        Map<String, dynamic> json = jsonDecode(jsonString);

        return Datapoint.fromJson(json);
      }).toList();
    } else {
      // If the list is null, return an empty list
      return [];
    }
  }
}
