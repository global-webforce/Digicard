import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/services/digital_card_service.dart';

import 'package:stacked/stacked.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class ScanQRCodeViewModel extends ReactiveViewModel {
  final log = getLogger('ScanQRCodeViewModel');

  final _digitalCardsService = locator<DigitalCardService>();
  final _snackbarService = locator<SnackbarService>();
  final _navService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();

  @override
  List<ListenableServiceMixin> get listenableServices => [_digitalCardsService];
}
