import 'dart:async';
import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:digicard/app/routes/app_router.gr.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:http_parser/http_parser.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:digicard/app/api/api_service.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/services/_core/local_storage_service.dart';
import 'package:digicard/app/models/user.dart';
import 'package:digicard/app/api/api_endpoints.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class AppService with ListenableServiceMixin {
  AppService() {
    listenToReactiveValues([
      _user,
      _isOnboarded,
    ]);
  }

  final _apiService = locator<ApiService>();
  final _dialogService = locator<DialogService>();
  final ReactiveValue<bool?> _isOnboarded = ReactiveValue<bool?>(null);
  final _localStorageService = locator<LocalStorageService>();
  final ReactiveValue<User?> _user = ReactiveValue<User?>(null);

  DialogService get dialogService => _dialogService;

  User? get user => _user.value;

  set user(User? user) {
    _user.value = user;
  }

  bool? get isOnboarded => _isOnboarded.value;

  set isOnboarded(bool? val) {
    _isOnboarded.value = val;
  }

  List<PageRouteInfo<dynamic>> isLoggedIn() {
    if (!kIsWeb) FlutterNativeSplash.remove();

    return [
      if (_localStorageService.token == null) const AuthRoute(),
      if (_localStorageService.token != null) const DashboardRoute(),
    ];
  }

  Future login(Map<String, dynamic> formData) async {
    await _apiService.post(
      ApiEndpoints.login,
      requestBody: formData,
      onSuccess: (res) {
        _user.value = User.fromJson(jsonDecode(res.body)["user"]);
        _localStorageService.user = User.fromJson(jsonDecode(res.body)["user"]);
        _localStorageService.token = jsonDecode(res.body)["token"];
        notifyListeners();
      },
      onError: (e) {},
    );
  }

  Future register(Map<String, dynamic> formData) async {
    await _apiService.post(
      ApiEndpoints.register,
      requestBody: formData,
      onSuccess: (res) {
        _user.value = User.fromJson(jsonDecode(res.body)["user"]);
        _localStorageService.user = User.fromJson(jsonDecode(res.body)["user"]);
        _localStorageService.token = jsonDecode(res.body)["token"];
      },
      onError: (e) {},
    );
  }

  Future verifyCode(Map<String, dynamic> formData) async {
    await _apiService.post(
      ApiEndpoints.instance.verifyUserByCode(),
      requestBody: formData,
      onSuccess: (res) {
        _user.value = User.fromJson(jsonDecode(res.body));
        _localStorageService.user = _user.value;
      },
      onError: (e) {},
    );
  }

  Future fetchUser({int? userId}) async {
    _user.value = _localStorageService.user;
  }

  Future updateProfile(Map<String, dynamic> formData) async {
    await _apiService.postFile(
      ApiEndpoints.instance.userProfile(),
      requestBody: formData,
      files: formData['profile_pic'] != null
          ? [
              http.MultipartFile.fromBytes(
                'profile-pic',
                await formData['profile_pic']![0].readAsBytes(),
                filename: formData['profile_pic']![0].name,
                contentType: MediaType("image", "*"),
              )
            ]
          : [],
      onSuccess: (res) {
        _user.value = User.fromJson(jsonDecode(res.body));
        _localStorageService.user = _user.value;
      },
      onError: (e) {},
    );
  }

  Future<void> logOut() async {
    _user.value = null;
    _localStorageService.deleteUser();
    notifyListeners();
  }
}
