import 'package:digicard/app/extensions/string_extension.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

Future<Uint8List?> getNetworkImageData(String url) async {
  try {
    if (url.isValidUrl()) {
      final file = await DefaultCacheManager().getSingleFile(url, key: url);
      final bytes = await file.readAsBytes();
      return Uint8List.fromList(bytes);
    }
    return null;
  } catch (e) {
    return null;
  }
}
