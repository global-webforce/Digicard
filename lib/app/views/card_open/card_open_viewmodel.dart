import 'package:digicard/app/app.bottomsheet_ui.dart';
import 'package:digicard/app/app.dialog_ui.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/extensions/color.dart';
import 'package:digicard/app/models/custom_link.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/services/digital_card_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

enum ActionType {
  view,
  create,
  edit,
  test,
}

const String saveBusyKey = 'save-busy-key';

class CardOpenViewModel extends ReactiveViewModel {
  final log = getLogger('CardOpenViewModel');
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _digitalCardsService = locator<DigitalCardService>();
  final _navigationService = locator<NavigationService>();

  @override
  List<ListenableServiceMixin> get listenableServices => [_digitalCardsService];

  late ActionType actionType;
  late DigitalCard model;
  late DigitalCardForm _formModel;
  DigitalCardForm get formModel => _formModel;

  void initialize(DigitalCard m, ActionType action) {
    model = m;
    actionType = action;
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
    notifyListeners();
  }

  addNew() {
    _formModel.customLinksControl
        .add(CustomLinkForm.formElements(CustomLink()));
  }

  Future<DialogResponse<dynamic>?> confirmExit() async {
    _formModel.form.unfocus();
    return _dialogService.showCustomDialog(
      variant: DialogType.confirmation,
      title: "Unsaved Changes",
      description: "Are you sure you want to discard changes?",
      mainButtonTitle: "Cancel",
      secondaryButtonTitle: "Discard",
      barrierDismissible: true,
    );
  }

  save() async {
    setBusyForObject(saveBusyKey, true);
    _formModel.form.unfocus();
    if (actionType == ActionType.create) {
      await _digitalCardsService
          .create(DigitalCard.fromJson(_formModel.form.value));
      _formModel.reset();
      _formModel.form.markAsPristine(updateParent: true);
      _navigationService.back();
    } else if (actionType == ActionType.edit) {
      await _digitalCardsService
          .update(DigitalCard.fromJson(_formModel.form.value));
      _formModel.form.markAsPristine(updateParent: true);
    }
    setBusyForObject(saveBusyKey, false);
  }

  showImagePicker() async {
    await _bottomSheetService
        .showCustomSheet(
            isScrollControlled: false,
            barrierDismissible: true,
            variant: BottomSheetType.imagepicker)
        .then((res) {
      if (res?.data is XFile) {
        final XFile? temp = res?.data;
        _formModel.profileImageControl?.value = temp?.path;
        _formModel.form.markAsDirty();
      }
      if (res?.data is bool) {
        _formModel.profileImageControl?.value = null;
        _formModel.form.markAsDirty();
      }
    });
  }

  showLogoPicker() async {
    await _bottomSheetService
        .showCustomSheet(
            isScrollControlled: false,
            barrierDismissible: true,
            variant: BottomSheetType.imagepicker)
        .then((res) {
      if (res?.data is XFile) {
        final XFile? temp = res?.data;
        _formModel.logoImageControl?.value = temp?.path;
        _formModel.form.markAsDirty();
      }
      if (res?.data is bool) {
        _formModel.logoImageControl?.value = null;
        _formModel.form.markAsDirty();
      }
    });
  }

  showColorPicker(Color value) async {
    await _dialogService
        .showCustomDialog(
            barrierDismissible: true,
            variant: DialogType.colorPicker,
            data: value)
        .then((res) {
      if (res?.data is Color) {
        final Color color = res?.data;

        _formModel.colorControl?.value = color.toHex();
        _formModel.form.markAsDirty();
      }
    });
  }
}

////
///
