import 'package:reactive_links_picker/reactive_links_picker.dart';
import 'icons.dart';

Map<String, dynamic> reactiveLinksFind(String label) {
  return (icons.firstWhere(
    (element) => element.label == label,
    orElse: () => CustomLink.empty,
  )).toJson();
}
