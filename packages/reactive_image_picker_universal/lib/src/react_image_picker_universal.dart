import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_image_picker_universal/src/helpers/valid_url_checker.dart';
import 'image_source_dialog.dart';

class ImageSourcePicker extends StatefulWidget {
  final String? imageUrl;
  final dynamic value;
  final Function(dynamic) onChanged;

  const ImageSourcePicker({
    super.key,
    required this.onChanged,
    this.value,
    this.imageUrl,
  });

  @override
  State<ImageSourcePicker> createState() => _ImageSourcePickerState();
}

class _ImageSourcePickerState extends State<ImageSourcePicker> {
  final ImagePicker picker = ImagePicker();

  dynamic type;
  XFile? pickedImage;
  Uint8List? img;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _asyncMethod();
    });

    super.initState();
  }

  _asyncMethod() async {
    img = widget.value;
    setState(() {});
  }

  @override
  void dispose() {
    pickedImage = null;
    img = null;
    super.dispose();
  }

/*   Future<Uint8List?> cropImage(String? src) async {
    return await ImageCropper().cropImage(
      sourcePath: src ?? '',
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        WebUiSettings(
          context: context,
          presentStyle: CropperPresentStyle.page,
          enableExif: true,
          enableZoom: true,
          showZoomer: true,
        ),
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
        ),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    ).then((croppedFile) async {
      return await croppedFile?.readAsBytes();
    });
  }
 */
  @override
  Widget build(BuildContext context) {
    const imageSize = 80.0;

    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () async {
            type = await showModalBottomSheet<dynamic>(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return ImageSourceDialog(
                    showRemoveImage: widget.value != false &&
                        (((img != null && img!.isNotEmpty) ||
                            isValidUrl(widget.imageUrl.toString()))),
                  );
                });
            if (type == ImageSource.gallery || type == ImageSource.camera) {
              pickedImage = await picker.pickImage(source: type);
              if (pickedImage != null) {
                img = await pickedImage?.readAsBytes();
                widget.onChanged(img);
              }
            } else if (type == false) {
              pickedImage = null;
              img = null;

              widget.onChanged(false);
            }
            setState(() {});
          },
          child: ClipRRect(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            borderRadius: BorderRadius.circular(12),
            child: Stack(
              children: [
                Container(
                  color: Colors.grey,
                  width: imageSize,
                  height: imageSize,
                  child: const Center(
                    child: Icon(Icons.upload_rounded),
                  ),
                ),
                if (widget.imageUrl != null &&
                    !widget.imageUrl.toString().endsWith("/null") &&
                    widget.value != false)
                  Container(
                    color: Colors.grey,
                    child: Image.network(
                      widget.imageUrl.toString(),
                      errorBuilder: (context, error, stackTrace) {
                        return const SizedBox(
                          width: imageSize,
                          height: imageSize,
                          child: Center(child: Icon(Icons.error)),
                        );
                      },
                      width: imageSize,
                      height: imageSize,
                      fit: BoxFit.cover,
                    ),
                  ),
                if (img != null && img!.isNotEmpty)
                  Container(
                    color: Colors.grey,
                    child: Image.memory(
                      img!,
                      width: imageSize,
                      height: imageSize,
                      fit: BoxFit.cover,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ReactiveImagePickerUniversal<T> extends ReactiveFormField<T, dynamic> {
  ReactiveImagePickerUniversal({
    Key? key,
    bool? readOnly,
    String? formControlName,
    String? imageUrl,
    FormControl<T>? formControl,
    ReactiveFormFieldCallback<T>? onChanged,
  }) : super(
          key: key,
          formControlName: formControlName,
          formControl: formControl,
          builder: (field) {
            return ImageSourcePicker(
              value: field.value,
              imageUrl: imageUrl,
              onChanged: (value) {
                field.control.markAsDirty();
                field.control.updateValueAndValidity();
                field.didChange(value);
                onChanged?.call(field.control);
              },
            );
          },
        ) {
    if (this.formControlName == null && this.formControl == null) {
      assert(this.formControlName == null && this.formControl == null,
          'ReactiveImagePickerUniversal requires atleast a formControlName or formControl');
    }
  }

  @override
  ReactiveFormFieldState<T, dynamic> createState() =>
      ReactiveFormFieldState<T, dynamic>();
}
