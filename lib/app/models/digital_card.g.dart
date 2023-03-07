// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'digital_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DigitalCard _$$_DigitalCardFromJson(Map<String, dynamic> json) =>
    _$_DigitalCard(
      id: json['id'] as int,
      userId: json['userId'] as int?,
      ownerId: json['ownerId'] as int?,
      title: json['title'] as String?,
      logoImage: json['logoImage'] as String?,
      color: json['color'] as int?,
      profileImage: json['profileImage'] as String?,
      prefix: json['prefix'] as String?,
      firstName: json['firstName'] as String?,
      middleName: json['middleName'] as String?,
      lastName: json['lastName'] as String?,
      suffix: json['suffix'] as String?,
      shortBio: json['shortBio'] as String?,
      position: json['position'] as String?,
      company: json['company'] as String?,
      email: json['email'] as String?,
      address: json['address'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      website: json['website'] as String?,
      goesBy: json['goesBy'] as String?,
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
      'ownerId': instance.ownerId,
      'title': instance.title,
      'logoImage': instance.logoImage,
      'color': instance.color,
      'profileImage': instance.profileImage,
      'prefix': instance.prefix,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'suffix': instance.suffix,
      'shortBio': instance.shortBio,
      'position': instance.position,
      'company': instance.company,
      'email': instance.email,
      'address': instance.address,
      'mobileNumber': instance.mobileNumber,
      'website': instance.website,
      'goesBy': instance.goesBy,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
