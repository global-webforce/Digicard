import 'package:digicard/app/app.dialog_ui.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/services/digital_card_service.dart';

import 'package:stacked/stacked.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const String loadingCardBusyKey = 'loadingCardBusyKey';

class CardLoaderViewModel extends ReactiveViewModel {
  final log = getLogger('CardLoaderViewModel');
  final _supabase = Supabase.instance.client;
  User? get user => _supabase.auth.currentUser;

  DigitalCard? card;

  final _dialogService = locator<DialogService>();
  final _digitalCardService = locator<DigitalCardService>();

  @override
  void onFutureError(error, Object? key) {
    log.e(error);

    _dialogService.showCustomDialog(
        variant: DialogType.error,
        barrierDismissible: true,
        description: error.toString());

    super.onFutureError(error, key);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_digitalCardService];

  init(String uuid) async {
    card = await runBusyFuture(_digitalCardService.findOne(uuid),
        busyObject: loadingCardBusyKey, throwException: true);
    if (card is DigitalCard) {
    } else {
      await _dialogService.showCustomDialog(
        variant: DialogType.simple,
        title: "Card not found",
        description: "This card might be deleted by the owner.",
      );
    }
  }
}
