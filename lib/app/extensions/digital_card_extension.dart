import 'package:digicard/app/models/digital_card.dart';

extension DigitalCardExtension on DigitalCard {
  String fullName() {
    return "${accreditations ?? ''} ${prefix ?? ''} ${firstName ?? ''} ${middleName ?? ''} ${lastName ?? ''} ${suffix ?? ''}"
        .replaceAll(RegExp(r"\s+"), " ")
        .trim();
  }

  static Map<String, dynamic> create(Map<String, dynamic> value) {
    value.remove("id");
    value.remove("uuid");
    value.remove("created_at");
    value.remove("updated_at");
    value.remove("custom_links");
    value.remove("full_name");
    return value;
  }

  static Map<String, dynamic> update(Map<String, dynamic> value) {
    value.remove("id");
    value.remove("created_at");
    value.remove("updated_at");
    return value;
  }
}
