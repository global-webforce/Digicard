import 'package:digicard/app/app.dialog_ui.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/app.logger.dart';

import 'package:digicard/app/routes/app_router.gr.dart';
import 'package:digicard/app/services/_core/auth_service_supabase.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class InitialViewModel extends ReactiveViewModel {
  final log = getLogger('CardOpenViewModel');

  final _authService = locator<AuthService>();
  final appRouter = locator<AppRoute>();
  final _dialogService = locator<DialogService>();

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

  User? get user => _authService.authState?.session?.user;

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];

  checkSession() async {
    await runBusyFuture(_authService.checkSession(), throwException: true);
  }
}
