import 'package:digicard/app/models/digital_card.model.dart';

extension DigitalCardExtension on DigitalCard {
  String fullName() {
    return [
      prefix ?? "",
      firstName ?? "",
      middleName ?? "",
      lastName ?? "",
      suffix ?? ""
    ].join(" ");
  }
}
