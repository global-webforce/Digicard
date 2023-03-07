import 'dart:convert';

import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/models/address.dart';
import 'package:digicard/app/models/user.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  static const String appLanguagesKey = 'languages';
  static const String darkModeKey = 'darkmode';
  static const String isOnboardedKey = 'isOnboardedKey';
  static const String placesInAustraliaKey = 'placesInAustralia';
  static const String tokenKey = 'token';
  static const String userKey = 'user';

  final log = getLogger('LocalStorageService');

  static LocalStorageService? _instance;
  static SharedPreferences? _preferences;

  static Future<LocalStorageService> getInstance() async {
    if (_instance == null) {
      // Initialise the asynchronous shared preferences
      _preferences = await SharedPreferences.getInstance();
      _instance = LocalStorageService();
    }

    return Future.value(_instance);
  }

  Future<List<Address>> placesInAustralia() async {
    try {
      var response =
          await rootBundle.loadString('assets/json/au_postcodes.json');
      return List<Address>.from(
          jsonDecode(response).map((model) => Address.fromJson(model)));
    } catch (e) {
      log.e("Failed to load places in Australia");
    }
    return [];
  }

  List<String> get languages => _getFromDisk(appLanguagesKey);

  set languages(List<String> appLanguages) =>
      _saveToDisk(appLanguagesKey, appLanguages);

  bool get darkMode => _getFromDisk(darkModeKey);

  set darkMode(bool value) => _saveToDisk(darkModeKey, value);

  String? get token => _getFromDisk(tokenKey);

  set token(String? value) => _saveToDisk(tokenKey, value);

  bool get isOnboarded => _getFromDisk(isOnboardedKey) ?? false;

  set isOnboarded(bool? value) => _saveToDisk(isOnboardedKey, value);

  User? get user {
    var userJson = _getFromDisk(userKey);

    if (userJson != null) {
      return User.fromJson(json.decode(userJson));
    }

    return null;
  }

  set user(User? userToSave) {
    //  _saveToDisk(userKey, json.encode(u));
  }

  void deleteUser() {
    _preferences!.remove(userKey);
    _preferences!.remove(tokenKey);
    log.w("LocalStorageService:deleteUser() $userKey & $tokenKey removed");
  }

  dynamic _getFromDisk(String key) {
    try {
      var value = _preferences!.get(key);
      log.i("LocalStorageService:_getFromDisk() | key: $key value: $value");
      return value;
    } catch (e) {
      log.e("LocalStorageService:_getFromDisk() failed");
    }
  }

  void _saveToDisk<T>(String key, T content) {
    try {
      log.i("LocalStorageService:_saveToDisk() | key: $key value: $content");
      if (content is String) {
        _preferences!.setString(key, content);
      }
      if (content is bool) {
        _preferences!.setBool(key, content);
      }
      if (content is int) {
        _preferences!.setInt(key, content);
      }
      if (content is double) {
        _preferences!.setDouble(key, content);
      }
      if (content is List<String>) {
        _preferences!.setStringList(key, content);
      }
    } catch (e) {
      log.e("LocalStorageService:_saveToDisk() failed");
    }
  }
}
