// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file:

part of 'digital_card.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveDigitalCardFormConsumer extends StatelessWidget {
  const ReactiveDigitalCardFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
      BuildContext context, DigitalCardForm formModel, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveDigitalCardForm.of(context);

    if (formModel is! DigitalCardForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class DigitalCardFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const DigitalCardFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(
          stream,
          child,
          key: key,
        );

  final DigitalCardForm form;
}

class ReactiveDigitalCardForm extends StatelessWidget {
  const ReactiveDigitalCardForm({
    Key? key,
    required this.form,
    required this.child,
    this.onWillPop,
  }) : super(key: key);

  final Widget child;

  final DigitalCardForm form;

  final WillPopCallback? onWillPop;

  static DigitalCardForm? of(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<
              DigitalCardFormInheritedStreamer>()
          ?.form;
    }

    final element = context.getElementForInheritedWidgetOfExactType<
        DigitalCardFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as DigitalCardFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return DigitalCardFormInheritedStreamer(
      form: form,
      stream: form.form.statusChanged,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: child,
      ),
    );
  }
}

class DigitalCardFormBuilder extends StatefulWidget {
  const DigitalCardFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.onWillPop,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final DigitalCard? model;

  final Widget? child;

  final WillPopCallback? onWillPop;

  final Widget Function(
      BuildContext context, DigitalCardForm formModel, Widget? child) builder;

  final void Function(BuildContext context, DigitalCardForm formModel)?
      initState;

  @override
  _DigitalCardFormBuilderState createState() => _DigitalCardFormBuilderState();
}

class _DigitalCardFormBuilderState extends State<DigitalCardFormBuilder> {
  late FormGroup _form;

  late DigitalCardForm _formModel;

  @override
  void initState() {
    _form = FormGroup({});
    _formModel = DigitalCardForm(widget.model, _form, null);

    final elements = _formModel.formElements();
    _form.setValidators(elements.validators);
    _form.setAsyncValidators(elements.asyncValidators);

    if (elements.disabled) {
      _form.markAsDisabled();
    }

    _form.addAll(elements.controls);

    widget.initState?.call(context, _formModel);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant DigitalCardFormBuilder oldWidget) {
    if (widget.model != oldWidget.model) {
      _formModel = DigitalCardForm(widget.model, _form, null);
      final elements = _formModel.formElements();

      _form.updateValue(elements.rawValue);
      _form.setValidators(elements.validators);
      _form.setAsyncValidators(elements.asyncValidators);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveDigitalCardForm(
      form: _formModel,
      onWillPop: widget.onWillPop,
      child: ReactiveFormBuilder(
        form: () => _form,
        onWillPop: widget.onWillPop,
        builder: (BuildContext context, FormGroup formGroup, Widget? child) =>
            widget.builder(context, _formModel, widget.child),
        child: widget.child,
      ),
    );
  }
}

class DigitalCardForm implements FormModel<DigitalCard> {
  DigitalCardForm(
    this.digitalCard,
    this.form,
    this.path,
  ) {}

  static String idControlName = "id";

  static String userIdControlName = "userId";

  static String uuidControlName = "uuid";

  static String titleControlName = "title";

  static String logoImageControlName = "logoImage";

  static String colorControlName = "color";

  static String profileImageControlName = "profileImage";

  static String prefixControlName = "prefix";

  static String firstNameControlName = "firstName";

  static String middleNameControlName = "middleName";

  static String lastNameControlName = "lastName";

  static String suffixControlName = "suffix";

  static String shortBioControlName = "shortBio";

  static String positionControlName = "position";

  static String companyControlName = "company";

  static String emailControlName = "email";

  static String addressControlName = "address";

  static String mobileNumberControlName = "mobileNumber";

  static String websiteControlName = "website";

  static String goesByControlName = "goesBy";

  final DigitalCard? digitalCard;

  final FormGroup form;

  final String? path;

  String idControlPath() => pathBuilder(idControlName);
  String userIdControlPath() => pathBuilder(userIdControlName);
  String uuidControlPath() => pathBuilder(uuidControlName);
  String titleControlPath() => pathBuilder(titleControlName);
  String logoImageControlPath() => pathBuilder(logoImageControlName);
  String colorControlPath() => pathBuilder(colorControlName);
  String profileImageControlPath() => pathBuilder(profileImageControlName);
  String prefixControlPath() => pathBuilder(prefixControlName);
  String firstNameControlPath() => pathBuilder(firstNameControlName);
  String middleNameControlPath() => pathBuilder(middleNameControlName);
  String lastNameControlPath() => pathBuilder(lastNameControlName);
  String suffixControlPath() => pathBuilder(suffixControlName);
  String shortBioControlPath() => pathBuilder(shortBioControlName);
  String positionControlPath() => pathBuilder(positionControlName);
  String companyControlPath() => pathBuilder(companyControlName);
  String emailControlPath() => pathBuilder(emailControlName);
  String addressControlPath() => pathBuilder(addressControlName);
  String mobileNumberControlPath() => pathBuilder(mobileNumberControlName);
  String websiteControlPath() => pathBuilder(websiteControlName);
  String goesByControlPath() => pathBuilder(goesByControlName);
  int? get _idValue => idControl?.value;
  int? get _userIdValue => userIdControl?.value;
  String? get _uuidValue => uuidControl?.value;
  String? get _titleValue => titleControl?.value;
  String? get _logoImageValue => logoImageControl?.value;
  String? get _colorValue => colorControl?.value;
  String? get _profileImageValue => profileImageControl?.value;
  String? get _prefixValue => prefixControl?.value;
  String? get _firstNameValue => firstNameControl?.value;
  String? get _middleNameValue => middleNameControl?.value;
  String? get _lastNameValue => lastNameControl?.value;
  String? get _suffixValue => suffixControl?.value;
  String? get _shortBioValue => shortBioControl?.value;
  String? get _positionValue => positionControl?.value;
  String? get _companyValue => companyControl?.value;
  String? get _emailValue => emailControl?.value;
  String? get _addressValue => addressControl?.value;
  String? get _mobileNumberValue => mobileNumberControl?.value;
  String? get _websiteValue => websiteControl?.value;
  String? get _goesByValue => goesByControl?.value;
  bool get containsId {
    try {
      form.control(idControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsUserId {
    try {
      form.control(userIdControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsUuid {
    try {
      form.control(uuidControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsTitle {
    try {
      form.control(titleControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsLogoImage {
    try {
      form.control(logoImageControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsColor {
    try {
      form.control(colorControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsProfileImage {
    try {
      form.control(profileImageControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsPrefix {
    try {
      form.control(prefixControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsFirstName {
    try {
      form.control(firstNameControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsMiddleName {
    try {
      form.control(middleNameControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsLastName {
    try {
      form.control(lastNameControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsSuffix {
    try {
      form.control(suffixControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsShortBio {
    try {
      form.control(shortBioControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsPosition {
    try {
      form.control(positionControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsCompany {
    try {
      form.control(companyControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsEmail {
    try {
      form.control(emailControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsAddress {
    try {
      form.control(addressControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsMobileNumber {
    try {
      form.control(mobileNumberControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsWebsite {
    try {
      form.control(websiteControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsGoesBy {
    try {
      form.control(goesByControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get idErrors => idControl?.errors;
  Object? get userIdErrors => userIdControl?.errors;
  Object? get uuidErrors => uuidControl?.errors;
  Object? get titleErrors => titleControl?.errors;
  Object? get logoImageErrors => logoImageControl?.errors;
  Object? get colorErrors => colorControl?.errors;
  Object? get profileImageErrors => profileImageControl?.errors;
  Object? get prefixErrors => prefixControl?.errors;
  Object? get firstNameErrors => firstNameControl?.errors;
  Object? get middleNameErrors => middleNameControl?.errors;
  Object? get lastNameErrors => lastNameControl?.errors;
  Object? get suffixErrors => suffixControl?.errors;
  Object? get shortBioErrors => shortBioControl?.errors;
  Object? get positionErrors => positionControl?.errors;
  Object? get companyErrors => companyControl?.errors;
  Object? get emailErrors => emailControl?.errors;
  Object? get addressErrors => addressControl?.errors;
  Object? get mobileNumberErrors => mobileNumberControl?.errors;
  Object? get websiteErrors => websiteControl?.errors;
  Object? get goesByErrors => goesByControl?.errors;
  void get idFocus => form.focus(idControlPath());
  void get userIdFocus => form.focus(userIdControlPath());
  void get uuidFocus => form.focus(uuidControlPath());
  void get titleFocus => form.focus(titleControlPath());
  void get logoImageFocus => form.focus(logoImageControlPath());
  void get colorFocus => form.focus(colorControlPath());
  void get profileImageFocus => form.focus(profileImageControlPath());
  void get prefixFocus => form.focus(prefixControlPath());
  void get firstNameFocus => form.focus(firstNameControlPath());
  void get middleNameFocus => form.focus(middleNameControlPath());
  void get lastNameFocus => form.focus(lastNameControlPath());
  void get suffixFocus => form.focus(suffixControlPath());
  void get shortBioFocus => form.focus(shortBioControlPath());
  void get positionFocus => form.focus(positionControlPath());
  void get companyFocus => form.focus(companyControlPath());
  void get emailFocus => form.focus(emailControlPath());
  void get addressFocus => form.focus(addressControlPath());
  void get mobileNumberFocus => form.focus(mobileNumberControlPath());
  void get websiteFocus => form.focus(websiteControlPath());
  void get goesByFocus => form.focus(goesByControlPath());
  void idRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsId) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          idControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            idControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void userIdRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsUserId) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          userIdControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            userIdControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void uuidRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsUuid) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          uuidControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            uuidControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void titleRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsTitle) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          titleControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            titleControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void logoImageRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsLogoImage) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          logoImageControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            logoImageControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void colorRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsColor) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          colorControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            colorControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void profileImageRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsProfileImage) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          profileImageControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            profileImageControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void prefixRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsPrefix) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          prefixControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            prefixControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void firstNameRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsFirstName) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          firstNameControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            firstNameControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void middleNameRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsMiddleName) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          middleNameControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            middleNameControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void lastNameRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsLastName) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          lastNameControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            lastNameControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void suffixRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsSuffix) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          suffixControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            suffixControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void shortBioRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsShortBio) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          shortBioControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            shortBioControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void positionRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsPosition) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          positionControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            positionControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void companyRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsCompany) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          companyControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            companyControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void emailRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsEmail) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          emailControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            emailControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void addressRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsAddress) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          addressControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            addressControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void mobileNumberRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsMobileNumber) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          mobileNumberControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            mobileNumberControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void websiteRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsWebsite) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          websiteControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            websiteControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void goesByRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsGoesBy) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          goesByControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            goesByControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void idValueUpdate(
    int? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    idControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void userIdValueUpdate(
    int? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    userIdControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void uuidValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    uuidControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void titleValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    titleControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void logoImageValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    logoImageControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void colorValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    colorControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void profileImageValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    profileImageControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void prefixValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    prefixControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void firstNameValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    firstNameControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void middleNameValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    middleNameControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void lastNameValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    lastNameControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void suffixValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    suffixControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void shortBioValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    shortBioControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void positionValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    positionControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void companyValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    companyControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void emailValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    emailControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void addressValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    addressControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void mobileNumberValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    mobileNumberControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void websiteValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    websiteControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void goesByValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    goesByControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void idValuePatch(
    int? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    idControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void userIdValuePatch(
    int? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    userIdControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void uuidValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    uuidControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void titleValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    titleControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void logoImageValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    logoImageControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void colorValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    colorControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void profileImageValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    profileImageControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void prefixValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    prefixControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void firstNameValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    firstNameControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void middleNameValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    middleNameControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void lastNameValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    lastNameControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void suffixValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    suffixControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void shortBioValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    shortBioControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void positionValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    positionControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void companyValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    companyControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void emailValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    emailControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void addressValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    addressControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void mobileNumberValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    mobileNumberControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void websiteValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    websiteControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void goesByValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    goesByControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void idValueReset(
    int? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      idControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void userIdValueReset(
    int? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      userIdControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void uuidValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      uuidControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void titleValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      titleControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void logoImageValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      logoImageControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void colorValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      colorControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void profileImageValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      profileImageControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void prefixValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      prefixControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void firstNameValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      firstNameControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void middleNameValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      middleNameControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void lastNameValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      lastNameControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void suffixValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      suffixControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void shortBioValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      shortBioControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void positionValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      positionControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void companyValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      companyControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void emailValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      emailControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void addressValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      addressControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void mobileNumberValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      mobileNumberControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void websiteValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      websiteControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  void goesByValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      goesByControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
  FormControl<int>? get idControl =>
      containsId ? form.control(idControlPath()) as FormControl<int>? : null;
  FormControl<int>? get userIdControl => containsUserId
      ? form.control(userIdControlPath()) as FormControl<int>?
      : null;
  FormControl<String>? get uuidControl => containsUuid
      ? form.control(uuidControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get titleControl => containsTitle
      ? form.control(titleControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get logoImageControl => containsLogoImage
      ? form.control(logoImageControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get colorControl => containsColor
      ? form.control(colorControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get profileImageControl => containsProfileImage
      ? form.control(profileImageControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get prefixControl => containsPrefix
      ? form.control(prefixControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get firstNameControl => containsFirstName
      ? form.control(firstNameControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get middleNameControl => containsMiddleName
      ? form.control(middleNameControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get lastNameControl => containsLastName
      ? form.control(lastNameControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get suffixControl => containsSuffix
      ? form.control(suffixControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get shortBioControl => containsShortBio
      ? form.control(shortBioControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get positionControl => containsPosition
      ? form.control(positionControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get companyControl => containsCompany
      ? form.control(companyControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get emailControl => containsEmail
      ? form.control(emailControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get addressControl => containsAddress
      ? form.control(addressControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get mobileNumberControl => containsMobileNumber
      ? form.control(mobileNumberControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get websiteControl => containsWebsite
      ? form.control(websiteControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get goesByControl => containsGoesBy
      ? form.control(goesByControlPath()) as FormControl<String>?
      : null;
  void idSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      idControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      idControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void userIdSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      userIdControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      userIdControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void uuidSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      uuidControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      uuidControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void titleSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      titleControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      titleControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void logoImageSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      logoImageControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      logoImageControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void colorSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      colorControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      colorControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void profileImageSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      profileImageControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      profileImageControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void prefixSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      prefixControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      prefixControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void firstNameSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      firstNameControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      firstNameControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void middleNameSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      middleNameControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      middleNameControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void lastNameSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      lastNameControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      lastNameControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void suffixSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      suffixControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      suffixControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void shortBioSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      shortBioControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      shortBioControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void positionSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      positionControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      positionControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void companySetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      companyControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      companyControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void emailSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      emailControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      emailControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void addressSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      addressControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      addressControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void mobileNumberSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      mobileNumberControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      mobileNumberControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void websiteSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      websiteControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      websiteControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void goesBySetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      goesByControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      goesByControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  DigitalCard get model {
    if (!form.valid) {
      debugPrint(
        'Prefer not to call `model` on non-valid form it could cause unexpected exceptions in case you created a non-nullable field in model and expect it to be guarded by some kind of `required` validator.',
      );
    }
    return DigitalCard(
        id: _idValue,
        userId: _userIdValue,
        uuid: _uuidValue,
        title: _titleValue,
        logoImage: _logoImageValue,
        color: _colorValue,
        profileImage: _profileImageValue,
        prefix: _prefixValue,
        firstName: _firstNameValue,
        middleName: _middleNameValue,
        lastName: _lastNameValue,
        suffix: _suffixValue,
        shortBio: _shortBioValue,
        position: _positionValue,
        company: _companyValue,
        email: _emailValue,
        address: _addressValue,
        mobileNumber: _mobileNumberValue,
        website: _websiteValue,
        goesBy: _goesByValue,
        createdAt: digitalCard?.createdAt,
        updatedAt: digitalCard?.updatedAt);
  }

  DigitalCardForm copyWithPath(String? path) {
    return DigitalCardForm(digitalCard, form, path);
  }

  @override
  void updateValue(
    DigitalCard value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(
          DigitalCardForm(value, FormGroup({}), null).formElements().rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);
  @override
  void resetValue(
    DigitalCard value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: DigitalCardForm(value, FormGroup({}), null)
              .formElements()
              .rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);
  @override
  void reset({
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: formElements().rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);
  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");
  FormGroup formElements() => FormGroup({
        idControlName: FormControl<int>(
            value: digitalCard?.id,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        userIdControlName: FormControl<int>(
            value: digitalCard?.userId,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        uuidControlName: FormControl<String>(
            value: digitalCard?.uuid,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        titleControlName: FormControl<String>(
            value: digitalCard?.title,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        logoImageControlName: FormControl<String>(
            value: digitalCard?.logoImage,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        colorControlName: FormControl<String>(
            value: digitalCard?.color,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        profileImageControlName: FormControl<String>(
            value: digitalCard?.profileImage,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        prefixControlName: FormControl<String>(
            value: digitalCard?.prefix,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        firstNameControlName: FormControl<String>(
            value: digitalCard?.firstName,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        middleNameControlName: FormControl<String>(
            value: digitalCard?.middleName,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        lastNameControlName: FormControl<String>(
            value: digitalCard?.lastName,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        suffixControlName: FormControl<String>(
            value: digitalCard?.suffix,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        shortBioControlName: FormControl<String>(
            value: digitalCard?.shortBio,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        positionControlName: FormControl<String>(
            value: digitalCard?.position,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        companyControlName: FormControl<String>(
            value: digitalCard?.company,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        emailControlName: FormControl<String>(
            value: digitalCard?.email,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        addressControlName: FormControl<String>(
            value: digitalCard?.address,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        mobileNumberControlName: FormControl<String>(
            value: digitalCard?.mobileNumber,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        websiteControlName: FormControl<String>(
            value: digitalCard?.website,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        goesByControlName: FormControl<String>(
            value: digitalCard?.goesBy,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false)
      },
          validators: [],
          asyncValidators: [],
          asyncValidatorsDebounceTime: 250,
          disabled: false);
}

class ReactiveDigitalCardFormArrayBuilder<T> extends StatelessWidget {
  const ReactiveDigitalCardFormArrayBuilder({
    Key? key,
    this.control,
    this.formControl,
    this.builder,
    required this.itemBuilder,
  })  : assert(control != null || formControl != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final FormArray<T>? formControl;

  final FormArray<T>? Function(DigitalCardForm formModel)? control;

  final Widget Function(BuildContext context, List<Widget> itemList,
      DigitalCardForm formModel)? builder;

  final Widget Function(
          BuildContext context, int i, T? item, DigitalCardForm formModel)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveDigitalCardForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    return ReactiveFormArray<T>(
      formArray: formControl ?? control?.call(formModel),
      builder: (context, formArray, child) {
        final itemList = (formArray.value ?? [])
            .asMap()
            .map((i, item) {
              return MapEntry(
                i,
                itemBuilder(
                  context,
                  i,
                  item,
                  formModel,
                ),
              );
            })
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}

class ReactiveDigitalCardFormFormGroupArrayBuilder<V> extends StatelessWidget {
  const ReactiveDigitalCardFormFormGroupArrayBuilder({
    Key? key,
    this.extended,
    this.getExtended,
    this.builder,
    required this.itemBuilder,
  })  : assert(extended != null || getExtended != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final ExtendedControl<List<Map<String, Object?>?>, List<V>>? extended;

  final ExtendedControl<List<Map<String, Object?>?>, List<V>> Function(
      DigitalCardForm formModel)? getExtended;

  final Widget Function(BuildContext context, List<Widget> itemList,
      DigitalCardForm formModel)? builder;

  final Widget Function(
          BuildContext context, int i, V? item, DigitalCardForm formModel)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveDigitalCardForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final value = (extended ?? getExtended?.call(formModel))!;

    return StreamBuilder<List<Map<String, Object?>?>?>(
      stream: value.control.valueChanges,
      builder: (context, snapshot) {
        final itemList = (value.value() ?? <V>[])
            .asMap()
            .map((i, item) => MapEntry(
                  i,
                  itemBuilder(
                    context,
                    i,
                    item,
                    formModel,
                  ),
                ))
            .values
            .toList();

        return builder?.call(
              context,
              itemList,
              formModel,
            ) ??
            Column(children: itemList);
      },
    );
  }
}
