import 'package:digicard/app/app.bottomsheet_ui.dart';
import 'package:digicard/app/app.dialog_ui.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/models/custom_link.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/services/contacts_service.dart';
import 'package:digicard/app/services/digital_card_service.dart';
import 'package:digicard/app/views/custom_link/custom_link_view.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum ActionType {
  view,
  create,
  edit,
  duplicate,
  test,
}

enum ImagePickerType { gallery, camera, remove }

const String saveBusyKey = 'save-busy-key';
const String doneBusyKey = 'doneBusyKey';

class CardOpenViewModel extends ReactiveViewModel {
  final log = getLogger('CardOpenViewModel');
  final _supabase = Supabase.instance.client;
  User? get user => _supabase.auth.currentUser;

  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _digitalCardsService = locator<DigitalCardService>();
  final _contactsService = locator<ContactsService>();
  final _navigationService = locator<NavigationService>();

  @override
  void onFutureError(error, Object? key) {
    log.e(error);

    _dialogService.showCustomDialog(
        variant: DialogType.error,
        barrierDismissible: true,
        description: error.toString());

    super.onFutureError(error, key);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_digitalCardsService];

  bool editMode = false;
  late ActionType actionType;
  late DigitalCard model;
  late DigitalCardForm _formModel;
  DigitalCardForm get formModel => _formModel;

  bool formSubmitAttempt = false;

  void initialize(DigitalCard m, ActionType action) {
    model = m;
    actionType = action;
    editMode = [ActionType.create, ActionType.edit, ActionType.duplicate]
        .contains(actionType);
    initForm();
  }

  initForm() {
    _formModel =
        DigitalCardForm(model, DigitalCardForm.formElements(model), null);
    final elements = DigitalCardForm.formElements(model);
    _formModel.form.setValidators(elements.validators);
    _formModel.form.setAsyncValidators(elements.asyncValidators);
    if (elements.disabled) {
      _formModel.form.markAsDisabled();
    }
    _formModel.form.addAll(elements.controls);
  }

  Future saveToContacts(DigitalCard card) async {
    runBusyFuture(_contactsService.create(card),
        throwException: true, busyObject: saveBusyKey);
  }

  editCustomLink(CustomLink customLink, {int? index}) async {
    var x = await _navigationService.navigateToView(CustomLinkView(
      customLink,
    ));
    _formModel.customLinksControl.control("$index.id").value =
        x["customLink"].id;
    _formModel.customLinksControl.control("$index.cardId").value =
        x["customLink"].cardId;
    _formModel.customLinksControl.control("$index.text").value =
        x["customLink"].text;
    _formModel.customLinksControl.control("$index.label").value =
        x["customLink"].label;
    _formModel.customLinksControl.control("$index.type").value =
        x["customLink"].type;

    _formModel.form.markAsDirty();
    notifyListeners();
  }

  addCustomLink(CustomLink customLink) async {
    formModel.form.unfocus();
    var x = await _navigationService.navigateToView(CustomLinkView(customLink));
    _formModel.customLinksControl
        .add(CustomLinkForm.formElements(x["customLink"]));
    _formModel.form.markAsDirty();
  }

  removeCustomLink(int index) {
    formModel.form.unfocus();
    _dialogService
        .showCustomDialog(
      variant: DialogType.confirmation,
      description:
          "You sure you want to remove this ${_formModel.customLinksControl.control("$index.type").value}?",
      mainButtonTitle: "Remove",
      secondaryButtonTitle: "Cancel",
      barrierDismissible: true,
    )
        .then((value) async {
      if (value!.confirmed) {
        _formModel.customLinksControl.removeAt(index);
        _formModel.form.markAsDirty();
      }
    });
  }

  Future<bool> confirmExit() async {
    _formModel.form.unfocus();
    if (formModel.form.pristine == true && actionType == ActionType.duplicate) {
      DialogResponse? res = await _dialogService.showCustomDialog(
        variant: DialogType.confirmation,
        title: "Discard",
        description: "Are you sure you want to dispose this card?",
        mainButtonTitle: "Yes",
        secondaryButtonTitle: "Cancel",
        barrierDismissible: true,
      );
      return res?.confirmed ?? false;
    }

    if (formModel.form.pristine == false) {
      DialogResponse? res = await _dialogService.showCustomDialog(
        variant: DialogType.confirmation,
        title: "Unsaved Changes",
        description: "Are you sure you want to leave without saving?",
        mainButtonTitle: "Yes",
        secondaryButtonTitle: "Cancel",
        barrierDismissible: true,
      );
      return res?.confirmed ?? false;
    }
    return Future.value(true);
  }

  save() async {
    _formModel.form.unfocus();
    formSubmitAttempt = true;

    if (_formModel.firstNameControl?.hasErrors ?? false) {
      _dialogService.showCustomDialog(
          variant: DialogType.simple,
          description: "First name is required",
          barrierDismissible: true);
    } else {
      final customLinks = _formModel.customLinksControl.value ?? [];
      final formValue = _formModel.model.copyWith(
          customLinks:
              customLinks.map((e) => CustomLink.fromJson(e!)).toList());

      if (actionType == ActionType.create) {
        await runBusyFuture(_digitalCardsService.create(formValue),
            throwException: true, busyObject: saveBusyKey);
      } else if (actionType == ActionType.edit) {
        await runBusyFuture(_digitalCardsService.update(formValue),
            throwException: true, busyObject: saveBusyKey);
      } else if (actionType == ActionType.duplicate) {
        await runBusyFuture(_digitalCardsService.duplicate(formValue),
            throwException: true, busyObject: saveBusyKey);
      }
      setBusyForObject(saveBusyKey, false);
      setBusyForObject(doneBusyKey, true);
      await Future.delayed(const Duration(seconds: 1));
      setBusyForObject(doneBusyKey, false);
      _formModel.form.markAsPristine(updateParent: true);

      _navigationService.back();
    }
    notifyListeners();
  }

  cropImage(XFile? src) async {
    return await ImageCropper().cropImage(
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
      return XFile(croppedFile!.path);
    });
  }

  final ImagePicker _avatarPicker = ImagePicker();
  XFile? _avatarImageFile;

  final ImagePicker _logoPicker = ImagePicker();
  XFile? _logoImageFile;

  showAvatarPicker() async {
    await _bottomSheetService.showCustomSheet(
        data: {
          'assetType': 'avatar',
          'removeOption': _formModel.avatarUrlControl?.value != null
        },
        isScrollControlled: false,
        barrierDismissible: true,
        variant: BottomSheetType.imagepicker).then((res) async {
      var result = res?.data;
      if (result is ImagePickerType) {
        if (result == ImagePickerType.gallery) {
          await _avatarPicker
              .pickImage(source: ImageSource.gallery)
              .then((value) async {
            _avatarImageFile = await cropImage(value);
          });
        } else if (result == ImagePickerType.camera) {
          await _avatarPicker
              .pickImage(source: ImageSource.camera)
              .then((value) async {
            _avatarImageFile = await cropImage(value);
          });
        } else if (result == ImagePickerType.remove) {
          _avatarImageFile = null;
        }

        _formModel.avatarUrlControl?.value = _avatarImageFile?.path;
        _formModel.form.markAsDirty();
        notifyListeners();
      }
    });
  }

  showLogoPicker() async {
    await _bottomSheetService.showCustomSheet(
        data: {
          'assetType': 'logo',
          'removeOption': _formModel.logoUrlControl?.value != null
        },
        isScrollControlled: false,
        barrierDismissible: true,
        variant: BottomSheetType.imagepicker).then((res) async {
      var result = res?.data;
      if (result is ImagePickerType) {
        if (result == ImagePickerType.gallery) {
          await _logoPicker
              .pickImage(source: ImageSource.gallery)
              .then((value) async {
            _logoImageFile = await cropImage(value);
          });
        } else if (result == ImagePickerType.camera) {
          await _logoPicker
              .pickImage(source: ImageSource.camera)
              .then((value) async {
            _logoImageFile = await cropImage(value);
          });
        } else if (result == ImagePickerType.remove) {
          _logoImageFile = null;
        }

        _formModel.logoUrlControl?.value = _logoImageFile?.path;
        _formModel.form.markAsDirty();
        notifyListeners();
      }
    });
  }
}

////
///
