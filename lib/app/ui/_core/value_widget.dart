import 'package:flutter/material.dart';

extension StringCasingExtension on String {
  String toCapitalCase() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalCase())
      .join(' ');
}

enum TextCase { capitalized, title, uppercase, lowercase }

class StringWidget extends StatelessWidget {
  final TextCase? textCase;
  final List<dynamic> value;
  final Widget Function(String value) builder;
  const StringWidget(
    this.value, {
    Key? key,
    required this.builder,
    this.textCase,
  }) : super(key: key);

  bool isNotNullOrEmpty(String w) {
    return w.trim() != "null" && w.trim() != "";
  }

  String clean(List<dynamic> val) {
    val.removeWhere((val) => val.toString() == "" || val.toString() == "null");
    String temp = val.join(" ").replaceAll(RegExp(r"\s+"), " ").trim();
    switch (textCase) {
      case TextCase.capitalized:
        return temp.toCapitalCase();
      case TextCase.title:
        return temp.toTitleCase();
      case TextCase.lowercase:
        return temp.toLowerCase();
      case TextCase.uppercase:
        return temp.toUpperCase();
      default:
        temp;
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return isNotNullOrEmpty(clean(value))
        ? builder(clean(value))
        : const SizedBox.shrink();
  }
}
