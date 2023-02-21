// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Client _$$_ClientFromJson(Map<String, dynamic> json) => _$_Client(
      id: json['id'] as int?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      email: json['email'] as String?,
      emailVerifiedAt: json['email_verified_at'],
      mobileNumber: json['mobile_number'] as String?,
      role: json['role'],
      profilePic: json['profile_pic'],
      companyId: json['company_id'],
      gender: json['gender'],
      age: json['age'],
      height: json['height'],
      weight: json['weight'],
      birthDate: json['birth_date'],
      address: json['address'],
    );

Map<String, dynamic> _$$_ClientToJson(_$_Client instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'email_verified_at': instance.emailVerifiedAt,
      'mobile_number': instance.mobileNumber,
      'role': instance.role,
      'profile_pic': instance.profilePic,
      'company_id': instance.companyId,
      'gender': instance.gender,
      'age': instance.age,
      'height': instance.height,
      'weight': instance.weight,
      'birth_date': instance.birthDate,
      'address': instance.address,
    };
