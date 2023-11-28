import 'package:flutter/material.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'custom_link.freezed.dart';
part 'custom_link.g.dart';

@freezed
class CustomLink with _$CustomLink {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  factory CustomLink({
    @Default("") String? value,
    @Default("") String? custom,
    @Default("Info") String? label,
    @Default("") String? prefixLink,
    @JsonKey(
      includeFromJson: false,
      includeToJson: false,
    )
    Widget? icon,
  }) = _CustomLink;

  factory CustomLink.fromJson(Map<String, dynamic> json) =>
      _$CustomLinkFromJson(json);

  static CustomLink empty = CustomLink(
      label: "Info",
      icon: const Icon(
        Icons.link,
      ));
}
