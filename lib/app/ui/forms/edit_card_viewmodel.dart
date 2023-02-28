import 'dart:io';

import 'package:digicard/app/app.bottomsheet_ui.dart';
import 'package:digicard/app/app.dialog_ui.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/ui/forms/edit_card_view.form.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CardEditViewModel extends FormViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  bool revealNamePanel = true;

  XFile? _image;
  File? get image => _image != null ? File(_image!.path) : null;

  toggleNamePanel() {
    revealNamePanel = !revealNamePanel;
    rebuildUi();
  }

  String? get fulln {
    final r = [
      prefixValue ?? "",
      firstNameValue ?? "",
      middleNameValue ?? "",
      lastNameValue ?? "",
      suffixValue ?? ""
    ].join(" ");

    final res = r.trim().isEmpty ? null : r;

    return res;
  }

  Color color = Colors.red;

  showColorPicker() async {
    await _dialogService
        .showCustomDialog(
            barrierDismissible: true, variant: DialogType.colorPicker)
        .then((value) => color = value!.data);
    rebuildUi();
  }

  showImagePicker() async {
    await _bottomSheetService
        .showCustomSheet(
            isScrollControlled: false,
            barrierDismissible: true,
            variant: BottomSheetType.imagepicker)
        .then((value) {
      print(value);
      if (value!.data["image"] != null && value.data["removeImage"] == false) {
        _image = value.data["image"];
      } else {
        _image = null;
      }
    });
    rebuildUi();
  }
}
