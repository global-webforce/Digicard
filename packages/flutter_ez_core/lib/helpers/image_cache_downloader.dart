import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_ez_core/extensions/string_extension.dart';

Future<Uint8List?> imageCacheDownload(String url) async {
  if (!url.isValidUrl()) return null;

  try {
    final file = await DefaultCacheManager().getSingleFile(url, key: url);
    final bytes = await file.readAsBytes();
    return Uint8List.fromList(bytes);
  } catch (e) {
    // Handle specific exceptions if needed
    return null;
  }
}
