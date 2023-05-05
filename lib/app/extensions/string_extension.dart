import 'dart:convert';
import 'dart:typed_data';

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

  bool isListInt() {
    try {
      final jsonList = json.decode("$this") as List<dynamic>;
      final intList = jsonList.map((dynamic item) => item as int).toList();
      return true;
    } catch (_) {
      return false;
    }
  }

  bool isUint8List() {
    try {
      final x = Uint8List.fromList(utf8.encode("$this"));
      print("This is valid Uint8List");
      return true;
    } catch (_) {
      print("This is invalid Uint8List");
      return false;
    }
  }

  Uint8List stringToUint8List() {
    final bytes = utf8.encode("$this");
    return Uint8List.fromList(bytes);
  }

  static String uint8ListToString(Uint8List bytes) {
    try {
      return String.fromCharCodes(bytes);
    } catch (e) {
      throw Exception("uint8List To String operation failed");
    }
  }
}
