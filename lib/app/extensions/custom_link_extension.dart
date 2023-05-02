import 'package:digicard/app/models/custom_link.dart';
import 'package:flutter/material.dart';

class CustomLinkExtended {
  /// e.g mailto:[text]
  final Uri? uri;

  /// e.g mailto:
  final String? hintLink;

  /// e.g Icons.email_rounded;
  final IconData? icon;
  const CustomLinkExtended(
      {this.uri, this.hintLink, this.icon = Icons.question_mark_rounded});
}

extension CustomLinkExt on CustomLink {
  CustomLinkExtended extras() {
    if (type == "Email") {
      return CustomLinkExtended(
        icon: Icons.email_rounded,
        hintLink: "mailto:",
        uri: Uri.parse("mailto:$text"),
      );
    }
    if (type == "Address") {
      return CustomLinkExtended(
        icon: Icons.pin_drop_rounded,
        hintLink: "https://maps.google.com/?q=",
        uri: Uri.parse("https://maps.google.com/?q=$text"),
      );
    }
    if (type == "Phone Number") {
      return CustomLinkExtended(
        icon: Icons.phone_rounded,
        hintLink: "sms:",
        uri: Uri.parse("sms:$text"),
      );
    }
    if (type == "Website") {
      return CustomLinkExtended(
        icon: Icons.web_rounded,
        hintLink: "https://www.",
        uri: Uri.parse("https://www.$text"),
      );
    }
    return const CustomLinkExtended(
      icon: Icons.question_mark_rounded,
    );
  }
}
