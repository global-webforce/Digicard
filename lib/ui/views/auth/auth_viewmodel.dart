import 'package:digicard/app/app.router.dart';
import 'package:digicard/app/models/forgot_password_dto.dart';
import 'package:digicard/app/models/login_dto.dart';
import 'package:digicard/app/models/register_dto.dart';
import 'package:digicard/app/services/auth_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

enum AuthType { signIn, signUp, forgotPassword, passwordReset }

class AuthViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  final _dialogService = locator<DialogService>();
  final _navService = locator<RouterService>();

  @override
  void onFutureError(error, Object? key) {
    super.onFutureError(error, key);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _dialogService.showDialog(
          title: "Error",
          barrierDismissible: true,
          description: error.toString(),
          dialogPlatform: DialogPlatform.Custom);
    });
  }

  late LoginDtoForm loginFormModel;
  late RegisterDtoForm registerFormModel;
  late ForgotPasswordDtoForm forgotPasswordFormModel;
  late RegisterDtoForm passwordResetFormModel;

  AuthType _authType = AuthType.signIn;
  AuthType get authType => _authType;
  set authType(AuthType val) {
    _authType = val;
    notifyListeners();
  }

  initialiseForms() {
    loginFormModel = LoginDtoForm(
        LoginDtoForm.formElements(LoginDto(
          email: kDebugMode ? 'dionnie_bulingit@yahoo.com' : '',
          password: kDebugMode ? 'qweqwe456' : '',
        )),
        null);
    if (loginFormModel.form.disabled) {
      loginFormModel.form.markAsDisabled();
    }
    registerFormModel =
        RegisterDtoForm(RegisterDtoForm.formElements(RegisterDto()), null);
    if (registerFormModel.form.disabled) {
      registerFormModel.form.markAsDisabled();
    }

    forgotPasswordFormModel = ForgotPasswordDtoForm(
        ForgotPasswordDtoForm.formElements(ForgotPasswordDto()), null);
    if (forgotPasswordFormModel.form.disabled) {
      forgotPasswordFormModel.form.markAsDisabled();
    }
  }

  Future forgotPassword({required email}) async {
    await runBusyFuture(_authService.resetPasswordRequest(email: email),
            throwException: true)
        .then((value) async {
      if (value != null) {
        await _dialogService.showDialog(
            title: "Password reset",
            description: value.toString(),
            dialogPlatform: DialogPlatform.Custom);
      }
    });
  }

  Future signInAnonymously() async {
    await runBusyFuture(_authService.signInAnonymously(), throwException: true)
        .then((value) {
      if (value == null) {
        Fluttertoast.showToast(
            msg: "Signed-in anonymously...",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    });
  }

  Future signIn({required email, required password}) async {
    await runBusyFuture(
            _authService.signInWithEmail(email: email, password: password),
            throwException: true)
        .then((value) {
      if (value != null) {
        _dialogService.showDialog(
            title: "Notice",
            description: value.toString(),
            dialogPlatform: DialogPlatform.Custom);
      } else {
        _navService.replaceWithDashboardView();
      }
    });
  }

  Future signUp({required email, required password}) async {
    await runBusyFuture(
            _authService.signUpWithEmail(email: email, password: password),
            throwException: true)
        .then((value) {
      if (value != null) {
        _dialogService.showDialog(
            title: "Notice",
            description: value.toString(),
            dialogPlatform: DialogPlatform.Custom);
      } else {
        _navService.replaceWithDashboardView();
      }
    });
  }
}
