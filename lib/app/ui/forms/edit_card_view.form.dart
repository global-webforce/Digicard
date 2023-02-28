// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:digicard/app/ui/forms/form_fields_validators.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String FullNameValueKey = 'fullName';
const String PrefixValueKey = 'prefix';
const String FirstNameValueKey = 'firstName';
const String MiddleNameValueKey = 'middleName';
const String LastNameValueKey = 'lastName';
const String SuffixValueKey = 'suffix';
const String AccreditationsValueKey = 'accreditations';
const String PreferredNameValueKey = 'preferredName';
const String MaidenNameValueKey = 'maidenName';
const String PronounsValueKey = 'pronouns';
const String TitleValueKey = 'title';
const String DepartmentValueKey = 'department';
const String CompanyValueKey = 'company';
const String HeadlineValueKey = 'headline';

final Map<String, TextEditingController> _CardEditViewTextEditingControllers =
    {};

final Map<String, FocusNode> _CardEditViewFocusNodes = {};

final Map<String, String? Function(String?)?> _CardEditViewTextValidations = {
  FullNameValueKey: FormFieldValidators.name,
  PrefixValueKey: FormFieldValidators.name,
  FirstNameValueKey: FormFieldValidators.name,
  MiddleNameValueKey: FormFieldValidators.name,
  LastNameValueKey: FormFieldValidators.name,
  SuffixValueKey: FormFieldValidators.name,
  AccreditationsValueKey: FormFieldValidators.name,
  PreferredNameValueKey: FormFieldValidators.name,
  MaidenNameValueKey: FormFieldValidators.name,
  PronounsValueKey: FormFieldValidators.name,
  TitleValueKey: FormFieldValidators.name,
  DepartmentValueKey: FormFieldValidators.name,
  CompanyValueKey: FormFieldValidators.name,
  HeadlineValueKey: FormFieldValidators.name,
};

mixin $CardEditView on StatelessWidget {
  TextEditingController get fullNameController =>
      _getFormTextEditingController(FullNameValueKey);
  TextEditingController get prefixController =>
      _getFormTextEditingController(PrefixValueKey);
  TextEditingController get firstNameController =>
      _getFormTextEditingController(FirstNameValueKey);
  TextEditingController get middleNameController =>
      _getFormTextEditingController(MiddleNameValueKey);
  TextEditingController get lastNameController =>
      _getFormTextEditingController(LastNameValueKey);
  TextEditingController get suffixController =>
      _getFormTextEditingController(SuffixValueKey);
  TextEditingController get accreditationsController =>
      _getFormTextEditingController(AccreditationsValueKey);
  TextEditingController get preferredNameController =>
      _getFormTextEditingController(PreferredNameValueKey);
  TextEditingController get maidenNameController =>
      _getFormTextEditingController(MaidenNameValueKey);
  TextEditingController get pronounsController =>
      _getFormTextEditingController(PronounsValueKey);
  TextEditingController get titleController =>
      _getFormTextEditingController(TitleValueKey);
  TextEditingController get departmentController =>
      _getFormTextEditingController(DepartmentValueKey);
  TextEditingController get companyController =>
      _getFormTextEditingController(CompanyValueKey);
  TextEditingController get headlineController =>
      _getFormTextEditingController(HeadlineValueKey);
  FocusNode get fullNameFocusNode => _getFormFocusNode(FullNameValueKey);
  FocusNode get prefixFocusNode => _getFormFocusNode(PrefixValueKey);
  FocusNode get firstNameFocusNode => _getFormFocusNode(FirstNameValueKey);
  FocusNode get middleNameFocusNode => _getFormFocusNode(MiddleNameValueKey);
  FocusNode get lastNameFocusNode => _getFormFocusNode(LastNameValueKey);
  FocusNode get suffixFocusNode => _getFormFocusNode(SuffixValueKey);
  FocusNode get accreditationsFocusNode =>
      _getFormFocusNode(AccreditationsValueKey);
  FocusNode get preferredNameFocusNode =>
      _getFormFocusNode(PreferredNameValueKey);
  FocusNode get maidenNameFocusNode => _getFormFocusNode(MaidenNameValueKey);
  FocusNode get pronounsFocusNode => _getFormFocusNode(PronounsValueKey);
  FocusNode get titleFocusNode => _getFormFocusNode(TitleValueKey);
  FocusNode get departmentFocusNode => _getFormFocusNode(DepartmentValueKey);
  FocusNode get companyFocusNode => _getFormFocusNode(CompanyValueKey);
  FocusNode get headlineFocusNode => _getFormFocusNode(HeadlineValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_CardEditViewTextEditingControllers.containsKey(key)) {
      return _CardEditViewTextEditingControllers[key]!;
    }
    _CardEditViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _CardEditViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_CardEditViewFocusNodes.containsKey(key)) {
      return _CardEditViewFocusNodes[key]!;
    }
    _CardEditViewFocusNodes[key] = FocusNode();
    return _CardEditViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    fullNameController.addListener(() => _updateFormData(model));
    prefixController.addListener(() => _updateFormData(model));
    firstNameController.addListener(() => _updateFormData(model));
    middleNameController.addListener(() => _updateFormData(model));
    lastNameController.addListener(() => _updateFormData(model));
    suffixController.addListener(() => _updateFormData(model));
    accreditationsController.addListener(() => _updateFormData(model));
    preferredNameController.addListener(() => _updateFormData(model));
    maidenNameController.addListener(() => _updateFormData(model));
    pronounsController.addListener(() => _updateFormData(model));
    titleController.addListener(() => _updateFormData(model));
    departmentController.addListener(() => _updateFormData(model));
    companyController.addListener(() => _updateFormData(model));
    headlineController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated('Use syncFormWithViewModel instead.'
      'This feature was deprecated after 3.1.0.')
  void listenToFormUpdated(FormViewModel model) {
    fullNameController.addListener(() => _updateFormData(model));
    prefixController.addListener(() => _updateFormData(model));
    firstNameController.addListener(() => _updateFormData(model));
    middleNameController.addListener(() => _updateFormData(model));
    lastNameController.addListener(() => _updateFormData(model));
    suffixController.addListener(() => _updateFormData(model));
    accreditationsController.addListener(() => _updateFormData(model));
    preferredNameController.addListener(() => _updateFormData(model));
    maidenNameController.addListener(() => _updateFormData(model));
    pronounsController.addListener(() => _updateFormData(model));
    titleController.addListener(() => _updateFormData(model));
    departmentController.addListener(() => _updateFormData(model));
    companyController.addListener(() => _updateFormData(model));
    headlineController.addListener(() => _updateFormData(model));
  }

  final bool _autoTextFieldValidation = true;
  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          FullNameValueKey: fullNameController.text,
          PrefixValueKey: prefixController.text,
          FirstNameValueKey: firstNameController.text,
          MiddleNameValueKey: middleNameController.text,
          LastNameValueKey: lastNameController.text,
          SuffixValueKey: suffixController.text,
          AccreditationsValueKey: accreditationsController.text,
          PreferredNameValueKey: preferredNameController.text,
          MaidenNameValueKey: maidenNameController.text,
          PronounsValueKey: pronounsController.text,
          TitleValueKey: titleController.text,
          DepartmentValueKey: departmentController.text,
          CompanyValueKey: companyController.text,
          HeadlineValueKey: headlineController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the FormViewModel
  void _updateValidationData(FormViewModel model) =>
      model.setValidationMessages({
        FullNameValueKey: _getValidationMessage(FullNameValueKey),
        PrefixValueKey: _getValidationMessage(PrefixValueKey),
        FirstNameValueKey: _getValidationMessage(FirstNameValueKey),
        MiddleNameValueKey: _getValidationMessage(MiddleNameValueKey),
        LastNameValueKey: _getValidationMessage(LastNameValueKey),
        SuffixValueKey: _getValidationMessage(SuffixValueKey),
        AccreditationsValueKey: _getValidationMessage(AccreditationsValueKey),
        PreferredNameValueKey: _getValidationMessage(PreferredNameValueKey),
        MaidenNameValueKey: _getValidationMessage(MaidenNameValueKey),
        PronounsValueKey: _getValidationMessage(PronounsValueKey),
        TitleValueKey: _getValidationMessage(TitleValueKey),
        DepartmentValueKey: _getValidationMessage(DepartmentValueKey),
        CompanyValueKey: _getValidationMessage(CompanyValueKey),
        HeadlineValueKey: _getValidationMessage(HeadlineValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _CardEditViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_CardEditViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _CardEditViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _CardEditViewFocusNodes.values) {
      focusNode.dispose();
    }

    _CardEditViewTextEditingControllers.clear();
    _CardEditViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get fullNameValue => this.formValueMap[FullNameValueKey] as String?;
  String? get prefixValue => this.formValueMap[PrefixValueKey] as String?;
  String? get firstNameValue => this.formValueMap[FirstNameValueKey] as String?;
  String? get middleNameValue =>
      this.formValueMap[MiddleNameValueKey] as String?;
  String? get lastNameValue => this.formValueMap[LastNameValueKey] as String?;
  String? get suffixValue => this.formValueMap[SuffixValueKey] as String?;
  String? get accreditationsValue =>
      this.formValueMap[AccreditationsValueKey] as String?;
  String? get preferredNameValue =>
      this.formValueMap[PreferredNameValueKey] as String?;
  String? get maidenNameValue =>
      this.formValueMap[MaidenNameValueKey] as String?;
  String? get pronounsValue => this.formValueMap[PronounsValueKey] as String?;
  String? get titleValue => this.formValueMap[TitleValueKey] as String?;
  String? get departmentValue =>
      this.formValueMap[DepartmentValueKey] as String?;
  String? get companyValue => this.formValueMap[CompanyValueKey] as String?;
  String? get headlineValue => this.formValueMap[HeadlineValueKey] as String?;

  set fullNameValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          FullNameValueKey: value,
        }),
    );

    if (_CardEditViewTextEditingControllers.containsKey(FullNameValueKey)) {
      _CardEditViewTextEditingControllers[FullNameValueKey]?.text = value ?? '';
    }
  }

  set prefixValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          PrefixValueKey: value,
        }),
    );

    if (_CardEditViewTextEditingControllers.containsKey(PrefixValueKey)) {
      _CardEditViewTextEditingControllers[PrefixValueKey]?.text = value ?? '';
    }
  }

  set firstNameValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          FirstNameValueKey: value,
        }),
    );

    if (_CardEditViewTextEditingControllers.containsKey(FirstNameValueKey)) {
      _CardEditViewTextEditingControllers[FirstNameValueKey]?.text =
          value ?? '';
    }
  }

  set middleNameValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          MiddleNameValueKey: value,
        }),
    );

    if (_CardEditViewTextEditingControllers.containsKey(MiddleNameValueKey)) {
      _CardEditViewTextEditingControllers[MiddleNameValueKey]?.text =
          value ?? '';
    }
  }

  set lastNameValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          LastNameValueKey: value,
        }),
    );

    if (_CardEditViewTextEditingControllers.containsKey(LastNameValueKey)) {
      _CardEditViewTextEditingControllers[LastNameValueKey]?.text = value ?? '';
    }
  }

  set suffixValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          SuffixValueKey: value,
        }),
    );

    if (_CardEditViewTextEditingControllers.containsKey(SuffixValueKey)) {
      _CardEditViewTextEditingControllers[SuffixValueKey]?.text = value ?? '';
    }
  }

  set accreditationsValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          AccreditationsValueKey: value,
        }),
    );

    if (_CardEditViewTextEditingControllers.containsKey(
        AccreditationsValueKey)) {
      _CardEditViewTextEditingControllers[AccreditationsValueKey]?.text =
          value ?? '';
    }
  }

  set preferredNameValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          PreferredNameValueKey: value,
        }),
    );

    if (_CardEditViewTextEditingControllers.containsKey(
        PreferredNameValueKey)) {
      _CardEditViewTextEditingControllers[PreferredNameValueKey]?.text =
          value ?? '';
    }
  }

  set maidenNameValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          MaidenNameValueKey: value,
        }),
    );

    if (_CardEditViewTextEditingControllers.containsKey(MaidenNameValueKey)) {
      _CardEditViewTextEditingControllers[MaidenNameValueKey]?.text =
          value ?? '';
    }
  }

  set pronounsValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          PronounsValueKey: value,
        }),
    );

    if (_CardEditViewTextEditingControllers.containsKey(PronounsValueKey)) {
      _CardEditViewTextEditingControllers[PronounsValueKey]?.text = value ?? '';
    }
  }

  set titleValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          TitleValueKey: value,
        }),
    );

    if (_CardEditViewTextEditingControllers.containsKey(TitleValueKey)) {
      _CardEditViewTextEditingControllers[TitleValueKey]?.text = value ?? '';
    }
  }

  set departmentValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          DepartmentValueKey: value,
        }),
    );

    if (_CardEditViewTextEditingControllers.containsKey(DepartmentValueKey)) {
      _CardEditViewTextEditingControllers[DepartmentValueKey]?.text =
          value ?? '';
    }
  }

  set companyValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          CompanyValueKey: value,
        }),
    );

    if (_CardEditViewTextEditingControllers.containsKey(CompanyValueKey)) {
      _CardEditViewTextEditingControllers[CompanyValueKey]?.text = value ?? '';
    }
  }

  set headlineValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          HeadlineValueKey: value,
        }),
    );

    if (_CardEditViewTextEditingControllers.containsKey(HeadlineValueKey)) {
      _CardEditViewTextEditingControllers[HeadlineValueKey]?.text = value ?? '';
    }
  }

  bool get hasFullName =>
      this.formValueMap.containsKey(FullNameValueKey) &&
      (fullNameValue?.isNotEmpty ?? false);
  bool get hasPrefix =>
      this.formValueMap.containsKey(PrefixValueKey) &&
      (prefixValue?.isNotEmpty ?? false);
  bool get hasFirstName =>
      this.formValueMap.containsKey(FirstNameValueKey) &&
      (firstNameValue?.isNotEmpty ?? false);
  bool get hasMiddleName =>
      this.formValueMap.containsKey(MiddleNameValueKey) &&
      (middleNameValue?.isNotEmpty ?? false);
  bool get hasLastName =>
      this.formValueMap.containsKey(LastNameValueKey) &&
      (lastNameValue?.isNotEmpty ?? false);
  bool get hasSuffix =>
      this.formValueMap.containsKey(SuffixValueKey) &&
      (suffixValue?.isNotEmpty ?? false);
  bool get hasAccreditations =>
      this.formValueMap.containsKey(AccreditationsValueKey) &&
      (accreditationsValue?.isNotEmpty ?? false);
  bool get hasPreferredName =>
      this.formValueMap.containsKey(PreferredNameValueKey) &&
      (preferredNameValue?.isNotEmpty ?? false);
  bool get hasMaidenName =>
      this.formValueMap.containsKey(MaidenNameValueKey) &&
      (maidenNameValue?.isNotEmpty ?? false);
  bool get hasPronouns =>
      this.formValueMap.containsKey(PronounsValueKey) &&
      (pronounsValue?.isNotEmpty ?? false);
  bool get hasTitle =>
      this.formValueMap.containsKey(TitleValueKey) &&
      (titleValue?.isNotEmpty ?? false);
  bool get hasDepartment =>
      this.formValueMap.containsKey(DepartmentValueKey) &&
      (departmentValue?.isNotEmpty ?? false);
  bool get hasCompany =>
      this.formValueMap.containsKey(CompanyValueKey) &&
      (companyValue?.isNotEmpty ?? false);
  bool get hasHeadline =>
      this.formValueMap.containsKey(HeadlineValueKey) &&
      (headlineValue?.isNotEmpty ?? false);

  bool get hasFullNameValidationMessage =>
      this.fieldsValidationMessages[FullNameValueKey]?.isNotEmpty ?? false;
  bool get hasPrefixValidationMessage =>
      this.fieldsValidationMessages[PrefixValueKey]?.isNotEmpty ?? false;
  bool get hasFirstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey]?.isNotEmpty ?? false;
  bool get hasMiddleNameValidationMessage =>
      this.fieldsValidationMessages[MiddleNameValueKey]?.isNotEmpty ?? false;
  bool get hasLastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey]?.isNotEmpty ?? false;
  bool get hasSuffixValidationMessage =>
      this.fieldsValidationMessages[SuffixValueKey]?.isNotEmpty ?? false;
  bool get hasAccreditationsValidationMessage =>
      this.fieldsValidationMessages[AccreditationsValueKey]?.isNotEmpty ??
      false;
  bool get hasPreferredNameValidationMessage =>
      this.fieldsValidationMessages[PreferredNameValueKey]?.isNotEmpty ?? false;
  bool get hasMaidenNameValidationMessage =>
      this.fieldsValidationMessages[MaidenNameValueKey]?.isNotEmpty ?? false;
  bool get hasPronounsValidationMessage =>
      this.fieldsValidationMessages[PronounsValueKey]?.isNotEmpty ?? false;
  bool get hasTitleValidationMessage =>
      this.fieldsValidationMessages[TitleValueKey]?.isNotEmpty ?? false;
  bool get hasDepartmentValidationMessage =>
      this.fieldsValidationMessages[DepartmentValueKey]?.isNotEmpty ?? false;
  bool get hasCompanyValidationMessage =>
      this.fieldsValidationMessages[CompanyValueKey]?.isNotEmpty ?? false;
  bool get hasHeadlineValidationMessage =>
      this.fieldsValidationMessages[HeadlineValueKey]?.isNotEmpty ?? false;

  String? get fullNameValidationMessage =>
      this.fieldsValidationMessages[FullNameValueKey];
  String? get prefixValidationMessage =>
      this.fieldsValidationMessages[PrefixValueKey];
  String? get firstNameValidationMessage =>
      this.fieldsValidationMessages[FirstNameValueKey];
  String? get middleNameValidationMessage =>
      this.fieldsValidationMessages[MiddleNameValueKey];
  String? get lastNameValidationMessage =>
      this.fieldsValidationMessages[LastNameValueKey];
  String? get suffixValidationMessage =>
      this.fieldsValidationMessages[SuffixValueKey];
  String? get accreditationsValidationMessage =>
      this.fieldsValidationMessages[AccreditationsValueKey];
  String? get preferredNameValidationMessage =>
      this.fieldsValidationMessages[PreferredNameValueKey];
  String? get maidenNameValidationMessage =>
      this.fieldsValidationMessages[MaidenNameValueKey];
  String? get pronounsValidationMessage =>
      this.fieldsValidationMessages[PronounsValueKey];
  String? get titleValidationMessage =>
      this.fieldsValidationMessages[TitleValueKey];
  String? get departmentValidationMessage =>
      this.fieldsValidationMessages[DepartmentValueKey];
  String? get companyValidationMessage =>
      this.fieldsValidationMessages[CompanyValueKey];
  String? get headlineValidationMessage =>
      this.fieldsValidationMessages[HeadlineValueKey];
  void clearForm() {
    fullNameValue = '';
    prefixValue = '';
    firstNameValue = '';
    middleNameValue = '';
    lastNameValue = '';
    suffixValue = '';
    accreditationsValue = '';
    preferredNameValue = '';
    maidenNameValue = '';
    pronounsValue = '';
    titleValue = '';
    departmentValue = '';
    companyValue = '';
    headlineValue = '';
  }
}

extension Methods on FormViewModel {
  setFullNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FullNameValueKey] = validationMessage;
  setPrefixValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PrefixValueKey] = validationMessage;
  setFirstNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[FirstNameValueKey] = validationMessage;
  setMiddleNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[MiddleNameValueKey] = validationMessage;
  setLastNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[LastNameValueKey] = validationMessage;
  setSuffixValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[SuffixValueKey] = validationMessage;
  setAccreditationsValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AccreditationsValueKey] = validationMessage;
  setPreferredNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PreferredNameValueKey] = validationMessage;
  setMaidenNameValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[MaidenNameValueKey] = validationMessage;
  setPronounsValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PronounsValueKey] = validationMessage;
  setTitleValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[TitleValueKey] = validationMessage;
  setDepartmentValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[DepartmentValueKey] = validationMessage;
  setCompanyValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[CompanyValueKey] = validationMessage;
  setHeadlineValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[HeadlineValueKey] = validationMessage;
}
