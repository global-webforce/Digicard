// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'digital_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DigitalCard _$$_DigitalCardFromJson(Map<String, dynamic> json) =>
    _$_DigitalCard(
      id: json['id'] as int?,
      userId: json['user_id'] as String?,
      uuid: json['uuid'] as String?,
      title: json['title'] as String?,
      prefix: json['prefix'] as String?,
      firstName: json['first_name'] as String?,
      middleName: json['middle_name'] as String?,
      lastName: json['last_name'] as String?,
      suffix: json['suffix'] as String?,
      accreditations: json['accreditations'] as String?,
      preferredName: json['preferred_name'] as String?,
      maidenName: json['maiden_name'] as String?,
      pronouns: json['pronouns'] as String?,
      logoUrl: json['logo_url'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      color: json['color'] as int?,
      position: json['position'] as String?,
      department: json['department'] as String?,
      company: json['company'] as String?,
      headline: json['headline'] as String?,
      customLinks: (json['custom_links'] as List<dynamic>?)
              ?.map((e) => CustomLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
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
      'uuid': instance.uuid,
      'title': instance.title,
      'prefix': instance.prefix,
      'first_name': instance.firstName,
      'middle_name': instance.middleName,
      'last_name': instance.lastName,
      'suffix': instance.suffix,
      'accreditations': instance.accreditations,
      'preferred_name': instance.preferredName,
      'maiden_name': instance.maidenName,
      'pronouns': instance.pronouns,
      'logo_url': instance.logoUrl,
      'avatar_url': instance.avatarUrl,
      'color': instance.color,
      'position': instance.position,
      'department': instance.department,
      'company': instance.company,
      'headline': instance.headline,
      'custom_links': instance.customLinks,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
