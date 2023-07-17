import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

Future<Uint8List?> getNetworkImageData(String url) async {
  try {
    final file = await DefaultCacheManager().getSingleFile(url);
    final bytes = await file.readAsBytes();
    return Uint8List.fromList(bytes);
  } catch (e) {
    return null;
  }
}
