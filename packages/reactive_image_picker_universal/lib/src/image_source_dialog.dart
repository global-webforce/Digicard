import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'helpers/sliver_grid_delegate.dart';

class ImageSourceDialog extends StatefulWidget {
  final bool showUploadImage;
  final bool showTakeImage;
  final bool showRemoveImage;
  const ImageSourceDialog(
      {super.key,
      this.showUploadImage = true,
      this.showTakeImage = true,
      this.showRemoveImage = true});

  @override
  State<ImageSourceDialog> createState() => _ImageSourceDialogState();
}

class _ImageSourceDialogState extends State<ImageSourceDialog> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> buttons = [
      FilledButton(
          onPressed: () async {
            Navigator.of(context).pop(ImageSource.gallery);
          },
          child: const Text("Upload Image")),
      FilledButton(
          onPressed: () async {
            Navigator.of(context).pop(ImageSource.camera);
          },
          child: const Text("Open Camera")),
      if (widget.showRemoveImage)
        OutlinedButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text("Remove Image"))
    ];

    return CustomScrollView(
      shrinkWrap: true,
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.all(12.0),
          sliver: SliverGrid.builder(
              itemCount: buttons.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                height: 50,
                crossAxisCount: 1,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemBuilder: (context, index) => buttons[index]),
        ),
      ],
    );
  }
}
