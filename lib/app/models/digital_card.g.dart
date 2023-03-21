// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'digital_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DigitalCard _$$_DigitalCardFromJson(Map<String, dynamic> json) =>
    _$_DigitalCard(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      uuid: json['uuid'] as String?,
      title: json['title'] as String?,
      logoImage: json['logoImage'] as String?,
      profileImage: json['profileImage'] as String?,
      color: json['color'] as String?,
      fullname: json['fullname'] == null
          ? null
          : FullName.fromJson(json['fullname'] as Map<String, dynamic>),
      position: json['position'] as String?,
      department: json['department'] as String?,
      company: json['company'] as String?,
      headline: json['headline'] as String?,
      customLinks: (json['customLinks'] as List<dynamic>?)
              ?.map((e) => CustomLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_DigitalCardToJson(_$_DigitalCard instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'uuid': instance.uuid,
      'title': instance.title,
      'logoImage': instance.logoImage,
      'profileImage': instance.profileImage,
      'color': instance.color,
      'fullname': instance.fullname,
      'position': instance.position,
      'department': instance.department,
      'company': instance.company,
      'headline': instance.headline,
      'customLinks': instance.customLinks,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
