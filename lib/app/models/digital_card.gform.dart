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
    _formModel = DigitalCardForm(
        widget.model, DigitalCardForm.formElements(widget.model), null);

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant DigitalCardFormBuilder oldWidget) {
    if (widget.model != oldWidget.model) {
      _formModel = DigitalCardForm(
          widget.model, DigitalCardForm.formElements(widget.model), null);

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
    this.digitalCard,
    this.form,
    this.path,
  ) {
    fullnameForm =
        FullNameForm(digitalCard?.fullname, form, pathBuilder('fullname'));
    customLinksCustomLinkForm = (digitalCard?.customLinks ?? [])
        .asMap()
        .map((k, v) =>
            MapEntry(k, CustomLinkForm(v, form, pathBuilder("customLinks.$k"))))
        .values
        .toList();
  }

  static String idControlName = "id";

  static String userIdControlName = "userId";

  static String uuidControlName = "uuid";

  static String titleControlName = "title";

  static String logoImageControlName = "logoImage";

  static String profileImageControlName = "profileImage";

  static String colorControlName = "color";

  static String fullnameControlName = "fullname";

  static String positionControlName = "position";

  static String departmentControlName = "department";

  static String companyControlName = "company";

  static String headlineControlName = "headline";

  static String customLinksControlName = "customLinks";

  late FullNameForm fullnameForm;

  final DigitalCard? digitalCard;

  final FormGroup form;

  final String? path;

  late List<CustomLinkForm> customLinksCustomLinkForm;

  String idControlPath() => pathBuilder(idControlName);
  String userIdControlPath() => pathBuilder(userIdControlName);
  String uuidControlPath() => pathBuilder(uuidControlName);
  String titleControlPath() => pathBuilder(titleControlName);
  String logoImageControlPath() => pathBuilder(logoImageControlName);
  String profileImageControlPath() => pathBuilder(profileImageControlName);
  String colorControlPath() => pathBuilder(colorControlName);
  String positionControlPath() => pathBuilder(positionControlName);
  String departmentControlPath() => pathBuilder(departmentControlName);
  String companyControlPath() => pathBuilder(companyControlName);
  String headlineControlPath() => pathBuilder(headlineControlName);
  String fullnameControlPath() => pathBuilder(fullnameControlName);
  String customLinksControlPath() => pathBuilder(customLinksControlName);
  int? get _idValue => idControl?.value;
  int? get _userIdValue => userIdControl?.value;
  String? get _uuidValue => uuidControl?.value;
  String? get _titleValue => titleControl?.value;
  String? get _logoImageValue => logoImageControl?.value;
  String? get _profileImageValue => profileImageControl?.value;
  String? get _colorValue => colorControl?.value;
  String? get _positionValue => positionControl?.value;
  String? get _departmentValue => departmentControl?.value;
  String? get _companyValue => companyControl?.value;
  String? get _headlineValue => headlineControl?.value;
  FullName? get _fullnameValue => fullnameForm.model;
  List<CustomLink> get _customLinksValue => customLinksCustomLinkForm
      .asMap()
      .map(
        (k, v) => MapEntry(
          k,
          v
              .copyWithPath(
                pathBuilder("customLinks.$k"),
              )
              .model,
        ),
      )
      .values
      .toList();
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

  bool get containsProfileImage {
    try {
      form.control(profileImageControlPath());
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

  bool get containsFullname {
    try {
      form.control(fullnameControlPath());
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
  Object? get logoImageErrors => logoImageControl?.errors;
  Object? get profileImageErrors => profileImageControl?.errors;
  Object? get colorErrors => colorControl?.errors;
  Object? get positionErrors => positionControl?.errors;
  Object? get departmentErrors => departmentControl?.errors;
  Object? get companyErrors => companyControl?.errors;
  Object? get headlineErrors => headlineControl?.errors;
  Object? get fullnameErrors => fullnameControl?.errors;
  Object? get customLinksErrors => customLinksControl.errors;
  void get idFocus => form.focus(idControlPath());
  void get userIdFocus => form.focus(userIdControlPath());
  void get uuidFocus => form.focus(uuidControlPath());
  void get titleFocus => form.focus(titleControlPath());
  void get logoImageFocus => form.focus(logoImageControlPath());
  void get profileImageFocus => form.focus(profileImageControlPath());
  void get colorFocus => form.focus(colorControlPath());
  void get positionFocus => form.focus(positionControlPath());
  void get departmentFocus => form.focus(departmentControlPath());
  void get companyFocus => form.focus(companyControlPath());
  void get headlineFocus => form.focus(headlineControlPath());
  void get fullnameFocus => form.focus(fullnameControlPath());
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

  void fullnameRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsFullname) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          fullnameControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            fullnameControlName,
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

  void profileImageValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    profileImageControl?.updateValue(value,
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

  void fullnameValueUpdate(
    FullName? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    fullnameControl?.updateValue(FullNameForm.formElements(value).rawValue,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void customLinksValueUpdate(
    List<CustomLink> value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if ((value).isEmpty) {
      customLinksClear(updateParent: updateParent, emitEvent: emitEvent);

      return;
    }

    final updateList = (value)
        .asMap()
        .map(
          (k, v) => MapEntry(
            k,
            CustomLinkForm(v, form, pathBuilder("customLinks.$k")),
          ),
        )
        .values
        .toList();

    customLinksCustomLinkForm.clear();
    customLinksCustomLinkForm.addAll(updateList);

    final toUpdate = <CustomLinkForm>[];
    final toAdd = <CustomLinkForm>[];

    updateList.asMap().forEach((k, v) {
      if (customLinksCustomLinkForm.asMap().containsKey(k) &&
          (customLinksControl.value ?? []).asMap().containsKey(k)) {
        toUpdate.add(v);
      } else {
        toAdd.add(v);
      }
    });

    if (toUpdate.isNotEmpty) {
      customLinksControl.updateValue(
          toUpdate
              .map((e) => CustomLinkForm.formElements(e.customLink).rawValue)
              .toList(),
          updateParent: updateParent,
          emitEvent: emitEvent);
    }

    if (toAdd.isNotEmpty) {
      toAdd.forEach((e) {
        customLinksControl.add(CustomLinkForm.formElements(e.customLink),
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
    if (customLinksCustomLinkForm.length < i) {
      addCustomLinksItem(value);
      return;
    }

    final item = CustomLinkForm(
      value,
      form,
      pathBuilder('customLinks.$i'),
    );

    customLinksCustomLinkForm.insert(i, item);

    customLinksCustomLinkForm.asMap().forEach((k, v) {
      if (k > i) {
        customLinksCustomLinkForm[k] = v.copyWithPath(
          pathBuilder("customLinks.$k"),
        );
      }
    });

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

  void profileImageValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    profileImageControl?.patchValue(value,
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

  void fullnameValuePatch(
    FullName? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    fullnameControl?.updateValue(FullNameForm.formElements(value).rawValue,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void customLinksValuePatch(
    List<CustomLink> value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    final keys = customLinksCustomLinkForm.asMap().keys;

    final toPatch = <CustomLinkForm>[];
    (value).asMap().forEach(
      (k, v) {
        if (keys.contains(k)) {
          final patch = CustomLinkForm(v, form, pathBuilder("customLinks.$k"));
          customLinksCustomLinkForm[k] = patch;
          toPatch.add(patch);
        }
      },
    );

    customLinksControl.patchValue(
        toPatch
            .map((e) => CustomLinkForm.formElements(e.customLink).rawValue)
            .toList(),
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
  void profileImageValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      profileImageControl?.reset(
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
  void fullnameValueReset(
    FullName? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      fullnameControl?.reset(
          value: FullNameForm.formElements(value).rawValue,
          updateParent: updateParent,
          emitEvent: emitEvent);
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
  FormControl<String>? get profileImageControl => containsProfileImage
      ? form.control(profileImageControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get colorControl => containsColor
      ? form.control(colorControlPath()) as FormControl<String>?
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
  FormGroup? get fullnameControl => containsFullname
      ? form.control(fullnameControlPath()) as FormGroup?
      : null;
  FormArray<Map<String, Object?>> get customLinksControl =>
      form.control(customLinksControlPath()) as FormArray<Map<String, Object?>>;
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

  void fullnameSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      fullnameControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      fullnameControl?.markAsEnabled(
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
    final formClass = CustomLinkForm(value, form,
        pathBuilder('customLinks.${customLinksCustomLinkForm.length}'));

    customLinksCustomLinkForm.add(formClass);
    customLinksControl.add(CustomLinkForm.formElements(value));
  }

  void removeCustomLinksItemAtIndex(int i) {
    if (customLinksCustomLinkForm.asMap().containsKey(i) &&
        (customLinksControl.value ?? []).asMap().containsKey(i)) {
      customLinksCustomLinkForm.removeAt(i);

      customLinksCustomLinkForm.asMap().forEach((k, v) {
        customLinksCustomLinkForm[k] =
            v.copyWithPath(pathBuilder("customLinks.$k"));
      });

      customLinksControl.removeAt(i);
    }
  }

  void addCustomLinksItemList(List<CustomLink> value) {
    value.map((e) => addCustomLinksItem(e));
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
        profileImage: _profileImageValue,
        color: _colorValue,
        fullname: _fullnameValue,
        position: _positionValue,
        department: _departmentValue,
        company: _companyValue,
        headline: _headlineValue,
        customLinks: _customLinksValue,
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
        profileImageControlName: FormControl<String>(
            value: digitalCard?.profileImage,
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
        fullnameControlName: FullNameForm.formElements(digitalCard?.fullname)
      },
          validators: [],
          asyncValidators: [],
          asyncValidatorsDebounceTime: 250,
          disabled: false);
}

class FullNameForm implements FormModel<FullName> {
  FullNameForm(
    this.fullName,
    this.form,
    this.path,
  ) {}

  static String prefixControlName = "prefix";

  static String firstNameControlName = "firstName";

  static String middleNameControlName = "middleName";

  static String lastNameControlName = "lastName";

  static String suffixControlName = "suffix";

  static String accreditationsControlName = "accreditations";

  static String preferredNameControlName = "preferredName";

  static String maidenNameControlName = "maidenName";

  static String pronounsControlName = "pronouns";

  final FullName? fullName;

  final FormGroup form;

  final String? path;

  String prefixControlPath() => pathBuilder(prefixControlName);
  String firstNameControlPath() => pathBuilder(firstNameControlName);
  String middleNameControlPath() => pathBuilder(middleNameControlName);
  String lastNameControlPath() => pathBuilder(lastNameControlName);
  String suffixControlPath() => pathBuilder(suffixControlName);
  String accreditationsControlPath() => pathBuilder(accreditationsControlName);
  String preferredNameControlPath() => pathBuilder(preferredNameControlName);
  String maidenNameControlPath() => pathBuilder(maidenNameControlName);
  String pronounsControlPath() => pathBuilder(pronounsControlName);
  String? get _prefixValue => prefixControl?.value;
  String? get _firstNameValue => firstNameControl?.value;
  String? get _middleNameValue => middleNameControl?.value;
  String? get _lastNameValue => lastNameControl?.value;
  String? get _suffixValue => suffixControl?.value;
  String? get _accreditationsValue => accreditationsControl?.value;
  String? get _preferredNameValue => preferredNameControl?.value;
  String? get _maidenNameValue => maidenNameControl?.value;
  String? get _pronounsValue => pronounsControl?.value;
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

  bool get containsPreferredName {
    try {
      form.control(preferredNameControlPath());
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

  bool get containsPronouns {
    try {
      form.control(pronounsControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Object? get prefixErrors => prefixControl?.errors;
  Object? get firstNameErrors => firstNameControl?.errors;
  Object? get middleNameErrors => middleNameControl?.errors;
  Object? get lastNameErrors => lastNameControl?.errors;
  Object? get suffixErrors => suffixControl?.errors;
  Object? get accreditationsErrors => accreditationsControl?.errors;
  Object? get preferredNameErrors => preferredNameControl?.errors;
  Object? get maidenNameErrors => maidenNameControl?.errors;
  Object? get pronounsErrors => pronounsControl?.errors;
  void get prefixFocus => form.focus(prefixControlPath());
  void get firstNameFocus => form.focus(firstNameControlPath());
  void get middleNameFocus => form.focus(middleNameControlPath());
  void get lastNameFocus => form.focus(lastNameControlPath());
  void get suffixFocus => form.focus(suffixControlPath());
  void get accreditationsFocus => form.focus(accreditationsControlPath());
  void get preferredNameFocus => form.focus(preferredNameControlPath());
  void get maidenNameFocus => form.focus(maidenNameControlPath());
  void get pronounsFocus => form.focus(pronounsControlPath());
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

  void preferredNameRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsPreferredName) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          preferredNameControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            preferredNameControlName,
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

  void pronounsRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsPronouns) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          pronounsControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            pronounsControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
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

  void preferredNameValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    preferredNameControl?.updateValue(value,
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

  void pronounsValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    pronounsControl?.updateValue(value,
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

  void preferredNameValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    preferredNameControl?.patchValue(value,
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

  void pronounsValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    pronounsControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

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
  void preferredNameValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      preferredNameControl?.reset(
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
  void pronounsValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      pronounsControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
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
  FormControl<String>? get preferredNameControl => containsPreferredName
      ? form.control(preferredNameControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get maidenNameControl => containsMaidenName
      ? form.control(maidenNameControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get pronounsControl => containsPronouns
      ? form.control(pronounsControlPath()) as FormControl<String>?
      : null;
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

  void preferredNameSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      preferredNameControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      preferredNameControl?.markAsEnabled(
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

  void pronounsSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      pronounsControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      pronounsControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  FullName get model {
    if (!form.valid) {
      debugPrint(
        'Prefer not to call `model` on non-valid form it could cause unexpected exceptions in case you created a non-nullable field in model and expect it to be guarded by some kind of `required` validator.',
      );
    }
    return FullName(
        prefix: _prefixValue,
        firstName: _firstNameValue,
        middleName: _middleNameValue,
        lastName: _lastNameValue,
        suffix: _suffixValue,
        accreditations: _accreditationsValue,
        preferredName: _preferredNameValue,
        maidenName: _maidenNameValue,
        pronouns: _pronounsValue);
  }

  FullNameForm copyWithPath(String? path) {
    return FullNameForm(fullName, form, path);
  }

  @override
  void updateValue(
    FullName? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(FullNameForm.formElements(value).rawValue,
          updateParent: updateParent, emitEvent: emitEvent);
  @override
  void reset({
    FullName? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: value != null ? formElements(value).rawValue : null,
          updateParent: updateParent,
          emitEvent: emitEvent);
  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");
  static FormGroup formElements(FullName? fullName) => FormGroup({
        prefixControlName: FormControl<String>(
            value: fullName?.prefix,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        firstNameControlName: FormControl<String>(
            value: fullName?.firstName,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        middleNameControlName: FormControl<String>(
            value: fullName?.middleName,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        lastNameControlName: FormControl<String>(
            value: fullName?.lastName,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        suffixControlName: FormControl<String>(
            value: fullName?.suffix,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        accreditationsControlName: FormControl<String>(
            value: fullName?.accreditations,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        preferredNameControlName: FormControl<String>(
            value: fullName?.preferredName,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        maidenNameControlName: FormControl<String>(
            value: fullName?.maidenName,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        pronounsControlName: FormControl<String>(
            value: fullName?.pronouns,
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
    this.customLink,
    this.form,
    this.path,
  ) {}

  static String idControlName = "id";

  static String textControlName = "text";

  static String labelControlName = "label";

  static String typeControlName = "type";

  final CustomLink? customLink;

  final FormGroup form;

  final String? path;

  String idControlPath() => pathBuilder(idControlName);
  String textControlPath() => pathBuilder(textControlName);
  String labelControlPath() => pathBuilder(labelControlName);
  String typeControlPath() => pathBuilder(typeControlName);
  int? get _idValue => idControl?.value;
  String? get _textValue => textControl?.value;
  String? get _labelValue => labelControl?.value;
  String? get _typeValue => typeControl?.value;
  bool get containsId {
    try {
      form.control(idControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

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

  Object? get idErrors => idControl?.errors;
  Object? get textErrors => textControl?.errors;
  Object? get labelErrors => labelControl?.errors;
  Object? get typeErrors => typeControl?.errors;
  void get idFocus => form.focus(idControlPath());
  void get textFocus => form.focus(textControlPath());
  void get labelFocus => form.focus(labelControlPath());
  void get typeFocus => form.focus(typeControlPath());
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

  void idValueUpdate(
    int? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    idControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
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

  void idValuePatch(
    int? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    idControl?.patchValue(value,
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

  void idValueReset(
    int? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      idControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);
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
  FormControl<int>? get idControl =>
      containsId ? form.control(idControlPath()) as FormControl<int>? : null;
  FormControl<String>? get textControl => containsText
      ? form.control(textControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get labelControl => containsLabel
      ? form.control(labelControlPath()) as FormControl<String>?
      : null;
  FormControl<String>? get typeControl => containsType
      ? form.control(typeControlPath()) as FormControl<String>?
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
    if (!form.valid) {
      debugPrint(
        'Prefer not to call `model` on non-valid form it could cause unexpected exceptions in case you created a non-nullable field in model and expect it to be guarded by some kind of `required` validator.',
      );
    }
    return CustomLink(
        id: _idValue, text: _textValue, label: _labelValue, type: _typeValue);
  }

  CustomLinkForm copyWithPath(String? path) {
    return CustomLinkForm(customLink, form, path);
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
        idControlName: FormControl<int>(
            value: customLink?.id,
            validators: [],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        textControlName: FormControl<String>(
            value: customLink?.text,
            validators: [requiredValidator],
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
