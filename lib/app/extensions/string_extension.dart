extension StringExtension on String {
  /// ensures that string has real value
  bool isNotNullOrEmpty() {
    return trim() != "null" && trim() != "";
  }

  /// checks if the string is a valid url
  bool isValidUrl() {
    return Uri.parse(this).isAbsolute;
  }

  String clean() {
    return isNotNullOrEmpty() == true
        ? replaceAll(RegExp(r"\s+"), " ").trim()
        : "";
  }
}
