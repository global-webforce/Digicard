// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Address _$$_AddressFromJson(Map<String, dynamic> json) => _$_Address(
      postcode: json['postcode'] as int?,
      placeName: json['place_name'] as String?,
      stateName: json['state_name'] as String?,
      stateCode: json['state_code'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      accuracy: json['accuracy'] as int?,
      fullAddress: json['full_address'] as String?,
    );

Map<String, dynamic> _$$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'postcode': instance.postcode,
      'place_name': instance.placeName,
      'state_name': instance.stateName,
      'state_code': instance.stateCode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'accuracy': instance.accuracy,
      'full_address': instance.fullAddress,
    };
