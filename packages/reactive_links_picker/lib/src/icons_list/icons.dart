import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/custom_link.dart';

final icons = [
  CustomLink(
    label: "Email",
    value: " Email",
    icon: const Icon(FontAwesomeIcons.envelope, color: Colors.white),
    prefixLink: "mailto:",
  ),
  CustomLink(
    label: "Phone",
    value: "Phone",
    icon: const Icon(FontAwesomeIcons.phone, color: Colors.white),
    prefixLink: "tel:",
  ),
  CustomLink(
    label: "Website",
    value: "Website",
    icon: const Icon(FontAwesomeIcons.globe, color: Colors.white),
    prefixLink: "https://www.",
  ),
  CustomLink(
    label: "Address",
    value: "Address",
    icon: const Icon(FontAwesomeIcons.addressBook, color: Colors.white),
    prefixLink: "",
  ),
  CustomLink(
    label: "LinkedIn",
    value: "LinkedIn",
    icon: const Icon(FontAwesomeIcons.linkedin, color: Colors.white),
    prefixLink: "https://www.linkedin.com/in/",
  ),
  CustomLink(
    label: "Facebook",
    value: "Facebook",
    icon: const Icon(FontAwesomeIcons.facebook, color: Colors.white),
    prefixLink: "https://www.facebook.com/",
  ),
  CustomLink(
    label: "Twitter",
    value: "Twitter",
    icon: const Icon(FontAwesomeIcons.twitter, color: Colors.white),
    prefixLink: "https://www.twitter.com/",
  ),
  CustomLink(
      label: "Instagram",
      value: "Instagram",
      icon: const Icon(FontAwesomeIcons.instagram, color: Colors.white),
      prefixLink: "https://www.instagram.com/_u/"),
  CustomLink(
    label: "Paypal",
    value: "Paypal",
    icon: const Icon(FontAwesomeIcons.paypal, color: Colors.white),
    prefixLink: "https://www.paypal.me/",
  ),
];
