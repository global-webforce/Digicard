// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'digicontact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DigiContact _$$_DigiContactFromJson(Map<String, dynamic> json) =>
    _$_DigiContact(
      id: json['id'] as int,
      card: DigitalCard.fromJson(json['card'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$$_DigiContactToJson(_$_DigiContact instance) =>
    <String, dynamic>{
      'id': instance.id,
      'card': instance.card,
      'created_at': instance.createdAt.toIso8601String(),
    };
