import 'package:digicard/app/app.dialog_ui.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/extensions/dynamic_extension.dart';
import 'package:digicard/app/routes/app_router.dart';
import 'package:digicard/app/routes/app_router.gr.dart';

import 'package:digicard/app/services/_core/auth_service_supabase.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

enum ActionType { login, register, forgotPassword }

const String updateProfile = 'updateProfile-busy-key';

class LoginViewModel extends ReactiveViewModel {
  final log = getLogger('LoginViewModel');
  final _dialogService = locator<DialogService>();
  final appRouter = locator<AppRouter>();
  final _authService = locator<AuthService>();

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
        value: 'bulingitmarkdionnie@gmail.com',
        validators: [
          Validators.required,
          Validators.email,
        ]),
    'password': FormControl<String>(value: 'abc12345', validators: [
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
      appRouter.back();
    }
  }

  Future logOut() async {
    await _authService.logOut();
  }

  ActionType _action = ActionType.login;
  ActionType get action => _action;
  set action(v) {
    _action = v;
    //  form.reset();
    rebuildUi();
  }

  Future login() async {
    if (!form.hasErrors) {
      await runBusyFuture(_authService.login(form.value), throwException: true)
          .then((value) {
        appRouter.replaceAll([
          const InitialRoute(),
        ]);
      });

      form.reset();
    }
  }

  Future register() async {
    if (!form.hasErrors) {
      await runBusyFuture(_authService.register(form.value),
              throwException: true)
          .then((value) {
        appRouter.replaceAll([
          const InitialRoute(),
        ]);
      });

      form.reset();
    }
  }

  Future forgotPassword() async {
    if (!form.control('email').hasErrors) {
      await runBusyFuture(_authService.resetPassword(form.value),
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
              _authService
                  .updatePassword("${passwordResetForm.rawValue["password"]}"),
              throwException: true)
          .then((value) {
        appRouter.replaceAll([
          const InitialRoute(),
        ]);
      });

      passwordResetForm.reset();
    }
  }
}
