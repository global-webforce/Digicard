import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/ui/_shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ImagePickerBottomSheetViewModel extends ReactiveViewModel {
  final log = getLogger('ImagePickerBottomSheetViewModel');
  final _bottomSheetService = locator<BottomSheetService>();

  final ImagePicker _picker = ImagePicker();

  XFile? image;

  pickFromGallery() async {
    image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      await cropImage(image);
    }

    _bottomSheetService.completeSheet(
      SheetResponse(data: image),
    );
  }

  pickFromCamera() async {
    image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      await cropImage(image);
    }
    _bottomSheetService.completeSheet(
      SheetResponse(data: image),
    );
  }

  removeImage() {
    image = null;
    _bottomSheetService.completeSheet(
      SheetResponse(data: false),
    );
  }

  cropImage(XFile? src) async {
    await ImageCropper().cropImage(
      sourcePath: src!.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: kcPrimaryColor,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    ).then((croppedFile) {
      image = XFile(croppedFile!.path);
    });
  }
}
