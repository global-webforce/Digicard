import 'package:digicard/app/models/custom_link.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

extension CustomLinkExt on CustomLink {
  String url({String? val}) {
    final x = val ?? type;

    switch (x) {
      case "Email":
        return "mailto:";

      case "Phone Number":
        return "sms:";

      case "Address":
        return "https://maps.google.com/?q=";

      case "Website":
        return "https://www.";

      case "More soon!":
        return "";

      default:
        return "";
    }
  }

  IconData icon({String? val}) {
    final x = val ?? type;
    switch (x) {
      case "Email":
        return FontAwesomeIcons.envelope;

      case "Phone Number":
        return FontAwesomeIcons.phone;

      case "Address":
        return FontAwesomeIcons.locationDot;

      case "Website":
        return FontAwesomeIcons.globe;

      case "More soon!":
        return FontAwesomeIcons.gift;

      default:
        return FontAwesomeIcons.link;
    }
  }
}
