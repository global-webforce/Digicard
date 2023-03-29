import 'package:digicard/app/app.locator.dart';

import 'package:digicard/app/services/_core/auth_service_supabase.dart';
import 'package:stacked/stacked.dart';

class SettingsViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();

  logout() async {
    await _authService.logOut();
  }
}
