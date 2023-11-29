// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reset_password_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResetPasswordDtoImpl _$$ResetPasswordDtoImplFromJson(
        Map<String, dynamic> json) =>
    _$ResetPasswordDtoImpl(
      password: json['password'] as String?,
      passwordConfirmation: json['password_confirmation'] as String?,
    );

Map<String, dynamic> _$$ResetPasswordDtoImplToJson(
        _$ResetPasswordDtoImpl instance) =>
    <String, dynamic>{
      'password': instance.password,
      'password_confirmation': instance.passwordConfirmation,
    };
