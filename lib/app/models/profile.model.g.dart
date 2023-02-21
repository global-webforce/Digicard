// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Profile _$$_ProfileFromJson(Map<String, dynamic> json) => _$_Profile(
      weight: (json['weight'] as num?)?.toDouble(),
      height: (json['height'] as num?)?.toDouble(),
      companyId: json['company_id'] as int?,
      verified: json['verified'] as int?,
      shortBio: json['short_bio'] as String?,
    );

Map<String, dynamic> _$$_ProfileToJson(_$_Profile instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'height': instance.height,
      'company_id': instance.companyId,
      'verified': instance.verified,
      'short_bio': instance.shortBio,
    };
