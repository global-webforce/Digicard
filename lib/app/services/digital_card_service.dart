import 'package:digicard/app/models/digital_card.dart';
import 'package:stacked/stacked.dart';

abstract class DigitalCardService with ListenableServiceMixin {
  List<DigitalCard> get digitalCards;
  Future getAll();
  Future create(Map<String, dynamic> formData);
  duplicate(DigitalCard digitalCard);
  Future delete(int? id);
}
