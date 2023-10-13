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
  late DigitalCardForm _formModel;

  @override
  void initState() {
    _formModel =
        DigitalCardForm(DigitalCardForm.formElements(widget.model), null);

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant DigitalCardFormBuilder oldWidget) {
    if (widget.model != oldWidget.model) {
      _formModel =
          DigitalCardForm(DigitalCardForm.formElements(widget.model), null);

      if (_formModel.form.disabled) {
        _formModel.form.markAsDisabled();
      }

      widget.initState?.call(context, _formModel);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _formModel.form.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveDigitalCardForm(
      key: ObjectKey(_formModel),
      form: _formModel,
      onWillPop: widget.onWillPop,
      child: ReactiveFormBuilder(
        form: () => _formModel.form,
        onWillPop: widget.onWillPop,
        builder: (context, formGroup, child) =>
            widget.builder(context, _formModel, widget.child),
        child: widget.child,
      ),
    );
  }
}

class DigitalCardForm implements FormModel<DigitalCard> {
  DigitalCardForm(
    this.form,
    this.path,
  );

  static const String idControlName = "id";

  static const String userIdControlName = "userId";

  static const String uuidControlName = "uuid";

  static const String titleControlName = "title";

  static const String prefixControlName = "prefix";

  static const String firstNameControlName = "firstName";

  static const String middleNameControlName = "middleName";

  static const String lastNameControlName = "lastName";

  static const String suffixControlName = "suffix";

  static const String accreditationsControlName = "accreditations";

  static const String maidenNameControlName = "maidenName";

  static const String logoUrlControlName = "logoUrl";

  static const String avatarUrlControlName = "avatarUrl";

  static const String avatarFileControlName = "avatarFile";

  static const String logoFileControlName = "logoFile";

  static const String colorControlName = "color";

  static const String layoutControlName = "layout";

  static const String positionControlName = "position";

  static const String departmentControlName = "department";

  static const String companyControlName = "company";

  static const String headlineControlName = "headline";

  static const String customLinksControlName = "customLinks";

  static const String createdAtControlName = "createdAt";

  static const String updatedAtControlName = "updatedAt";

  static const String addedAtControlName = "addedAt";

  final FormGroup form;

  final String? path;

  String idControlPath() => pathBuilder(idControlName);

  String userIdControlPath() => pathBuilder(userIdControlName);

  String uuidControlPath() => pathBuilder(uuidControlName);

  String titleControlPath() => pathBuilder(titleControlName);

  String prefixControlPath() => pathBuilder(prefixControlName);

  String firstNameControlPath() => pathBuilder(firstNameControlName);

  String middleNameControlPath() => pathBuilder(middleNameControlName);

  String lastNameControlPath() => pathBuilder(lastNameControlName);

  String suffixControlPath() => pathBuilder(suffixControlName);

  String accreditationsControlPath() => pathBuilder(accreditationsControlName);

  String maidenNameControlPath() => pathBuilder(maidenNameControlName);

  String logoUrlControlPath() => pathBuilder(logoUrlControlName);

  String avatarUrlControlPath() => pathBuilder(avatarUrlControlName);

  String avatarFileControlPath() => pathBuilder(avatarFileControlName);

  String logoFileControlPath() => pathBuilder(logoFileControlName);

  String colorControlPath() => pathBuilder(colorControlName);

  String layoutControlPath() => pathBuilder(layoutControlName);

  String positionControlPath() => pathBuilder(positionControlName);

  String departmentControlPath() => pathBuilder(departmentControlName);

  String companyControlPath() => pathBuilder(companyControlName);

  String headlineControlPath() => pathBuilder(headlineControlName);

  String createdAtControlPath() => pathBuilder(createdAtControlName);

  String updatedAtControlPath() => pathBuilder(updatedAtControlName);

  String addedAtControlPath() => pathBuilder(addedAtControlName);

  String customLinksControlPath() => pathBuilder(customLinksControlName);

  int? get _idValue => idControl?.value;

  String? get _userIdValue => userIdControl?.value;

  String? get _uuidValue => uuidControl?.value;

  String? get _titleValue => titleControl?.value;

  String? get _prefixValue => prefixControl?.value;

  String? get _firstNameValue => firstNameControl?.value;

  String? get _middleNameValue => middleNameControl?.value;

  String? get _lastNameValue => lastNameControl?.value;

  String? get _suffixValue => suffixControl?.value;

  String? get _accreditationsValue => accreditationsControl?.value;

  String? get _maidenNameValue => maidenNameControl?.value;

  String? get _logoUrlValue => logoUrlControl?.value;

  String? get _avatarUrlValue => avatarUrlControl?.value;

  Uint8List? get _avatarFileValue => avatarFileControl?.value;

  Uint8List? get _logoFileValue => logoFileControl?.value;

  int? get _colorValue => colorControl?.value;

  int? get _layoutValue => layoutControl?.value;

  String? get _positionValue => positionControl?.value;

  String? get _departmentValue => departmentControl?.value;

  String? get _companyValue => companyControl?.value;

  String? get _headlineValue => headlineControl?.value;

  DateTime? get _createdAtValue => createdAtControl?.value;

  DateTime? get _updatedAtValue => updatedAtControl?.value;

  DateTime? get _addedAtValue => addedAtControl?.value;

  List<CustomLink> get _customLinksValue =>
      customLinksCustomLinkForm.map((e) => e.model).toList();

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

  bool get containsAccreditations {
    try {
      form.control(accreditationsControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsMaidenName {
    try {
      form.control(maidenNameControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsLogoUrl {
    try {
      form.control(logoUrlControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsAvatarUrl {
    try {
      form.control(avatarUrlControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsAvatarFile {
    try {
      form.control(avatarFileControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsLogoFile {
    try {
      form.control(logoFileControlPath());
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

  bool get containsLayout {
    try {
      form.control(layoutControlPath());
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

  bool get containsDepartment {
    try {
      form.control(departmentControlPath());
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

  bool get containsHeadline {
    try {
      form.control(headlineControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsCreatedAt {
    try {
      form.control(createdAtControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsUpdatedAt {
    try {
      form.control(updatedAtControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsAddedAt {
    try {
      form.control(addedAtControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsCustomLinks {
    try {
      form.control(customLinksControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get idErrors => idControl?.errors;

  Object? get userIdErrors => userIdControl?.errors;

  Object? get uuidErrors => uuidControl?.errors;

  Object? get titleErrors => titleControl?.errors;

  Object? get prefixErrors => prefixControl?.errors;

  Object? get firstNameErrors => firstNameControl?.errors;

  Object? get middleNameErrors => middleNameControl?.errors;

  Object? get lastNameErrors => lastNameControl?.errors;

  Object? get suffixErrors => suffixControl?.errors;

  Object? get accreditationsErrors => accreditationsControl?.errors;

  Object? get maidenNameErrors => maidenNameControl?.errors;

  Object? get logoUrlErrors => logoUrlControl?.errors;

  Object? get avatarUrlErrors => avatarUrlControl?.errors;

  Object? get avatarFileErrors => avatarFileControl?.errors;

  Object? get logoFileErrors => logoFileControl?.errors;

  Object? get colorErrors => colorControl?.errors;

  Object? get layoutErrors => layoutControl?.errors;

  Object? get positionErrors => positionControl?.errors;

  Object? get departmentErrors => departmentControl?.errors;

  Object? get companyErrors => companyControl?.errors;

  Object? get headlineErrors => headlineControl?.errors;

  Object? get createdAtErrors => createdAtControl?.errors;

  Object? get updatedAtErrors => updatedAtControl?.errors;

  Object? get addedAtErrors => addedAtControl?.errors;

  Object? get customLinksErrors => customLinksControl.errors;

  void get idFocus => form.focus(idControlPath());

  void get userIdFocus => form.focus(userIdControlPath());

  void get uuidFocus => form.focus(uuidControlPath());

  void get titleFocus => form.focus(titleControlPath());

  void get prefixFocus => form.focus(prefixControlPath());

  void get firstNameFocus => form.focus(firstNameControlPath());

  void get middleNameFocus => form.focus(middleNameControlPath());

  void get lastNameFocus => form.focus(lastNameControlPath());

  void get suffixFocus => form.focus(suffixControlPath());

  void get accreditationsFocus => form.focus(accreditationsControlPath());

  void get maidenNameFocus => form.focus(maidenNameControlPath());

  void get logoUrlFocus => form.focus(logoUrlControlPath());

  void get avatarUrlFocus => form.focus(avatarUrlControlPath());

  void get avatarFileFocus => form.focus(avatarFileControlPath());

  void get logoFileFocus => form.focus(logoFileControlPath());

  void get colorFocus => form.focus(colorControlPath());

  void get layoutFocus => form.focus(layoutControlPath());

  void get positionFocus => form.focus(positionControlPath());

  void get departmentFocus => form.focus(departmentControlPath());

  void get companyFocus => form.focus(companyControlPath());

  void get headlineFocus => form.focus(headlineControlPath());

  void get createdAtFocus => form.focus(createdAtControlPath());

  void get updatedAtFocus => form.focus(updatedAtControlPath());

  void get addedAtFocus => form.focus(addedAtControlPath());

  void get customLinksFocus => form.focus(customLinksControlPath());

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

  void accreditationsRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsAccreditations) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          accreditationsControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            accreditationsControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void maidenNameRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsMaidenName) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          maidenNameControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            maidenNameControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void logoUrlRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsLogoUrl) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          logoUrlControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            logoUrlControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void avatarUrlRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsAvatarUrl) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          avatarUrlControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            avatarUrlControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void avatarFileRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsAvatarFile) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          avatarFileControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            avatarFileControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void logoFileRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsLogoFile) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          logoFileControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            logoFileControlName,
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

  void layoutRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsLayout) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          layoutControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            layoutControlName,
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

  void departmentRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsDepartment) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          departmentControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            departmentControlName,
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

  void headlineRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsHeadline) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          headlineControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            headlineControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void createdAtRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsCreatedAt) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          createdAtControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            createdAtControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void updatedAtRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsUpdatedAt) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          updatedAtControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            updatedAtControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void addedAtRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsAddedAt) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          addedAtControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            addedAtControlName,
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
    String? value, {
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

  void accreditationsValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    accreditationsControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void maidenNameValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    maidenNameControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void logoUrlValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    logoUrlControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void avatarUrlValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    avatarUrlControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void avatarFileValueUpdate(
    Uint8List? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    avatarFileControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void logoFileValueUpdate(
    Uint8List? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    logoFileControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void colorValueUpdate(
    int? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    colorControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void layoutValueUpdate(
    int? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    layoutControl?.updateValue(value,
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

  void departmentValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    departmentControl?.updateValue(value,
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

  void headlineValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    headlineControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void createdAtValueUpdate(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    createdAtControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void updatedAtValueUpdate(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    updatedAtControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void addedAtValueUpdate(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    addedAtControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void customLinksValueUpdate(
    List<CustomLink> value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final localValue = (value);
    if (localValue.isEmpty) {
      customLinksClear(updateParent: updateParent, emitEvent: emitEvent);

      return;
    }

    final toUpdate = <CustomLink>[];
    final toAdd = <CustomLink>[];

    localValue.asMap().forEach((k, v) {
      if (customLinksCustomLinkForm.asMap().containsKey(k) &&
          (customLinksControl.value ?? []).asMap().containsKey(k)) {
        toUpdate.add(v);
      } else {
        toAdd.add(v);
      }
    });

    if (toUpdate.isNotEmpty) {
      customLinksControl.updateValue(
          toUpdate.map((e) => CustomLinkForm.formElements(e).rawValue).toList(),
          updateParent: updateParent,
          emitEvent: emitEvent);
    }

    if (toAdd.isNotEmpty) {
      toAdd.forEach((e) {
        customLinksControl.add(CustomLinkForm.formElements(e),
            updateParent: updateParent, emitEvent: emitEvent);
      });
    }
  }

  void customLinksInsert(
    int i,
    CustomLink value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if ((customLinksControl.value ?? []).length < i) {
      addCustomLinksItem(value);
      return;
    }

    customLinksControl.insert(
      i,
      CustomLinkForm.formElements(value),
      updateParent: updateParent,
      emitEvent: emitEvent,
    );
  }

  void customLinksClear({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    customLinksCustomLinkForm.clear();
    customLinksControl.clear(updateParent: updateParent, emitEvent: emitEvent);
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
    String? value, {
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

  void accreditationsValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    accreditationsControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void maidenNameValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    maidenNameControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void logoUrlValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    logoUrlControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void avatarUrlValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    avatarUrlControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void avatarFileValuePatch(
    Uint8List? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    avatarFileControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void logoFileValuePatch(
    Uint8List? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    logoFileControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void colorValuePatch(
    int? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    colorControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void layoutValuePatch(
    int? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    layoutControl?.patchValue(value,
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

  void departmentValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    departmentControl?.patchValue(value,
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

  void headlineValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    headlineControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void createdAtValuePatch(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    createdAtControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void updatedAtValuePatch(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    updatedAtControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void addedAtValuePatch(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    addedAtControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void customLinksValuePatch(
    List<CustomLink> value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final keys = customLinksCustomLinkForm.asMap().keys;

    final toPatch = <CustomLink>[];
    (value).asMap().forEach(
      (k, v) {
        if (keys.contains(k)) {
          toPatch.add(v);
        }
      },
    );

    customLinksControl.patchValue(
        toPatch.map((e) => CustomLinkForm.formElements(e).rawValue).toList(),
        updateParent: updateParent,
        emitEvent: emitEvent);
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
    String? value, {
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

  void accreditationsValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      accreditationsControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void maidenNameValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      maidenNameControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void logoUrlValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      logoUrlControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void avatarUrlValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      avatarUrlControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void avatarFileValueReset(
    Uint8List? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      avatarFileControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void logoFileValueReset(
    Uint8List? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      logoFileControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void colorValueReset(
    int? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      colorControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void layoutValueReset(
    int? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      layoutControl?.reset(
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

  void departmentValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      departmentControl?.reset(
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

  void headlineValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      headlineControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void createdAtValueReset(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      createdAtControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void updatedAtValueReset(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      updatedAtControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void addedAtValueReset(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      addedAtControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void customLinksValueReset(
    List<CustomLink> value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      customLinksControl.reset(
          value: value
              .map((e) => CustomLinkForm.formElements(e).rawValue)
              .toList(),
          updateParent: updateParent,
          emitEvent: emitEvent);

  FormControl<int>? get idControl =>
      containsId ? form.control(idControlPath()) as FormControl<int>? : null;

  FormControl<String>? get userIdControl => containsUserId
      ? form.control(userIdControlPath()) as FormControl<String>?
      : null;

  FormControl<String>? get uuidControl => containsUuid
      ? form.control(uuidControlPath()) as FormControl<String>?
      : null;

  FormControl<String>? get titleControl => containsTitle
      ? form.control(titleControlPath()) as FormControl<String>?
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

  FormControl<String>? get accreditationsControl => containsAccreditations
      ? form.control(accreditationsControlPath()) as FormControl<String>?
      : null;

  FormControl<String>? get maidenNameControl => containsMaidenName
      ? form.control(maidenNameControlPath()) as FormControl<String>?
      : null;

  FormControl<String>? get logoUrlControl => containsLogoUrl
      ? form.control(logoUrlControlPath()) as FormControl<String>?
      : null;

  FormControl<String>? get avatarUrlControl => containsAvatarUrl
      ? form.control(avatarUrlControlPath()) as FormControl<String>?
      : null;

  FormControl<Uint8List>? get avatarFileControl => containsAvatarFile
      ? form.control(avatarFileControlPath()) as FormControl<Uint8List>?
      : null;

  FormControl<Uint8List>? get logoFileControl => containsLogoFile
      ? form.control(logoFileControlPath()) as FormControl<Uint8List>?
      : null;

  FormControl<int>? get colorControl => containsColor
      ? form.control(colorControlPath()) as FormControl<int>?
      : null;

  FormControl<int>? get layoutControl => containsLayout
      ? form.control(layoutControlPath()) as FormControl<int>?
      : null;

  FormControl<String>? get positionControl => containsPosition
      ? form.control(positionControlPath()) as FormControl<String>?
      : null;

  FormControl<String>? get departmentControl => containsDepartment
      ? form.control(departmentControlPath()) as FormControl<String>?
      : null;

  FormControl<String>? get companyControl => containsCompany
      ? form.control(companyControlPath()) as FormControl<String>?
      : null;

  FormControl<String>? get headlineControl => containsHeadline
      ? form.control(headlineControlPath()) as FormControl<String>?
      : null;

  FormControl<DateTime>? get createdAtControl => containsCreatedAt
      ? form.control(createdAtControlPath()) as FormControl<DateTime>?
      : null;

  FormControl<DateTime>? get updatedAtControl => containsUpdatedAt
      ? form.control(updatedAtControlPath()) as FormControl<DateTime>?
      : null;

  FormControl<DateTime>? get addedAtControl => containsAddedAt
      ? form.control(addedAtControlPath()) as FormControl<DateTime>?
      : null;

  FormArray<Map<String, Object?>> get customLinksControl =>
      form.control(customLinksControlPath()) as FormArray<Map<String, Object?>>;

  List<CustomLinkForm> get customLinksCustomLinkForm =>
      (customLinksControl.value ?? [])
          .asMap()
          .map((k, v) =>
              MapEntry(k, CustomLinkForm(form, pathBuilder("customLinks.$k"))))
          .values
          .toList();

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

  void accreditationsSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      accreditationsControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      accreditationsControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void maidenNameSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      maidenNameControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      maidenNameControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void logoUrlSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      logoUrlControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      logoUrlControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void avatarUrlSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      avatarUrlControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      avatarUrlControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void avatarFileSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      avatarFileControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      avatarFileControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void logoFileSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      logoFileControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      logoFileControl?.markAsEnabled(
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

  void layoutSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      layoutControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      layoutControl?.markAsEnabled(
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

  void departmentSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      departmentControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      departmentControl?.markAsEnabled(
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

  void headlineSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      headlineControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      headlineControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void createdAtSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      createdAtControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      createdAtControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void updatedAtSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      updatedAtControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      updatedAtControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void addedAtSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      addedAtControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      addedAtControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void customLinksSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      customLinksControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      customLinksControl.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  ExtendedControl<List<Map<String, Object?>?>, List<CustomLinkForm>>
      get customLinksExtendedControl =>
          ExtendedControl<List<Map<String, Object?>?>, List<CustomLinkForm>>(
              form.control(customLinksControlPath())
                  as FormArray<Map<String, Object?>>,
              () => customLinksCustomLinkForm);

  void addCustomLinksItem(CustomLink value) {
    customLinksControl.add(CustomLinkForm.formElements(value));
  }

  void removeCustomLinksItemAtIndex(int i) {
    if ((customLinksControl.value ?? []).length > i) {
      customLinksControl.removeAt(i);
    }
  }

  void addCustomLinksItemList(List<CustomLink> value) {
    value.map((e) => addCustomLinksItem(e));
  }

  @override
  DigitalCard get model {
    final currentForm = path == null ? form : form.control(path!);

    if (!currentForm.valid) {
      debugPrint(
          '[${path ?? 'DigitalCardForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
    }
    return DigitalCard(
        id: _idValue,
        userId: _userIdValue,
        uuid: _uuidValue,
        title: _titleValue,
        prefix: _prefixValue,
        firstName: _firstNameValue,
        middleName: _middleNameValue,
        lastName: _lastNameValue,
        suffix: _suffixValue,
        accreditations: _accreditationsValue,
        maidenName: _maidenNameValue,
        logoUrl: _logoUrlValue,
        avatarUrl: _avatarUrlValue,
        avatarFile: _avatarFileValue,
        logoFile: _logoFileValue,
        color: _colorValue,
        layout: _layoutValue,
        position: _positionValue,
        department: _departmentValue,
        company: _companyValue,
        headline: _headlineValue,
        customLinks: _customLinksValue,
        createdAt: _createdAtValue,
        updatedAt: _updatedAtValue,
        addedAt: _addedAtValue);
  }

  @override
  void submit({
    required void Function(DigitalCard model) onValid,
    void Function()? onNotValid,
  }) {
    form.markAllAsTouched();
    if (form.valid) {
      onValid(model);
    } else {
      onNotValid?.call();
    }
  }

  @override
  void updateValue(
    DigitalCard value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(DigitalCardForm.formElements(value).rawValue,
          updateParent: updateParent, emitEvent: emitEvent);

  @override
  void reset({
    DigitalCard? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: value != null ? formElements(value).rawValue : null,
          updateParent: updateParent,
          emitEvent: emitEvent);

  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");

  static FormGroup formElements(DigitalCard? digitalCard) => FormGroup({
        idControlName: FormControl<int>(
            value: digitalCard?.id,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        userIdControlName: FormControl<String>(
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
        accreditationsControlName: FormControl<String>(
            value: digitalCard?.accreditations,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        maidenNameControlName: FormControl<String>(
            value: digitalCard?.maidenName,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        logoUrlControlName: FormControl<String>(
            value: digitalCard?.logoUrl,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        avatarUrlControlName: FormControl<String>(
            value: digitalCard?.avatarUrl,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        avatarFileControlName: FormControl<Uint8List>(
            value: digitalCard?.avatarFile,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        logoFileControlName: FormControl<Uint8List>(
            value: digitalCard?.logoFile,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        colorControlName: FormControl<int>(
            value: digitalCard?.color,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        layoutControlName: FormControl<int>(
            value: digitalCard?.layout,
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
        departmentControlName: FormControl<String>(
            value: digitalCard?.department,
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
        headlineControlName: FormControl<String>(
            value: digitalCard?.headline,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        customLinksControlName: FormArray(
            (digitalCard?.customLinks ?? [])
                .map((e) => CustomLinkForm.formElements(e))
                .toList(),
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false),
        createdAtControlName: FormControl<DateTime>(
            value: digitalCard?.createdAt,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        updatedAtControlName: FormControl<DateTime>(
            value: digitalCard?.updatedAt,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        addedAtControlName: FormControl<DateTime>(
            value: digitalCard?.addedAt,
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

class CustomLinkForm implements FormModel<CustomLink> {
  CustomLinkForm(
    this.form,
    this.path,
  );

  static const String textControlName = "text";

  static const String labelControlName = "label";

  static const String typeControlName = "type";

  final FormGroup form;

  final String? path;

  String textControlPath() => pathBuilder(textControlName);

  String labelControlPath() => pathBuilder(labelControlName);

  String typeControlPath() => pathBuilder(typeControlName);

  String? get _textValue => textControl?.value;

  String? get _labelValue => labelControl?.value;

  String? get _typeValue => typeControl?.value;

  bool get containsText {
    try {
      form.control(textControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsLabel {
    try {
      form.control(labelControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsType {
    try {
      form.control(typeControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get textErrors => textControl?.errors;

  Object? get labelErrors => labelControl?.errors;

  Object? get typeErrors => typeControl?.errors;

  void get textFocus => form.focus(textControlPath());

  void get labelFocus => form.focus(labelControlPath());

  void get typeFocus => form.focus(typeControlPath());

  void textRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsText) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          textControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            textControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void labelRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsLabel) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          labelControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            labelControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void typeRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsType) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          typeControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            typeControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void textValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    textControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void labelValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    labelControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void typeValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    typeControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void textValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    textControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void labelValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    labelControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void typeValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    typeControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void textValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      textControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void labelValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      labelControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void typeValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      typeControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  FormControl<String>? get textControl => containsText
      ? form.control(textControlPath()) as FormControl<String>?
      : null;

  FormControl<String>? get labelControl => containsLabel
      ? form.control(labelControlPath()) as FormControl<String>?
      : null;

  FormControl<String>? get typeControl => containsType
      ? form.control(typeControlPath()) as FormControl<String>?
      : null;

  void textSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      textControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      textControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void labelSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      labelControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      labelControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void typeSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      typeControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      typeControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  CustomLink get model {
    final currentForm = path == null ? form : form.control(path!);

    if (!currentForm.valid) {
      debugPrint(
          '[${path ?? 'CustomLinkForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
    }
    return CustomLink(text: _textValue, label: _labelValue, type: _typeValue);
  }

  @override
  void submit({
    required void Function(CustomLink model) onValid,
    void Function()? onNotValid,
  }) {
    form.markAllAsTouched();
    if (form.valid) {
      onValid(model);
    } else {
      onNotValid?.call();
    }
  }

  @override
  void updateValue(
    CustomLink value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(CustomLinkForm.formElements(value).rawValue,
          updateParent: updateParent, emitEvent: emitEvent);

  @override
  void reset({
    CustomLink? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: value != null ? formElements(value).rawValue : null,
          updateParent: updateParent,
          emitEvent: emitEvent);

  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");

  static FormGroup formElements(CustomLink? customLink) => FormGroup({
        textControlName: FormControl<String>(
            value: customLink?.text,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        labelControlName: FormControl<String>(
            value: customLink?.label,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        typeControlName: FormControl<String>(
            value: customLink?.type,
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

class ReactiveDigitalCardFormFormGroupArrayBuilder<T> extends StatelessWidget {
  const ReactiveDigitalCardFormFormGroupArrayBuilder({
    Key? key,
    this.extended,
    this.getExtended,
    this.builder,
    required this.itemBuilder,
  })  : assert(extended != null || getExtended != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final ExtendedControl<List<Map<String, Object?>?>, List<T>>? extended;

  final ExtendedControl<List<Map<String, Object?>?>, List<T>> Function(
      DigitalCardForm formModel)? getExtended;

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

    final value = (extended ?? getExtended?.call(formModel))!;

    return StreamBuilder<List<Map<String, Object?>?>?>(
      stream: value.control.valueChanges,
      builder: (context, snapshot) {
        final itemList = (value.value() ?? <T>[])
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
