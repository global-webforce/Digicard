import 'package:digicard/app/app.dialogs.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/models/digital_card_dto.dart';
import 'package:digicard/app/services/digital_card_service.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:stacked/stacked.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class CardViewerWebViewModel extends ReactiveViewModel {
  final log = getLogger('CardViewerWebViewModel');
  final _digitalCardService = locator<DigitalCardService>();
  final _dialogService = locator<DialogService>();

  @override
  void onFutureError(error, Object? key) {
    log.e(error);
    _dialogService.showCustomDialog(
        variant: DialogType.error,
        barrierDismissible: true,
        description: error.toString());
    super.onFutureError(error, key);
  }

  DigitalCardDTO? card;

  String? extractUuidV4(String input) {
    RegExp regex = RegExp(
        r'([a-f\d]{8}-[a-f\d]{4}-4[a-f\d]{3}-[89aAbB][a-f\d]{3}-[a-f\d]{12})',
        caseSensitive: false);

    RegExpMatch? match = regex.firstMatch(input);

    return match?.group(0); // Returns the matched UUID v4 or null if not found
  }

  Future loadCardbyUuid(String uuid) async {
    await runBusyFuture(
      _digitalCardService
          .findOne(extractUuidV4(uuid).toString())
          .then((value) => card = value),
      throwException: true,
    );
    FlutterNativeSplash.remove();
  }
}
