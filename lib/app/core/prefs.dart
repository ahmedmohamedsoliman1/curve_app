import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/auth/registerResponseModel.dart';

class Prefs {
  static late SharedPreferences prefs;

  static Future<bool> saveString(
      {required String key, required String value}) async {
    return prefs.setString(key, value);
  }

  static Future<bool> setMap(
      {required String key, required Map<dynamic, dynamic> object}) async {
    return prefs.setString(key, jsonEncode(object));
  }

  static Map<String, dynamic> getMap(String key) {
    final data = getString(key: key);
    //return jsonDecode(data!) as Map<String, dynamic>;
    return data == null ? {} : jsonDecode(data) as Map<String, dynamic>;
  }

  static String? getString({required String key}) {
    return prefs.getString(key);
  }

  static Future<bool> saveUser(
      {required String key, required RegisterResponseModel model}) async {
    return setMap(key: key, object: model.toJson());
  }
  static Future<bool> saveGoogleUser(
      {required String key, required Map<String ,dynamic> model}) async {
    return setMap(key: key, object: model);
  }

  static Future<bool> saveToken(
      {required String key, required String token}) async {
    return saveString(key: key, value: token);
  }

  static String? getToken({required String key}) {
    return getString(key: key);
  }

  static Map<String, dynamic> getUser({required String key}) {
    return getMap(key);
  }
}
