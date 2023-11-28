import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

Future<Uint8List?> imageCacheDownload(String url) async {
  try {
    if (Uri.tryParse(url)?.hasAbsolutePath ?? false) {
      final file = await DefaultCacheManager().getSingleFile(url, key: url);
      final bytes = await file.readAsBytes();
      return Uint8List.fromList(bytes);
    }
    return null;
  } catch (e) {
    return null;
  }
}

class CacheBytesImage extends StatefulWidget {
  final Uint8List? bytes;
  final Widget Function(BuildContext, Uint8List?) builder;
  final Widget placeHolder;
  final Widget errorWidget;

  const CacheBytesImage(
      {super.key,
      required this.bytes,
      this.placeHolder = const SizedBox.shrink(),
      required this.builder,
      this.errorWidget = const SizedBox.shrink()});

  @override
  State<CacheBytesImage> createState() => _CacheBytesImageState();
}

class _CacheBytesImageState extends State<CacheBytesImage> {
  bool isBusy = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.bytes == null
        ? widget.errorWidget
        : isBusy
            ? widget.placeHolder
            : widget.builder(context, widget.bytes);
  }
}
