import 'dart:typed_data';
import 'package:digicard/app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:reactive_image_picker/reactive_image_picker.dart';

class XImagePicker {
  final BuildContext context;
  final ImageSource type;
  final bool crop;

  XImagePicker(this.context, {required this.type, this.crop = true});
  final ImagePicker _logoPicker = ImagePicker();

  Future<Uint8List?> pick() async {
    final XFile? pickedImage = (await _logoPicker.pickImage(source: type));
    if (crop) {
      return (await _cropImage(pickedImage?.path)) ??
          await pickedImage?.readAsBytes();
    }
    return await pickedImage?.readAsBytes();
  }

  Future<Uint8List?> _cropImage(String? src) async {
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
          barrierColor: kcPrimaryColor,
        ),
        AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: kcPrimaryColor,
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
}
