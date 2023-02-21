// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'push_notification.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PushNotification _$$_PushNotificationFromJson(Map<String, dynamic> json) =>
    _$_PushNotification(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      notification: json['notification'] as String?,
      link: json['link'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$_PushNotificationToJson(_$_PushNotification instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'notification': instance.notification,
      'link': instance.link,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'type': instance.type,
    };
