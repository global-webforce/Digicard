import 'package:digicard/app/models/full_name.dart';

extension DigitalCardExt on FullName {
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
