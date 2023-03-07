import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/routes/app_router.gr.dart';
import 'package:digicard/app/services/_core/app_service.dart';
import 'package:stacked/stacked.dart';

class SettingsViewModel extends BaseViewModel {
  final _appService = locator<AppService>();
  final _navigationService = locator<AppRoute>();

  logout() async {
    await _appService.logOut();
  }
}
