// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file:

part of 'digital_card_dto.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveDigitalCardDTOFormConsumer extends StatelessWidget {
  const ReactiveDigitalCardDTOFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
          BuildContext context, DigitalCardDTOForm formModel, Widget? child)
      builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveDigitalCardDTOForm.of(context);

    if (formModel is! DigitalCardDTOForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class DigitalCardDTOFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const DigitalCardDTOFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(
          stream,
          child,
          key: key,
        );

  final DigitalCardDTOForm form;
}

class ReactiveDigitalCardDTOForm extends StatelessWidget {
  const ReactiveDigitalCardDTOForm({
    Key? key,
    required this.form,
    required this.child,
    this.canPop,
    this.onPopInvoked,
  }) : super(key: key);

  final Widget child;

  final DigitalCardDTOForm form;

  final bool Function(FormGroup formGroup)? canPop;

  final void Function(FormGroup formGroup, bool didPop)? onPopInvoked;

  static DigitalCardDTOForm? of(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<
              DigitalCardDTOFormInheritedStreamer>()
          ?.form;
    }

    final element = context.getElementForInheritedWidgetOfExactType<
        DigitalCardDTOFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as DigitalCardDTOFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return DigitalCardDTOFormInheritedStreamer(
      form: form,
      stream: form.form.statusChanged,
      child: ReactiveFormPopScope(
        canPop: canPop,
        onPopInvoked: onPopInvoked,
        child: child,
      ),
    );
  }
}

extension ReactiveReactiveDigitalCardDTOFormExt on BuildContext {
  DigitalCardDTOForm? digitalCardDTOFormWatch() =>
      ReactiveDigitalCardDTOForm.of(this);

  DigitalCardDTOForm? digitalCardDTOFormRead() =>
      ReactiveDigitalCardDTOForm.of(this, listen: false);
}

class DigitalCardDTOFormBuilder extends StatefulWidget {
  const DigitalCardDTOFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.canPop,
    this.onPopInvoked,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final DigitalCardDTO? model;

  final Widget? child;

  final bool Function(FormGroup formGroup)? canPop;

  final void Function(FormGroup formGroup, bool didPop)? onPopInvoked;

  final Widget Function(
          BuildContext context, DigitalCardDTOForm formModel, Widget? child)
      builder;

  final void Function(BuildContext context, DigitalCardDTOForm formModel)?
      initState;

  @override
  _DigitalCardDTOFormBuilderState createState() =>
      _DigitalCardDTOFormBuilderState();
}

class _DigitalCardDTOFormBuilderState extends State<DigitalCardDTOFormBuilder> {
  late DigitalCardDTOForm _formModel;

  @override
  void initState() {
    _formModel =
        DigitalCardDTOForm(DigitalCardDTOForm.formElements(widget.model), null);

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant DigitalCardDTOFormBuilder oldWidget) {
    if (widget.model != oldWidget.model) {
      _formModel.updateValue(widget.model);
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
    return ReactiveDigitalCardDTOForm(
      key: ObjectKey(_formModel),
      form: _formModel,
      // canPop: widget.canPop,
      // onPopInvoked: widget.onPopInvoked,
      child: ReactiveFormBuilder(
        form: () => _formModel.form,
        canPop: widget.canPop,
        onPopInvoked: widget.onPopInvoked,
        builder: (context, formGroup, child) =>
            widget.builder(context, _formModel, widget.child),
        child: widget.child,
      ),
    );
  }
}

class DigitalCardDTOForm implements FormModel<DigitalCardDTO> {
  DigitalCardDTOForm(
    this.form,
    this.path,
  );

  static const String idControlName = "id";

  static const String userIdControlName = "userId";

  static const String uuidControlName = "uuid";

  static const String logoUrlControlName = "logoUrl";

  static const String avatarUrlControlName = "avatarUrl";

  static const String titleControlName = "title";

  static const String firstNameControlName = "firstName";

  static const String prefixControlName = "prefix";

  static const String middleNameControlName = "middleName";

  static const String lastNameControlName = "lastName";

  static const String suffixControlName = "suffix";

  static const String avatarFileControlName = "avatarFile";

  static const String logoFileControlName = "logoFile";

  static const String colorControlName = "color";

  static const String layoutControlName = "layout";

  static const String positionControlName = "position";

  static const String companyControlName = "company";

  static const String headlineControlName = "headline";

  static const String customLinksControlName = "customLinks";

  static const String createdAtControlName = "createdAt";

  static const String updatedAtControlName = "updatedAt";

  static const String addedToContactsAtControlName = "addedToContactsAt";

  final FormGroup form;

  final String? path;

  final Map<String, bool> _disabled = {};

  String idControlPath() => pathBuilder(idControlName);

  String userIdControlPath() => pathBuilder(userIdControlName);

  String uuidControlPath() => pathBuilder(uuidControlName);

  String logoUrlControlPath() => pathBuilder(logoUrlControlName);

  String avatarUrlControlPath() => pathBuilder(avatarUrlControlName);

  String titleControlPath() => pathBuilder(titleControlName);

  String firstNameControlPath() => pathBuilder(firstNameControlName);

  String prefixControlPath() => pathBuilder(prefixControlName);

  String middleNameControlPath() => pathBuilder(middleNameControlName);

  String lastNameControlPath() => pathBuilder(lastNameControlName);

  String suffixControlPath() => pathBuilder(suffixControlName);

  String avatarFileControlPath() => pathBuilder(avatarFileControlName);

  String logoFileControlPath() => pathBuilder(logoFileControlName);

  String colorControlPath() => pathBuilder(colorControlName);

  String layoutControlPath() => pathBuilder(layoutControlName);

  String positionControlPath() => pathBuilder(positionControlName);

  String companyControlPath() => pathBuilder(companyControlName);

  String headlineControlPath() => pathBuilder(headlineControlName);

  String customLinksControlPath() => pathBuilder(customLinksControlName);

  String createdAtControlPath() => pathBuilder(createdAtControlName);

  String updatedAtControlPath() => pathBuilder(updatedAtControlName);

  String addedToContactsAtControlPath() =>
      pathBuilder(addedToContactsAtControlName);

  int? get _idValue => idControl?.value;

  String? get _userIdValue => userIdControl?.value;

  String? get _uuidValue => uuidControl?.value;

  String? get _logoUrlValue => logoUrlControl?.value;

  String? get _avatarUrlValue => avatarUrlControl?.value;

  String? get _titleValue => titleControl?.value;

  String? get _firstNameValue => firstNameControl?.value;

  String? get _prefixValue => prefixControl?.value;

  String? get _middleNameValue => middleNameControl?.value;

  String? get _lastNameValue => lastNameControl?.value;

  String? get _suffixValue => suffixControl?.value;

  dynamic get _avatarFileValue => avatarFileControl.value as dynamic;

  dynamic get _logoFileValue => logoFileControl.value as dynamic;

  Color? get _colorValue => colorControl?.value;

  int? get _layoutValue => layoutControl?.value;

  String? get _positionValue => positionControl?.value;

  String? get _companyValue => companyControl?.value;

  String? get _headlineValue => headlineControl?.value;

  List<Map<String, dynamic>>? get _customLinksValue =>
      customLinksControl?.value;

  DateTime? get _createdAtValue => createdAtControl?.value;

  DateTime? get _updatedAtValue => updatedAtControl?.value;

  DateTime? get _addedToContactsAtValue => addedToContactsAtControl?.value;

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

  bool get containsTitle {
    try {
      form.control(titleControlPath());
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

  bool get containsPrefix {
    try {
      form.control(prefixControlPath());
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

  bool get containsCustomLinks {
    try {
      form.control(customLinksControlPath());
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

  bool get containsAddedToContactsAt {
    try {
      form.control(addedToContactsAtControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Map<String, Object>? get idErrors => idControl?.errors;

  Map<String, Object>? get userIdErrors => userIdControl?.errors;

  Map<String, Object>? get uuidErrors => uuidControl?.errors;

  Map<String, Object>? get logoUrlErrors => logoUrlControl?.errors;

  Map<String, Object>? get avatarUrlErrors => avatarUrlControl?.errors;

  Map<String, Object>? get titleErrors => titleControl?.errors;

  Map<String, Object>? get firstNameErrors => firstNameControl?.errors;

  Map<String, Object>? get prefixErrors => prefixControl?.errors;

  Map<String, Object>? get middleNameErrors => middleNameControl?.errors;

  Map<String, Object>? get lastNameErrors => lastNameControl?.errors;

  Map<String, Object>? get suffixErrors => suffixControl?.errors;

  Map<String, Object> get avatarFileErrors => avatarFileControl.errors;

  Map<String, Object> get logoFileErrors => logoFileControl.errors;

  Map<String, Object>? get colorErrors => colorControl?.errors;

  Map<String, Object>? get layoutErrors => layoutControl?.errors;

  Map<String, Object>? get positionErrors => positionControl?.errors;

  Map<String, Object>? get companyErrors => companyControl?.errors;

  Map<String, Object>? get headlineErrors => headlineControl?.errors;

  Map<String, Object>? get customLinksErrors => customLinksControl?.errors;

  Map<String, Object>? get createdAtErrors => createdAtControl?.errors;

  Map<String, Object>? get updatedAtErrors => updatedAtControl?.errors;

  Map<String, Object>? get addedToContactsAtErrors =>
      addedToContactsAtControl?.errors;

  void get idFocus => form.focus(idControlPath());

  void get userIdFocus => form.focus(userIdControlPath());

  void get uuidFocus => form.focus(uuidControlPath());

  void get logoUrlFocus => form.focus(logoUrlControlPath());

  void get avatarUrlFocus => form.focus(avatarUrlControlPath());

  void get titleFocus => form.focus(titleControlPath());

  void get firstNameFocus => form.focus(firstNameControlPath());

  void get prefixFocus => form.focus(prefixControlPath());

  void get middleNameFocus => form.focus(middleNameControlPath());

  void get lastNameFocus => form.focus(lastNameControlPath());

  void get suffixFocus => form.focus(suffixControlPath());

  void get avatarFileFocus => form.focus(avatarFileControlPath());

  void get logoFileFocus => form.focus(logoFileControlPath());

  void get colorFocus => form.focus(colorControlPath());

  void get layoutFocus => form.focus(layoutControlPath());

  void get positionFocus => form.focus(positionControlPath());

  void get companyFocus => form.focus(companyControlPath());

  void get headlineFocus => form.focus(headlineControlPath());

  void get customLinksFocus => form.focus(customLinksControlPath());

  void get createdAtFocus => form.focus(createdAtControlPath());

  void get updatedAtFocus => form.focus(updatedAtControlPath());

  void get addedToContactsAtFocus => form.focus(addedToContactsAtControlPath());

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

  void customLinksRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsCustomLinks) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          customLinksControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            customLinksControlName,
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

  void addedToContactsAtRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsAddedToContactsAt) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          addedToContactsAtControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            addedToContactsAtControlName,
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

  void titleValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    titleControl?.updateValue(value,
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

  void prefixValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    prefixControl?.updateValue(value,
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

  void avatarFileValueUpdate(
    dynamic value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    avatarFileControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void logoFileValueUpdate(
    dynamic value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    logoFileControl.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void colorValueUpdate(
    Color? value, {
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

  void customLinksValueUpdate(
    List<Map<String, dynamic>>? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    customLinksControl?.updateValue(value,
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

  void addedToContactsAtValueUpdate(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    addedToContactsAtControl?.updateValue(value,
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

  void titleValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    titleControl?.patchValue(value,
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

  void prefixValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    prefixControl?.patchValue(value,
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

  void avatarFileValuePatch(
    dynamic value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    avatarFileControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void logoFileValuePatch(
    dynamic value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    logoFileControl.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void colorValuePatch(
    Color? value, {
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

  void customLinksValuePatch(
    List<Map<String, dynamic>>? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    customLinksControl?.patchValue(value,
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

  void addedToContactsAtValuePatch(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    addedToContactsAtControl?.patchValue(value,
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

  void titleValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      titleControl?.reset(
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

  void prefixValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      prefixControl?.reset(
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

  void avatarFileValueReset(
    dynamic value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      avatarFileControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void logoFileValueReset(
    dynamic value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      logoFileControl.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void colorValueReset(
    Color? value, {
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

  void customLinksValueReset(
    List<Map<String, dynamic>>? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      customLinksControl?.reset(
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

  void addedToContactsAtValueReset(
    DateTime? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      addedToContactsAtControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  FormControl<int>? get idControl =>
      containsId ? form.control(idControlPath()) as FormControl<int>? : null;

  FormControl<String>? get userIdControl => containsUserId
      ? form.control(userIdControlPath()) as FormControl<String>?
      : null;

  FormControl<String>? get uuidControl => containsUuid
      ? form.control(uuidControlPath()) as FormControl<String>?
      : null;

  FormControl<String>? get logoUrlControl => containsLogoUrl
      ? form.control(logoUrlControlPath()) as FormControl<String>?
      : null;

  FormControl<String>? get avatarUrlControl => containsAvatarUrl
      ? form.control(avatarUrlControlPath()) as FormControl<String>?
      : null;

  FormControl<String>? get titleControl => containsTitle
      ? form.control(titleControlPath()) as FormControl<String>?
      : null;

  FormControl<String>? get firstNameControl => containsFirstName
      ? form.control(firstNameControlPath()) as FormControl<String>?
      : null;

  FormControl<String>? get prefixControl => containsPrefix
      ? form.control(prefixControlPath()) as FormControl<String>?
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

  FormControl<dynamic> get avatarFileControl =>
      form.control(avatarFileControlPath()) as FormControl<dynamic>;

  FormControl<dynamic> get logoFileControl =>
      form.control(logoFileControlPath()) as FormControl<dynamic>;

  FormControl<Color>? get colorControl => containsColor
      ? form.control(colorControlPath()) as FormControl<Color>?
      : null;

  FormControl<int>? get layoutControl => containsLayout
      ? form.control(layoutControlPath()) as FormControl<int>?
      : null;

  FormControl<String>? get positionControl => containsPosition
      ? form.control(positionControlPath()) as FormControl<String>?
      : null;

  FormControl<String>? get companyControl => containsCompany
      ? form.control(companyControlPath()) as FormControl<String>?
      : null;

  FormControl<String>? get headlineControl => containsHeadline
      ? form.control(headlineControlPath()) as FormControl<String>?
      : null;

  FormControl<List<Map<String, dynamic>>>? get customLinksControl =>
      containsCustomLinks
          ? form.control(customLinksControlPath())
              as FormControl<List<Map<String, dynamic>>>?
          : null;

  FormControl<DateTime>? get createdAtControl => containsCreatedAt
      ? form.control(createdAtControlPath()) as FormControl<DateTime>?
      : null;

  FormControl<DateTime>? get updatedAtControl => containsUpdatedAt
      ? form.control(updatedAtControlPath()) as FormControl<DateTime>?
      : null;

  FormControl<DateTime>?
      get addedToContactsAtControl => containsAddedToContactsAt
          ? form.control(addedToContactsAtControlPath())
              as FormControl<DateTime>?
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

  void avatarFileSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      avatarFileControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      avatarFileControl.markAsEnabled(
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
      logoFileControl.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      logoFileControl.markAsEnabled(
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

  void customLinksSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      customLinksControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      customLinksControl?.markAsEnabled(
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

  void addedToContactsAtSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      addedToContactsAtControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      addedToContactsAtControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  DigitalCardDTO get model {
    final isValid = !currentForm.hasErrors && currentForm.errors.isEmpty;

    if (!isValid) {
      debugPrintStack(
          label:
              '[${path ?? 'DigitalCardDTOForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
    }
    return DigitalCardDTO(
        id: _idValue,
        userId: _userIdValue,
        uuid: _uuidValue,
        logoUrl: _logoUrlValue,
        avatarUrl: _avatarUrlValue,
        title: _titleValue,
        firstName: _firstNameValue,
        prefix: _prefixValue,
        middleName: _middleNameValue,
        lastName: _lastNameValue,
        suffix: _suffixValue,
        avatarFile: _avatarFileValue,
        logoFile: _logoFileValue,
        color: _colorValue,
        layout: _layoutValue,
        position: _positionValue,
        company: _companyValue,
        headline: _headlineValue,
        customLinks: _customLinksValue,
        createdAt: _createdAtValue,
        updatedAt: _updatedAtValue,
        addedToContactsAt: _addedToContactsAtValue);
  }

  @override
  void toggleDisabled({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final currentFormInstance = currentForm;

    if (currentFormInstance is! FormGroup) {
      return;
    }

    if (_disabled.isEmpty) {
      currentFormInstance.controls.forEach((key, control) {
        _disabled[key] = control.disabled;
      });

      currentForm.markAsDisabled(
          updateParent: updateParent, emitEvent: emitEvent);
    } else {
      currentFormInstance.controls.forEach((key, control) {
        if (_disabled[key] == false) {
          currentFormInstance.controls[key]?.markAsEnabled(
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }

        _disabled.remove(key);
      });
    }
  }

  @override
  void submit({
    required void Function(DigitalCardDTO model) onValid,
    void Function()? onNotValid,
  }) {
    currentForm.markAllAsTouched();
    if (currentForm.valid) {
      onValid(model);
    } else {
      onNotValid?.call();
    }
  }

  AbstractControl<dynamic> get currentForm {
    return path == null ? form : form.control(path!);
  }

  @override
  void updateValue(
    DigitalCardDTO? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(DigitalCardDTOForm.formElements(value).rawValue,
          updateParent: updateParent, emitEvent: emitEvent);

  @override
  void reset({
    DigitalCardDTO? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: value != null ? formElements(value).rawValue : null,
          updateParent: updateParent,
          emitEvent: emitEvent);

  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");

  static FormGroup formElements(DigitalCardDTO? digitalCardDTO) => FormGroup({
        idControlName: FormControl<int>(
            value: digitalCardDTO?.id,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        userIdControlName: FormControl<String>(
            value: digitalCardDTO?.userId,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        uuidControlName: FormControl<String>(
            value: digitalCardDTO?.uuid,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        logoUrlControlName: FormControl<String>(
            value: digitalCardDTO?.logoUrl,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        avatarUrlControlName: FormControl<String>(
            value: digitalCardDTO?.avatarUrl,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        titleControlName: FormControl<String>(
            value: digitalCardDTO?.title,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        firstNameControlName: FormControl<String>(
            value: digitalCardDTO?.firstName,
            validators: [RequiredValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        prefixControlName: FormControl<String>(
            value: digitalCardDTO?.prefix,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        middleNameControlName: FormControl<String>(
            value: digitalCardDTO?.middleName,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        lastNameControlName: FormControl<String>(
            value: digitalCardDTO?.lastName,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        suffixControlName: FormControl<String>(
            value: digitalCardDTO?.suffix,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        avatarFileControlName: FormControl<dynamic>(
            value: digitalCardDTO?.avatarFile,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        logoFileControlName: FormControl<dynamic>(
            value: digitalCardDTO?.logoFile,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        colorControlName: FormControl<Color>(
            value: digitalCardDTO?.color,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        layoutControlName: FormControl<int>(
            value: digitalCardDTO?.layout,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        positionControlName: FormControl<String>(
            value: digitalCardDTO?.position,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        companyControlName: FormControl<String>(
            value: digitalCardDTO?.company,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        headlineControlName: FormControl<String>(
            value: digitalCardDTO?.headline,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        customLinksControlName: FormControl<List<Map<String, dynamic>>>(
            value: digitalCardDTO?.customLinks,
            validators: [NotEmptyValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        createdAtControlName: FormControl<DateTime>(
            value: digitalCardDTO?.createdAt,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        updatedAtControlName: FormControl<DateTime>(
            value: digitalCardDTO?.updatedAt,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        addedToContactsAtControlName: FormControl<DateTime>(
            value: digitalCardDTO?.addedToContactsAt,
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

class ReactiveDigitalCardDTOFormArrayBuilder<
    ReactiveDigitalCardDTOFormArrayBuilderT> extends StatelessWidget {
  const ReactiveDigitalCardDTOFormArrayBuilder({
    Key? key,
    this.control,
    this.formControl,
    this.builder,
    required this.itemBuilder,
  })  : assert(control != null || formControl != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final FormArray<ReactiveDigitalCardDTOFormArrayBuilderT>? formControl;

  final FormArray<ReactiveDigitalCardDTOFormArrayBuilderT>? Function(
      DigitalCardDTOForm formModel)? control;

  final Widget Function(BuildContext context, List<Widget> itemList,
      DigitalCardDTOForm formModel)? builder;

  final Widget Function(
      BuildContext context,
      int i,
      ReactiveDigitalCardDTOFormArrayBuilderT? item,
      DigitalCardDTOForm formModel) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveDigitalCardDTOForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    return ReactiveFormArray<ReactiveDigitalCardDTOFormArrayBuilderT>(
      formArray: formControl ?? control?.call(formModel),
      builder: (context, formArray, child) {
        final values = formArray.controls.map((e) => e.value).toList();
        final itemList = values
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

class ReactiveDigitalCardDTOFormFormGroupArrayBuilder<
    ReactiveDigitalCardDTOFormFormGroupArrayBuilderT> extends StatelessWidget {
  const ReactiveDigitalCardDTOFormFormGroupArrayBuilder({
    Key? key,
    this.extended,
    this.getExtended,
    this.builder,
    required this.itemBuilder,
  })  : assert(extended != null || getExtended != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final ExtendedControl<List<Map<String, Object?>?>,
      List<ReactiveDigitalCardDTOFormFormGroupArrayBuilderT>>? extended;

  final ExtendedControl<List<Map<String, Object?>?>,
          List<ReactiveDigitalCardDTOFormFormGroupArrayBuilderT>>
      Function(DigitalCardDTOForm formModel)? getExtended;

  final Widget Function(BuildContext context, List<Widget> itemList,
      DigitalCardDTOForm formModel)? builder;

  final Widget Function(
      BuildContext context,
      int i,
      ReactiveDigitalCardDTOFormFormGroupArrayBuilderT? item,
      DigitalCardDTOForm formModel) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveDigitalCardDTOForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final value = (extended ?? getExtended?.call(formModel))!;

    return StreamBuilder<List<Map<String, Object?>?>?>(
      stream: value.control.valueChanges,
      builder: (context, snapshot) {
        final itemList = (value.value() ??
                <ReactiveDigitalCardDTOFormFormGroupArrayBuilderT>[])
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
