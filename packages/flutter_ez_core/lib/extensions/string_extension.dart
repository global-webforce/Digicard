extension StringExtension on String {
  static String fileExtension(String fileName) {
    try {
      return fileName.split('.').last;
    } catch (e) {
      return '';
    }
  }

  ///Checks the string if its a filename with a filetype e.g "foo.mp4" = true
  bool isFileNameWithExtension() {
    List<String> parts = split('.');
    if (parts.length > 1) {
      if (parts.last.isNotEmpty) {
        return true;
      }
    }
    return false;
  }

  bool isValidUrl() {
    return Uri.parse(this).isAbsolute;
  }

  String toCapitalCase() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  String toTitleCase() {
    return replaceAll(RegExp(' +'), ' ')
        .split(' ')
        .map((str) => str.toCapitalCase())
        .join(' ');
  }

  String sanitize() {
    String sanitizedString = replaceAll(RegExp(r'\s+'), ' ');
    sanitizedString = sanitizedString.trim();
    return sanitizedString;
  }
}

bool isNullEmpty(Object? o) =>
    null == o || o == '' || o.toString().trim().isEmpty;
