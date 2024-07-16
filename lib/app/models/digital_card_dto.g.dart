// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'digital_card_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DigitalCardDTOImpl _$$DigitalCardDTOImplFromJson(Map<String, dynamic> json) =>
    _$DigitalCardDTOImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: json['user_id'] as String?,
      uuid: json['uuid'] as String?,
      logoUrl: json['logo_url'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      title: json['title'] as String? ?? "New Card",
      firstName: json['first_name'] as String?,
      prefix: json['prefix'] as String?,
      middleName: json['middle_name'] as String?,
      lastName: json['last_name'] as String?,
      suffix: json['suffix'] as String?,
      avatarFile: json['avatar_file'],
      logoFile: json['logo_file'],
      color: _$JsonConverterFromJson<int, Color>(
          json['color'], const ColorConverter().fromJson),
      layout: (json['layout'] as num?)?.toInt(),
      position: json['position'] as String?,
      company: json['company'] as String?,
      headline: json['headline'] as String?,
      customLinks: (json['custom_links'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      addedToContactsAt: json['added_to_contacts_at'] == null
          ? null
          : DateTime.parse(json['added_to_contacts_at'] as String),
    );

Map<String, dynamic> _$$DigitalCardDTOImplToJson(
        _$DigitalCardDTOImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'uuid': instance.uuid,
      'logo_url': instance.logoUrl,
      'avatar_url': instance.avatarUrl,
      'title': instance.title,
      'first_name': instance.firstName,
      'prefix': instance.prefix,
      'middle_name': instance.middleName,
      'last_name': instance.lastName,
      'suffix': instance.suffix,
      'avatar_file': instance.avatarFile,
      'logo_file': instance.logoFile,
      'color': _$JsonConverterToJson<int, Color>(
          instance.color, const ColorConverter().toJson),
      'layout': instance.layout,
      'position': instance.position,
      'company': instance.company,
      'headline': instance.headline,
      'custom_links': instance.customLinks,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'added_to_contacts_at': instance.addedToContactsAt?.toIso8601String(),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
