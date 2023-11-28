bool isValidUrl(String url) {
  // Using a simple regular expression to check if the string matches the URL pattern
  RegExp regExp = RegExp(
      r'^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?$');

  // Check if the string matches the pattern
  if (!regExp.hasMatch(url)) {
    return false; // Not a valid URL
  }

  // Check if the URL ends with a filename and has a file extension
  Uri uri = Uri.parse(url);
  String path = uri.path;
  return path.isNotEmpty &&
      path.contains('.') &&
      path.lastIndexOf('.') < path.length - 1;
}
