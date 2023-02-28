import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/services/digital_card_service.dart';
import 'package:stacked/stacked.dart';
import 'package:digicard/app/app.locator.dart';

class CardOpenViewModel extends ReactiveViewModel {
  final log = getLogger('CardOpenViewModel');

  final _digitalCardsService = locator<DigitalCardService>();

  @override
  List<ListenableServiceMixin> get listenableServices => [_digitalCardsService];
}
