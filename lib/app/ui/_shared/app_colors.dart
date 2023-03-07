import 'package:flutter/material.dart';

const Color kcPrimaryColor = Colors.orange;

Color? kcColor(
  int? color, {
  int? fallbackColor,
}) {
  try {
    return (color != null)
        ? Color(color)
        : (fallbackColor != null)
            ? Color(fallbackColor)
            : null;
  } catch (e) {
    return Colors.pink;
  }
}
