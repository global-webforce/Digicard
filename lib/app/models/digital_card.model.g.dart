// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'digital_card.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DigitalCard _$$_DigitalCardFromJson(Map<String, dynamic> json) =>
    _$_DigitalCard(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      ownerId: json['owner_id'] as int?,
      title: json['title'] as String?,
      logoImage: json['logo_image'] as String?,
      color: json['color'] as String?,
      profileImage: json['profile_image'] as String?,
      prefix: json['prefix'] as String?,
      firstName: json['first_name'] as String?,
      middleName: json['middle_name'] as String?,
      lastName: json['last_name'] as String?,
      suffix: json['suffix'] as String?,
      shortBio: json['short_bio'] as String?,
      position: json['position'] as String?,
      company: json['company'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      mobileNumber: json['mobile_number'] as String?,
      website: json['website'] as String?,
      goesBy: json['goes_by'] as String?,
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
      'owner_id': instance.ownerId,
      'title': instance.title,
      'logo_image': instance.logoImage,
      'color': instance.color,
      'profile_image': instance.profileImage,
      'prefix': instance.prefix,
      'first_name': instance.firstName,
      'middle_name': instance.middleName,
      'last_name': instance.lastName,
      'suffix': instance.suffix,
      'short_bio': instance.shortBio,
      'position': instance.position,
      'company': instance.company,
      'email': instance.email,
      'address': instance.address,
      'mobile_number': instance.mobileNumber,
      'website': instance.website,
      'goes_by': instance.goesBy,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
