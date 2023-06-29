extension StringExtension on String? {
  static String getFileExtension(String fileName) {
    try {
      return fileName.split('.').last;
    } catch (e) {
      return '';
    }
  }

  /// ensures that string has real value
  bool isNotNullOrEmpty() {
    final x = ["null", "Null", "NULL", ""];
    if (this == null) return false;
    for (String value in x) {
      if ("$this".contains(value)) {
        return true;
      }
    }
    return false;
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
    return "$this"
        .replaceAll(RegExp(r'\bnull\b', caseSensitive: false), '')
        .replaceAll(RegExp(r"\s+"), " ")
        .trim();
  }
}
