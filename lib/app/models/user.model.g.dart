// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      id: json['id'] as int?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      birthDate: json['birth_date'],
      gender: json['gender'],
      emailVerifiedAt: json['email_verified_at'],
      mobileNumber: json['mobile_number'],
      role: json['role'],
      profilePic: json['profile_pic'],
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
      address: json['address'] == null
          ? null
          : Address.fromJson(json['address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'birth_date': instance.birthDate,
      'gender': instance.gender,
      'email_verified_at': instance.emailVerifiedAt,
      'mobile_number': instance.mobileNumber,
      'role': instance.role,
      'profile_pic': instance.profilePic,
      'profile': instance.profile,
      'address': instance.address,
    };
