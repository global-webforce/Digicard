import 'dart:io';

import 'package:digicard/app/app.bottomsheet_ui.dart';
import 'package:digicard/app/app.dialog_ui.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/services/digital_card_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stacked/stacked.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

enum ViewMode {
  preview,
  create,
  update,
}

class CardOpenViewModel extends ReactiveViewModel {
  final log = getLogger('CardOpenViewModel');
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _digitalCardsService = locator<DigitalCardService>();

  @override
  List<ListenableServiceMixin> get listenableServices => [_digitalCardsService];

  final FormGroup _form = FormGroup({
    'title': FormControl<String>(),
    'logo_image': FormControl<String>(),
    'logo_image_file': FormControl<File>(),
    'profile_image': FormControl<String>(),
    'profile_image_file': FormControl<File>(),
    'color': FormControl<int>(),
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
  formVal(String value) {
    return "${form.control(value).value}";
  }

  DigitalCard? _card;

  initForm({required int id, required ViewMode viewMode}) {
    _form.reset();
    _card = _digitalCardsService.digitalCards.firstWhere((e) => e.id == id);
    _form.patchValue({
      'title': _card?.title,
      'logo_image': _card?.logoImage,
      'profile_image': _card?.profileImage,
      'color': _card?.color,
      'prefix': _card?.prefix,
      'first_name': _card?.firstName,
      'middle_name': _card?.middleName,
      'last_name': _card?.lastName,
      'suffix': _card?.suffix,
      'goes_by': _card?.goesBy,
      'short_bio': _card?.shortBio,
      'position': _card?.position,
      'company': _card?.company,
      'email': _card?.email,
      'address': _card?.address,
      'mobile_number': _card?.mobileNumber,
      'website': _card?.website,
    });
  }

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
        final XFile? temp = value.data["image"];
        final File? image = temp != null ? File(temp.path) : null;
        form.control('profile_image_file').value = image;
      } else {
        form.control('profile_image_file').value = null;
      }
    });
  }

  showLogoPicker() async {
    await _bottomSheetService
        .showCustomSheet(
            isScrollControlled: false,
            barrierDismissible: true,
            variant: BottomSheetType.imagepicker)
        .then((value) {
      if (value!.data["image"] != null && value.data["removeImage"] == false) {
        final XFile? temp = value.data["image"];
        final File? image = temp != null ? File(temp.path) : null;
        form.control('logo_image_file').value = image;
      } else {
        form.control('logo_image_file').value = null;
      }
    });
  }

  showColorPicker() async {
    await _dialogService
        .showCustomDialog(
            barrierDismissible: true, variant: DialogType.colorPicker)
        .then((value) {
      //  form.control('color').value = value!.data;
    });
  }
}
