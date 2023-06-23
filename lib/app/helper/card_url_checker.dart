import 'package:digicard/app/env/env.dart';
import 'package:uuid/uuid.dart';

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
    String pattern = Env.cardUrl;
    if (!link.startsWith(pattern)) {
      return false;
    }

    String uuidString = link.substring(pattern.length);
    try {
      Uuid.parse(uuidString); // Try parsing the UUID string
      return true; // Return true if parsing succeeds (valid UUIDv4)
    } catch (_) {
      return false; // Return false if parsing fails (invalid UUIDv4)
    }
  }
}
