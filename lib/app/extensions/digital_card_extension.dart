import 'package:digicard/app/models/digital_card.dart';

extension DigitalCardExt on DigitalCard {
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
