extension StringExtension on String? {
  /// ensures that string has real value
  bool isNotNullOrEmpty() {
    if (this == null) return false;
    return "$this".trim() != "null" && "$this".trim() != "";
  }

  /// checks if the string is a valid url
  bool isValidUrl() {
    if (this == null) return false;
    return Uri.parse("$this").isAbsolute;
  }

  String toCapitalCase() {
    return "$this".isNotEmpty
        ? '${this?[0].toUpperCase()}${"$this".substring(1).toLowerCase()}'
        : '';
  }

  String toTitleCase() {
    return "$this"
        .replaceAll(RegExp(' +'), ' ')
        .split(' ')
        .map((str) => str.toCapitalCase())
        .join(' ');
  }

  String clean() {
    return isNotNullOrEmpty() == true
        ? "$this".replaceAll(RegExp(r"\s+"), " ").trim()
        : "";
  }
}
