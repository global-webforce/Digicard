// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterDtoImpl _$$RegisterDtoImplFromJson(Map<String, dynamic> json) =>
    _$RegisterDtoImpl(
      fullName: json['full_name'] as String?,
      email: json['email'] as String?,
      password: json['password'] as String?,
      passwordConfirmation: json['password_confirmation'] as String?,
      acceptLicense: json['accept_license'] as bool?,
    );

Map<String, dynamic> _$$RegisterDtoImplToJson(_$RegisterDtoImpl instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'email': instance.email,
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
      'accept_license': instance.acceptLicense,
    };
