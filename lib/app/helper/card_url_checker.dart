class CardUrl {
  final String link;

  CardUrl(this.link);

  String? get uuid {
    var uri = Uri.parse(link);
    var pathSegments = uri.fragment.split('/');
    if (pathSegments.length >= 3) {
      return pathSegments[2];
    }
    return null;
  }

  bool isValid() {
    RegExp pattern = RegExp(
        r'^https:\/\/markbulingit\.github\.io\/#\/p\/([0-9a-f]{8}-([0-9a-f]{4}-){3}[0-9a-f]{12})$');
    RegExp uuidPattern = RegExp(r'^[0-9a-f]{8}-([0-9a-f]{4}-){3}[0-9a-f]{12}$');

    if (!pattern.hasMatch(link)) {
      return false;
    }

    String uuid = link.split('/').last;

    return uuidPattern.hasMatch(uuid);
  }
}
