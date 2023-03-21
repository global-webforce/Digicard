// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_name.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FullName _$$_FullNameFromJson(Map<String, dynamic> json) => _$_FullName(
      prefix: json['prefix'] as String?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      suffix: json['suffix'] as String?,
      accreditations: json['accreditations'] as String?,
      preferredName: json['preferredName'] as String?,
      maidenName: json['maidenName'] as String?,
      pronouns: json['pronouns'] as String?,
    );

Map<String, dynamic> _$$_FullNameToJson(_$_FullName instance) =>
    <String, dynamic>{
      'prefix': instance.prefix,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'suffix': instance.suffix,
      'accreditations': instance.accreditations,
      'preferredName': instance.preferredName,
      'maidenName': instance.maidenName,
      'pronouns': instance.pronouns,
    };
