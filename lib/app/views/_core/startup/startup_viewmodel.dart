import 'package:digicard/app/app.dialog_ui.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/app.logger.dart';

import 'package:digicard/app/services/_core/user_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../services/deeplink_service.dart';

const String loadingBusyKey = 'loadingBusyKey';

class StartupViewModel extends ReactiveViewModel {
  final log = getLogger('StartupViewModel');

  final _userService = locator<UserService>();

  final _dialogService = locator<DialogService>();

  get isPresent => _userService.isPresent;

  final _deeplinkService = locator<DeeplinkService>();

  init() async {
    await _deeplinkService.initURIHandler();
    _deeplinkService.incomingLinkHandler();
  }

  stop() {
    _deeplinkService.dispose();
  }

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
  List<ListenableServiceMixin> get listenableServices => [_userService];
}
