import 'dart:io';

import 'package:digicard/app/app.bottomsheet_ui.dart';
import 'package:digicard/app/app.dialog_ui.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/services/digital_card_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

class CardOpenViewModel extends ReactiveViewModel {
  final log = getLogger('CardOpenViewModel');
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _digitalCardsService = locator<DigitalCardService>();

  @override
  List<ListenableServiceMixin> get listenableServices => [_digitalCardsService];

  XFile? _image;
  File? get image => _image != null ? File(_image!.path) : null;

  final FormGroup _form = FormGroup({
    'title': FormControl<String>(),
    'prefix': FormControl<String>(),
    'first_name': FormControl<String>(),
    'middle_name': FormControl<String>(),
    'last_name': FormControl<String>(),
    'suffix': FormControl<String>(),
    'goes_by': FormControl<String>(),
    'short_bio': FormControl<String>(),
    'position': FormControl<String>(),
    'company': FormControl<String>(),
    'email': FormControl<String>(validators: [
      Validators.email,
    ]),
    'address': FormControl<String>(),
    'mobile_number': FormControl<String>(),
    'website': FormControl<String>(),
  });
  FormGroup get form => _form;

  String get fullName {
    return "${form.control('prefix').value ?? ""} ${form.control('first_name').value ?? ""} ${form.control('middle_name').value ?? ""} ${form.control('last_name').value ?? ""} ${form.control('suffix').value ?? ""}"
        .trim();
  }

  showImagePicker() async {
    await _bottomSheetService
        .showCustomSheet(
            isScrollControlled: false,
            barrierDismissible: true,
            variant: BottomSheetType.imagepicker)
        .then((value) {
      if (value!.data["image"] != null && value.data["removeImage"] == false) {
        _image = value.data["image"];
      } else {
        _image = null;
      }
    });
    rebuildUi();
  }

  Color color = Colors.red;

  showColorPicker() async {
    await _dialogService
        .showCustomDialog(
            barrierDismissible: true, variant: DialogType.colorPicker)
        .then((value) => color = value!.data);
    rebuildUi();
  }
}
