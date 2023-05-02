import 'package:digicard/app/app.locator.dart';

import 'package:digicard/app/services/_core/auth_service_supabase.dart';
import 'package:digicard/app/services/_core/user_service.dart';
import 'package:digicard/app/services/digital_card_service.dart';
import 'package:stacked/stacked.dart';

class SettingsViewModel extends BaseViewModel {
  final _digitalCardService = locator<DigitalCardService>();
  final _authService = locator<AuthService>();
  final _userService = locator<UserService>();

  String get email => "${_userService.user?.email}";

  logout() async {
    _digitalCardService.clean();
    await _authService.logOut();
  }
}
