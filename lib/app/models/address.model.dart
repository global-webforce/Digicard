import 'package:freezed_annotation/freezed_annotation.dart';

part 'address.model.freezed.dart';
part 'address.model.g.dart';

@freezed
class Address with _$Address {
  factory Address({
    int? postcode,
    @JsonKey(name: 'place_name') String? placeName,
    @JsonKey(name: 'state_name') String? stateName,
    @JsonKey(name: 'state_code') String? stateCode,
    double? latitude,
    double? longitude,
    int? accuracy,
    @JsonKey(name: 'full_address') String? fullAddress,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
