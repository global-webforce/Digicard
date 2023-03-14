import 'package:digicard/app/models/digital_card.dart';
import 'package:stacked/stacked.dart';

abstract class DigitalCardService with ListenableServiceMixin {
  List<DigitalCard> get digitalCards;
  Future getAll();
  Future create(DigitalCard digitalCard);
  Future update(DigitalCard digitalCard);
  Future delete(DigitalCard digitalCard);
  duplicate(DigitalCard digitalCard);
}
