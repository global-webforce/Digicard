import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'custom_overlay.dart';
import 'done_overlay.dart';

enum LoadingType { basic, save, download, duplicate, delete, update, done }

class LoaderOverlayWrapper extends StatelessWidget {
  final Color? color;
  final LoadingType? type;
  final Widget Function(BuildContext context) builder;
  const LoaderOverlayWrapper(
      {super.key, required this.builder, this.color, this.type});

  @override
  Widget build(BuildContext context) {
    if (type == LoadingType.basic) {
      context.loaderOverlay.show();
    }

    if (type == LoadingType.save) {
      context.loaderOverlay.show(
          widget: CustomOverlay(
        context,
        title: "Saving...",
        color: color,
      ));
    }

    if (type == LoadingType.download) {
      context.loaderOverlay.show(
          widget: CustomOverlay(
        context,
        title: "Downloading...",
        color: color,
      ));
    }

    if (type == LoadingType.duplicate) {
      context.loaderOverlay.show(
          widget: CustomOverlay(
        context,
        title: "Duplicating...",
        color: color,
      ));
    }

    if (type == LoadingType.delete) {
      context.loaderOverlay.show(
          widget: CustomOverlay(
        context,
        title: "Deleting...",
        color: color,
      ));
    }

    if (type == LoadingType.update) {
      context.loaderOverlay.show(
          widget: CustomOverlay(
        context,
        title: "Updating...",
        color: color,
      ));
    }

    if (type == LoadingType.done) {
      context.loaderOverlay.show(
          widget: DoneOverlay(
        context,
        title: "Done!",
        color: color,
      ));
    }

    if (type == null) {
      final isVisible = context.loaderOverlay.visible;
      if (isVisible) context.loaderOverlay.hide();
    }

    return builder(context);
  }
}
