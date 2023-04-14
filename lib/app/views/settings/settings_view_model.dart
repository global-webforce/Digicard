import 'package:digicard/app/app.locator.dart';

import 'package:digicard/app/services/_core/auth_service_supabase.dart';
import 'package:digicard/app/services/digital_card_service.dart';
import 'package:stacked/stacked.dart';

class SettingsViewModel extends BaseViewModel {
  final d = locator<DigitalCardService>();
  final _authService = locator<AuthService>();

  logout() async {
    d.clean();
    await _authService.logOut();
  }
}
