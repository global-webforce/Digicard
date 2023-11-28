// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CustomLinkImpl _$$CustomLinkImplFromJson(Map<String, dynamic> json) =>
    _$CustomLinkImpl(
      value: json['value'] as String? ?? "",
      custom: json['custom'] as String? ?? "",
      label: json['label'] as String? ?? "Info",
      prefixLink: json['prefix_link'] as String? ?? "",
    );

Map<String, dynamic> _$$CustomLinkImplToJson(_$CustomLinkImpl instance) =>
    <String, dynamic>{
      'value': instance.value,
      'custom': instance.custom,
      'label': instance.label,
      'prefix_link': instance.prefixLink,
    };
