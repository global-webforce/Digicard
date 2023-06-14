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
    // var regex = RegExp(r'^https://markbulingit\.github\.io/p/\d+$');
    var regex = RegExp(
      r'^https://markbulingit\.github\.io/p/[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$',
      caseSensitive: false,
    );

    if (regex.hasMatch(link)) {
      return true;
    } else {
      return false;
    }
  }
}
