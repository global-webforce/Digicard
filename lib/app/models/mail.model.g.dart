// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mail.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Mail _$$_MailFromJson(Map<String, dynamic> json) => _$_Mail(
      id: json['id'] as int?,
      subject: json['subject'] as String?,
      body: json['body'] as String?,
      link: json['link'] as String?,
      isRead: json['isRead'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$_MailToJson(_$_Mail instance) => <String, dynamic>{
      'id': instance.id,
      'subject': instance.subject,
      'body': instance.body,
      'link': instance.link,
      'isRead': instance.isRead,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
