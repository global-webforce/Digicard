import 'dart:async';
import 'dart:convert';
import 'package:http_parser/http_parser.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:digicard/app/api/api_service.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/core/local_storage/local_storage_service.dart';
import 'package:digicard/app/models/user.model.dart';
import 'package:digicard/app/api/api_endpoints.dart';
import 'package:stacked/stacked.dart';

import 'package:http/http.dart' as http;

class AppService with ReactiveServiceMixin {
  final _dialogService = locator<DialogService>();
  final _apiService = locator<ApiService>();
  final _localStorageService = locator<LocalStorageService>();
  DialogService get dialogService => _dialogService;

  AppService() {
    listenToReactiveValues([
      _user,
      _isOnboarded,
    ]);
  }

  final ReactiveValue<User?> _user = ReactiveValue<User?>(null);
  final ReactiveValue<bool?> _isOnboarded = ReactiveValue<bool?>(null);

  User? get user => _user.value;
  set user(User? user) {
    _user.value = user;
  }

  bool? get isOnboarded => _isOnboarded.value;

  bool isMember() {
    return user?.role == "member";
  }

  bool isServiceProvider() {
    return user?.role == "service_provider";
  }

  Future login(Map<String, dynamic> formData) async {
    await _apiService.post(
      ApiEndpoints.login,
      requestBody: formData,
      onSuccess: (res) {
        _user.value = User.fromJson(jsonDecode(res.body)["user"]);
        _localStorageService.user = User.fromJson(jsonDecode(res.body)["user"]);
        _localStorageService.token = jsonDecode(res.body)["token"];
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

  Future<void> signOut() async {
    _user.value = null;
    _localStorageService.deleteUser();
  }

  Future<void> onboard() async {
    _isOnboarded.value = true;
    _localStorageService.isOnboarded = true;
  }
}
