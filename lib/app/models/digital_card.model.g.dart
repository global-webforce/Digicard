// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'digital_card.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DigitalCard _$$_DigitalCardFromJson(Map<String, dynamic> json) =>
    _$_DigitalCard(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      name: json['name'] as String?,
      title: json['title'] as String?,
      company: json['company'] as String?,
      image: json['image'] as String?,
      color: json['color'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      email: json['email'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$_DigitalCardToJson(_$_DigitalCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'title': instance.title,
      'company': instance.company,
      'image': instance.image,
      'color': instance.color,
      'mobile_number': instance.mobileNumber,
      'email': instance.email,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
