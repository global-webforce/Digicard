import 'package:digicard/app/app.bottomsheet_ui.dart';
import 'package:digicard/app/app.dialog_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/services/_core/app_service.dart';
import 'package:digicard/app/models/user.model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:string_validator/string_validator.dart';

enum ActionType { login, register, forgotPassword }

const String updateProfile = 'updateProfile-busy-key';

class LoginViewModel extends ReactiveViewModel {
  final log = getLogger('LoginViewModel');
  final _dialogService = locator<DialogService>();
  final _appService = locator<AppService>();
  final _bottomSheetService = locator<BottomSheetService>();

  @override
  void onFutureError(error, Object? key) {
    log.e(error);
    {
      _dialogService.showCustomDialog(
          variant: DialogType.error,
          barrierDismissible: true,
          description: error.toString());
    }
    super.onFutureError(error, key);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _appService,
      ];

  User? get user => _appService.user;

  Future<void> init() async {
    await runBusyFuture(_appService.fetchUser(), throwException: true);
  }

  Future logOut() async {
    await _appService.logOut();
  }

  final _loginFormKey = GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> get loginFormKey => _loginFormKey;

  ActionType _action = ActionType.login;
  ActionType get action => _action;
  set action(v) {
    _action = v;
    _loginFormKey.currentState?.reset();
    notifyListeners();
  }

  bool _allowLogin = false;
  get allowLogin => _allowLogin;
  checkAllowLogin() {
    String email = _loginFormKey.currentState?.fields['email']?.value ?? "";
    String password =
        _loginFormKey.currentState?.fields['password']?.value ?? "";
    if (isEmail(email) && password.isNotEmpty) {
      _allowLogin = true;
    } else {
      _allowLogin = false;
    }
    notifyListeners();
  }

  Future login() async {
    if (_loginFormKey.currentState!.saveAndValidate()) {
      final formValue = _loginFormKey.currentState?.instantValue;
      await runBusyFuture(_appService.login(formValue!), throwException: true);

      /*      locator<AppRoute>().pushAndPopUntil(
        const DashboardRoute(),
        predicate: (route) => true,
      ); */

      if (_appService.user?.role == "registered") {
        _bottomSheetService
            .showCustomSheet(
                variant: BottomSheetType.codeVerification,
                takesInput: true,
                enableDrag: false,
                barrierDismissible: false,
                useRootNavigator: true)
            .whenComplete(() => _loginFormKey.currentState?.reset());
      }
    }
  }

  Future register() async {
    if (_loginFormKey.currentState!.saveAndValidate()) {
      final formValue = _loginFormKey.currentState?.instantValue;
      Map<String, dynamic> rawFormData = Map.of(formValue!);

      rawFormData.addAll({
        "place_name": "aaaa",
        "state_name": "aaaa",
        "state_code": "aaaa",
        "postcode": "aaaa",
        "latitude": "aaaa",
        "longitude": "aaaa",
        "accuracy": "aaaa",
      });

      await runBusyFuture(_appService.register(rawFormData),
          throwException: true);

      if (_appService.user?.role == "registered") {
        _bottomSheetService
            .showCustomSheet(
                variant: BottomSheetType.codeVerification,
                takesInput: true,
                enableDrag: false,
                barrierDismissible: false,
                useRootNavigator: true)
            .whenComplete(() => _loginFormKey.currentState?.reset());
      }
    }
  }

  Future forgotPassword() async {
    String? email = _loginFormKey.currentState?.fields['email']?.value;

    if (isEmail(email ?? "")) {
      await runBusyFuture(Future.delayed(const Duration(seconds: 1)),
          throwException: true);
    } else {
      _dialogService.showCustomDialog(
          variant: DialogType.simple,
          barrierDismissible: true,
          description:
              "To reset password, enter your account email above, then tap Forgot Password again.");
    }
  }

  Future fetchUser() async {
    await runBusyFuture(_appService.fetchUser(), throwException: true);
  }
}
