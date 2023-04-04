import 'package:digicard/app/models/digital_card.dart';

extension DigitalCardExtension on DigitalCard {
  String fullName() {
    return "${accreditations ?? ''} ${prefix ?? ''} ${firstName ?? ''} ${middleName ?? ''} ${lastName ?? ''} ${suffix ?? ''}"
        .replaceAll(RegExp(r"\s+"), " ")
        .trim();
  }
}
