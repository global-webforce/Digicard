import 'package:digicard/app/app.locator.dart';
import 'package:digicard/app/extensions/string_extension.dart';
import 'package:digicard/app/models/custom_link.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CustomLinkViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  int? i;
  late CustomLink model;

  void initialize(CustomLink m, {int? index}) {
    i = index;
    model = m;
    initForm();
  }

  final formModel =
      CustomLinkForm(CustomLinkForm.formElements(CustomLink()), null);

  initForm() {
    final elements = CustomLinkForm.formElements(model);
    formModel.form.setValidators(elements.validators);
    formModel.form.setAsyncValidators(elements.asyncValidators);
    if (elements.disabled) {
      formModel.form.markAsDisabled();
    }
    formModel.form.addAll(elements.controls);
  }

  save() {
    formModel.textControl?.value = formModel.textControl?.value?.clean();
    _navigationService
        .back(result: {'index': i, 'customLink': formModel.model});
  }
}
