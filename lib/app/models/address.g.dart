// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Address _$$_AddressFromJson(Map<String, dynamic> json) => _$_Address(
      postcode: json['postcode'] as int?,
      placeName: json['placeName'] as String?,
      stateName: json['stateName'] as String?,
      stateCode: json['stateCode'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      accuracy: json['accuracy'] as int?,
      fullAddress: json['fullAddress'] as String?,
    );

Map<String, dynamic> _$$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'postcode': instance.postcode,
      'placeName': instance.placeName,
      'stateName': instance.stateName,
      'stateCode': instance.stateCode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'accuracy': instance.accuracy,
      'fullAddress': instance.fullAddress,
    };
