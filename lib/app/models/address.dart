import 'package:freezed_annotation/freezed_annotation.dart';
part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class Address with _$Address {
  factory Address({
    int? postcode,
    String? placeName,
    String? stateName,
    String? stateCode,
    double? latitude,
    double? longitude,
    int? accuracy,
    String? fullAddress,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
