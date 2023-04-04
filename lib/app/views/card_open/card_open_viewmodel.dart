import 'package:cached_network_image/cached_network_image.dart';
import 'package:digicard/app/app.bottomsheet_ui.dart';
import 'package:digicard/app/app.dialog_ui.dart';
import 'package:digicard/app/app.logger.dart';
import 'package:digicard/app/models/custom_link.dart';
import 'package:digicard/app/models/digital_card.dart';
import 'package:digicard/app/services/digital_card_service.dart';
import 'package:digicard/app/views/custom_link/custom_link_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:digicard/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

enum ActionType {
  view,
  create,
  edit,
  duplicate,
  test,
}

const String saveBusyKey = 'save-busy-key';
const String doneBusyKey = 'doneBusyKey';

class CardOpenViewModel extends ReactiveViewModel {
  final log = getLogger('CardOpenViewModel');
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _digitalCardsService = locator<DigitalCardService>();
  final _navigationService = locator<NavigationService>();

  final b = CachedNetworkImage(
    height: 200,
    width: 200,
    memCacheHeight: 200,
    imageUrl: "fdsfsfsf",
  );

  @override
  void onFutureError(error, Object? key) {
    log.e(error);
    {
      _dialogService.showCustomDialog(
          variant: DialogType.error,
          barrierDismissible: true,
          description: error.toString());
    }
    super.onFutureError(error, key);
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [_digitalCardsService];

  bool editorMode = false;
  late ActionType actionType;
  late DigitalCard model;
  late DigitalCardForm _formModel;
  DigitalCardForm get formModel => _formModel;

  void initialize(DigitalCard m, ActionType action) {
    model = m;
    actionType = action;
    editorMode = actionType == ActionType.duplicate ||
        actionType == ActionType.create ||
        actionType == ActionType.edit;
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

  editCustomLink(CustomLink customLink, {int? index}) async {
    var x = await _navigationService.navigateToView(CustomLinkView(
      customLink,
    ));
    _formModel.customLinksControl.control("$index.id").value = x["id"].text;
    _formModel.customLinksControl.control("$index.text").value =
        x["customLink"].text;
    _formModel.customLinksControl.control("$index.label").value =
        x["customLink"].label;
    _formModel.customLinksControl.control("$index.type").value =
        x["customLink"].type;

    _formModel.form.markAsDirty();
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
      mainButtonTitle: "Cancel",
      secondaryButtonTitle: "Remove",
      barrierDismissible: true,
    )
        .then((value) async {
      if (value!.confirmed) {
        _formModel.customLinksControl.removeAt(index);
        _formModel.form.markAsDirty();
      }
    });
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
    _formModel.form.unfocus();
    final formValue = _formModel.model;

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
}

////
///
