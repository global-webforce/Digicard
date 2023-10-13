import 'package:digicard/app/dialog_ui.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/extensions/dynamic_extension.dart';
import 'package:digicard/app/routes/app_router.dart';
import 'package:digicard/app/routes/app_router.gr.dart';
import 'package:digicard/app/services/auth_service_supabase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

enum ActionType { login, register, forgotPassword }

const String updateProfile = 'updateProfile-busy-key';

class LoginViewModel extends ReactiveViewModel {
  final log = getLogger('LoginViewModel');
  final _dialogService = locator<DialogService>();
  final navigationService = locator<AppRouter>();
  final authService = locator<AuthService>();

  @override
  void onFutureError(error, Object? key) {
    log.e(error);
    {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _dialogService.showCustomDialog(
            variant: DialogType.error,
            barrierDismissible: true,
            description: error.toString());
      });
    }
    super.onFutureError(error, key);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [];

  final FormGroup _form = FormGroup({
    'email': FormControl<String>(
        value: kDebugMode ? 'dionnie_bulingit@yahoo.com' : null,
        validators: [
          Validators.required,
          Validators.email,
        ]),
    'password': FormControl<String>(
        value: kDebugMode ? 'qweqwe123' : null,
        validators: [
          Validators.required,
        ]),
  });
  FormGroup get form => _form;

  final FormGroup _passwordResetForm = FormGroup({
    'password': FormControl<String>(validators: [
      Validators.required,
    ]),
    'passwordConfirmation': FormControl<String>(
      validators: [
        Validators.required,
      ],
    ),
  }, validators: [
    Validators.mustMatch('password', 'passwordConfirmation')
  ]);
  FormGroup get passwordResetForm => _passwordResetForm;

  resetPasswordRedirect() {
    if (passwordResetForm.rawValue["password"].isNullEmptyOrFalse()) {
      navigationService.back();
    }
  }

  Future logOut() async {
    await authService.logOut();
  }

  ActionType _action = ActionType.login;
  ActionType get action => _action;
  set action(v) {
    _action = v;
    //  form.reset();
    rebuildUi();
  }

  Future loginOAuth() async {
    if (!form.hasErrors) {
      await runBusyFuture(authService.loginOAuth(form.value),
          throwException: true);

      form.reset();
    }
  }

  Future login() async {
    if (!form.hasErrors) {
      await runBusyFuture(authService.login(form.value), throwException: true)
          .then((value) {
        form.reset();
        navigationService.replaceAll([
          const InitialRoute(),
        ]);
      });
    }
  }

  Future register() async {
    if (!form.hasErrors) {
      await runBusyFuture(authService.register(form.value),
              throwException: true)
          .then((value) async {
        form.reset();
        if (value is String) {
          await _dialogService
              .showCustomDialog(
                  variant: DialogType.simple,
                  title: "Confirm Registration",
                  description: value)
              .then((value) async {
            await Future.delayed(const Duration(seconds: 1));
          });
        }
        await navigationService.replaceAll([
          const InitialRoute(),
        ]);
      });
    }
  }

  Future forgotPassword() async {
    if (!form.control('email').hasErrors) {
      await runBusyFuture(authService.resetPassword(form.value),
          throwException: true);

      _dialogService.showCustomDialog(
          variant: DialogType.simple,
          barrierDismissible: true,
          description:
              "We've sent reset password link to your email. Please check");
    } else {
      _dialogService.showCustomDialog(
          variant: DialogType.simple,
          barrierDismissible: true,
          description:
              "To reset password, enter your account email, then tap Forgot Password again.");
    }
  }

  Future resetPassword() async {
    if (!passwordResetForm.hasErrors) {
      await runBusyFuture(
              authService
                  .updatePassword("${passwordResetForm.rawValue["password"]}"),
              throwException: true)
          .then((value) {
        passwordResetForm.reset();
        navigationService.replace(
          const InitialRoute(),
        );
      });

      passwordResetForm.reset();
    }
  }
}
