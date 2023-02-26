import 'dart:async';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/models/digital_card.model.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/app.bottomsheet_ui.dart';
import 'package:digicard/app/app.dialog_ui.dart';
import 'package:digicard/app/services/digital_card_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends ReactiveViewModel {
  final log = getLogger('HomeViewModel');
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _digitalCardService = locator<DigitalCardService>();

  @override
  List<ListenableServiceMixin> get listenableServices => [
        _digitalCardService,
      ];

  List<DigitalCard> get digitalCards => _digitalCardService.digitalCards;

  @override
  void onFutureError(error, Object? key) {
    log.e(error);
    _dialogService.showCustomDialog(
        variant: DialogType.error,
        barrierDismissible: true,
        description: error.toString());
    super.onFutureError(error, key);
  }

  show(DigitalCard? digitalCard) async {
    await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.digitalCard,
      data: digitalCard,
      isScrollControlled: true,
      useRootNavigator: true,
    );
  }

  Future init() async {
    await runBusyFuture(Future.wait([
      _digitalCardService.getAll(),
    ], eagerError: true));
  }
}
