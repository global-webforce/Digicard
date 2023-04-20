import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/models/custom_link.dart';
import 'package:digicard/app/models/digital_card.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CustomLinkViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  int? i;
  late CustomLink model;
  late CustomLinkForm _formModel;
  CustomLinkForm get formModel => _formModel;

  void initialize(CustomLink m, {int? index}) {
    i = index;
    model = m;
    initForm();
  }

  initForm() {
    _formModel = CustomLinkForm(
        CustomLink(), CustomLinkForm.formElements(CustomLink()), null);
    final elements = CustomLinkForm.formElements(model);
    _formModel.form.setValidators(elements.validators);
    _formModel.form.setAsyncValidators(elements.asyncValidators);
    if (elements.disabled) {
      _formModel.form.markAsDisabled();
    }
    _formModel.form.addAll(elements.controls);
  }

  save() {
    print("------------------- $i ${_formModel.model}");
    _navigationService
        .back(result: {'index': i, 'customLink': _formModel.model});
  }
}
