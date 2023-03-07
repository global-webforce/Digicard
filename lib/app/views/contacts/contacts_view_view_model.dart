import 'package:digicard/app/app.locator.dart';

import 'package:digicard/app/services/_core/app_service.dart';
import 'package:digicard/app/models/user.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ContactsViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _appService = locator<AppService>();

  User? get user => _appService.user;

  //
}
