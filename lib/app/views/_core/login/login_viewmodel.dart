import 'package:digicard/app/app.bottomsheet_ui.dart';
import 'package:digicard/app/app.dialog_ui.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/services/_core/app_service.dart';
import 'package:digicard/app/models/user.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

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

  final FormGroup _form = FormGroup({
    'email': FormControl<String>(validators: [
      Validators.required,
      Validators.email,
    ]),
    'password': FormControl<String>(validators: [
      Validators.required,
    ]),
  });
  FormGroup get form => _form;

  User? get user => _appService.user;

  Future<void> init() async {
    await runBusyFuture(_appService.fetchUser(), throwException: true);
  }

  Future logOut() async {
    await _appService.logOut();
  }

  ActionType _action = ActionType.login;
  ActionType get action => _action;
  set action(v) {
    _action = v;
    form.reset();
    rebuildUi();
  }

  Future login() async {
    if (!form.hasErrors) {
      await runBusyFuture(_appService.login(form.value), throwException: true);
      if (_appService.user?.role == "registered") {
        _bottomSheetService
            .showCustomSheet(
                variant: BottomSheetType.codeVerification,
                takesInput: true,
                enableDrag: false,
                barrierDismissible: false,
                useRootNavigator: true)
            .whenComplete(() => form.reset());
      }
    }
  }

  Future register() async {
    if (!form.hasErrors) {
      await runBusyFuture(_appService.register(form.value),
          throwException: true);
      if (_appService.user?.role == "registered") {
        _bottomSheetService
            .showCustomSheet(
                variant: BottomSheetType.codeVerification,
                takesInput: true,
                enableDrag: false,
                barrierDismissible: false,
                useRootNavigator: true)
            .whenComplete(() => form.reset());
      }
    }
  }

  Future forgotPassword() async {
    if (!form.control('email').hasErrors) {
      await runBusyFuture(Future.delayed(const Duration(seconds: 1)),
          throwException: true);
    } else {
      _dialogService.showCustomDialog(
          variant: DialogType.simple,
          barrierDismissible: true,
          description:
              "To reset password, enter your account email, then tap Forgot Password again.");
    }
  }

  Future fetchUser() async {
    await runBusyFuture(_appService.fetchUser(), throwException: true);
  }
}
