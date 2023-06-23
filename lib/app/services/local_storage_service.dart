import 'dart:convert';

import 'package:digicard/app/app.logger.dart';

import 'package:digicard/app/models/user.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String userKey = 'user';

  final log = getLogger('LocalStorageService');

  static LocalStorageService? _instance;
  static SharedPreferences? _preferences;

  static Future<LocalStorageService> getInstance() async {
    if (_instance == null) {
      _preferences = await SharedPreferences.getInstance();
      _instance = LocalStorageService();
    }
    return Future.value(_instance);
  }

  User? get user {
    var userJson = _retrieve(userKey);
    if (userJson != null) {
      return User.fromJson(json.decode(userJson));
    }
    return null;
  }

  set user(User? userToSave) {
    _save(userKey, json.encode(userToSave?.toJson()));
  }

  void deleteUser() {
    _preferences?.remove(userKey);
    log.d("LocalStorageService:deleteUser() $userKey removed");
  }

  dynamic _retrieve(String key) {
    try {
      var value = _preferences?.get(key);
      log.d("LocalStorageService: _retrieve() | key: $key value: $value");
      return value;
    } catch (e) {
      log.d("LocalStorageService: _retrieve() failed");
    }
  }

  void _save<T>(String key, T content) {
    try {
      log.d("LocalStorageService: save() | key: $key value: $content");
      if (content is String) {
        _preferences?.setString(key, content);
      }
      if (content is bool) {
        _preferences?.setBool(key, content);
      }
      if (content is int) {
        _preferences?.setInt(key, content);
      }
      if (content is double) {
        _preferences?.setDouble(key, content);
      }
      if (content is List<String>) {
        _preferences?.setStringList(key, content);
      }
    } catch (e) {
      log.d("LocalStorageService: save() failed");
    }
  }
}
