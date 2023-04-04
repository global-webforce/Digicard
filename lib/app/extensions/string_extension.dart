import 'dart:io' as io;

extension StringExtension on String {
  /// ensures that string has real value
  bool isNotNullOrEmpty() {
    return trim() != "null" && trim() != "";
  }

  /// checks if the string is a valid url
  bool isValidUrl() {
    return Uri.parse(this).isAbsolute;
  }

  /// checks if string path is a local path
  bool isFileExistLocally() {
    bool res = false;
    try {
      if (isNotNullOrEmpty()) {
        res = io.File(this).existsSync();
      }
    } catch (e) {
      return false;
    }
    return res;
  }

  /// gets the filename of a giver url
  /// e.g foo/foo/foo/foo.jpg
  /// result: foo.jpg
  String extractFileName() {
    return Uri.parse(this).path.split("/").last;
  }
}
