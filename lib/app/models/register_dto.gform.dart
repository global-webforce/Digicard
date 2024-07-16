// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file:

part of 'register_dto.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveRegisterDtoFormConsumer extends StatelessWidget {
  const ReactiveRegisterDtoFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
      BuildContext context, RegisterDtoForm formModel, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveRegisterDtoForm.of(context);

    if (formModel is! RegisterDtoForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class RegisterDtoFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const RegisterDtoFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(
          stream,
          child,
          key: key,
        );

  final RegisterDtoForm form;
}

class ReactiveRegisterDtoForm extends StatelessWidget {
  const ReactiveRegisterDtoForm({
    Key? key,
    required this.form,
    required this.child,
    this.canPop,
    this.onPopInvoked,
  }) : super(key: key);

  final Widget child;

  final RegisterDtoForm form;

  final bool Function(FormGroup formGroup)? canPop;

  final void Function(FormGroup formGroup, bool didPop)? onPopInvoked;

  static RegisterDtoForm? of(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<
              RegisterDtoFormInheritedStreamer>()
          ?.form;
    }

    final element = context.getElementForInheritedWidgetOfExactType<
        RegisterDtoFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as RegisterDtoFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return RegisterDtoFormInheritedStreamer(
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

extension ReactiveReactiveRegisterDtoFormExt on BuildContext {
  RegisterDtoForm? registerDtoFormWatch() => ReactiveRegisterDtoForm.of(this);

  RegisterDtoForm? registerDtoFormRead() =>
      ReactiveRegisterDtoForm.of(this, listen: false);
}

class RegisterDtoFormBuilder extends StatefulWidget {
  const RegisterDtoFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.canPop,
    this.onPopInvoked,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final RegisterDto? model;

  final Widget? child;

  final bool Function(FormGroup formGroup)? canPop;

  final void Function(FormGroup formGroup, bool didPop)? onPopInvoked;

  final Widget Function(
      BuildContext context, RegisterDtoForm formModel, Widget? child) builder;

  final void Function(BuildContext context, RegisterDtoForm formModel)?
      initState;

  @override
  _RegisterDtoFormBuilderState createState() => _RegisterDtoFormBuilderState();
}

class _RegisterDtoFormBuilderState extends State<RegisterDtoFormBuilder> {
  late RegisterDtoForm _formModel;

  @override
  void initState() {
    _formModel =
        RegisterDtoForm(RegisterDtoForm.formElements(widget.model), null);

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant RegisterDtoFormBuilder oldWidget) {
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
    return ReactiveRegisterDtoForm(
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

class RegisterDtoForm implements FormModel<RegisterDto> {
  RegisterDtoForm(
    this.form,
    this.path,
  );

  static const String fullNameControlName = "fullName";

  static const String emailControlName = "email";

  static const String passwordControlName = "password";

  static const String passwordConfirmationControlName = "passwordConfirmation";

  static const String acceptLicenseControlName = "acceptLicense";

  final FormGroup form;

  final String? path;

  final Map<String, bool> _disabled = {};

  String fullNameControlPath() => pathBuilder(fullNameControlName);

  String emailControlPath() => pathBuilder(emailControlName);

  String passwordControlPath() => pathBuilder(passwordControlName);

  String passwordConfirmationControlPath() =>
      pathBuilder(passwordConfirmationControlName);

  String acceptLicenseControlPath() => pathBuilder(acceptLicenseControlName);

  String? get _fullNameValue => fullNameControl?.value;

  String? get _emailValue => emailControl?.value;

  String? get _passwordValue => passwordControl?.value;

  String? get _passwordConfirmationValue => passwordConfirmationControl?.value;

  bool? get _acceptLicenseValue => acceptLicenseControl?.value;

  bool get containsFullName {
    try {
      form.control(fullNameControlPath());
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

  bool get containsPassword {
    try {
      form.control(passwordControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsPasswordConfirmation {
    try {
      form.control(passwordConfirmationControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  bool get containsAcceptLicense {
    try {
      form.control(acceptLicenseControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Map<String, Object>? get fullNameErrors => fullNameControl?.errors;

  Map<String, Object>? get emailErrors => emailControl?.errors;

  Map<String, Object>? get passwordErrors => passwordControl?.errors;

  Map<String, Object>? get passwordConfirmationErrors =>
      passwordConfirmationControl?.errors;

  Map<String, Object>? get acceptLicenseErrors => acceptLicenseControl?.errors;

  void get fullNameFocus => form.focus(fullNameControlPath());

  void get emailFocus => form.focus(emailControlPath());

  void get passwordFocus => form.focus(passwordControlPath());

  void get passwordConfirmationFocus =>
      form.focus(passwordConfirmationControlPath());

  void get acceptLicenseFocus => form.focus(acceptLicenseControlPath());

  void fullNameRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsFullName) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          fullNameControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            fullNameControlName,
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

  void passwordRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsPassword) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          passwordControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            passwordControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void passwordConfirmationRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsPasswordConfirmation) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          passwordConfirmationControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            passwordConfirmationControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void acceptLicenseRemove({
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (containsAcceptLicense) {
      final controlPath = path;
      if (controlPath == null) {
        form.removeControl(
          acceptLicenseControlName,
          updateParent: updateParent,
          emitEvent: emitEvent,
        );
      } else {
        final formGroup = form.control(controlPath);

        if (formGroup is FormGroup) {
          formGroup.removeControl(
            acceptLicenseControlName,
            updateParent: updateParent,
            emitEvent: emitEvent,
          );
        }
      }
    }
  }

  void fullNameValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    fullNameControl?.updateValue(value,
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

  void passwordValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    passwordControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void passwordConfirmationValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    passwordConfirmationControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void acceptLicenseValueUpdate(
    bool? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    acceptLicenseControl?.updateValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void fullNameValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    fullNameControl?.patchValue(value,
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

  void passwordValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    passwordControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void passwordConfirmationValuePatch(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    passwordConfirmationControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void acceptLicenseValuePatch(
    bool? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    acceptLicenseControl?.patchValue(value,
        updateParent: updateParent, emitEvent: emitEvent);
  }

  void fullNameValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      fullNameControl?.reset(
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

  void passwordValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      passwordControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void passwordConfirmationValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      passwordConfirmationControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  void acceptLicenseValueReset(
    bool? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      acceptLicenseControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  FormControl<String>? get fullNameControl => containsFullName
      ? form.control(fullNameControlPath()) as FormControl<String>?
      : null;

  FormControl<String>? get emailControl => containsEmail
      ? form.control(emailControlPath()) as FormControl<String>?
      : null;

  FormControl<String>? get passwordControl => containsPassword
      ? form.control(passwordControlPath()) as FormControl<String>?
      : null;

  FormControl<String>? get passwordConfirmationControl =>
      containsPasswordConfirmation
          ? form.control(passwordConfirmationControlPath())
              as FormControl<String>?
          : null;

  FormControl<bool>? get acceptLicenseControl => containsAcceptLicense
      ? form.control(acceptLicenseControlPath()) as FormControl<bool>?
      : null;

  void fullNameSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      fullNameControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      fullNameControl?.markAsEnabled(
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

  void passwordSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      passwordControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      passwordControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void passwordConfirmationSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      passwordConfirmationControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      passwordConfirmationControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  void acceptLicenseSetDisabled(
    bool disabled, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    if (disabled) {
      acceptLicenseControl?.markAsDisabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    } else {
      acceptLicenseControl?.markAsEnabled(
        updateParent: updateParent,
        emitEvent: emitEvent,
      );
    }
  }

  @override
  RegisterDto get model {
    final isValid = !currentForm.hasErrors && currentForm.errors.isEmpty;

    if (!isValid) {
      debugPrintStack(
          label:
              '[${path ?? 'RegisterDtoForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
    }
    return RegisterDto(
        fullName: _fullNameValue,
        email: _emailValue,
        password: _passwordValue,
        passwordConfirmation: _passwordConfirmationValue,
        acceptLicense: _acceptLicenseValue);
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
    required void Function(RegisterDto model) onValid,
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
    RegisterDto? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(RegisterDtoForm.formElements(value).rawValue,
          updateParent: updateParent, emitEvent: emitEvent);

  @override
  void reset({
    RegisterDto? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: value != null ? formElements(value).rawValue : null,
          updateParent: updateParent,
          emitEvent: emitEvent);

  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");

  static FormGroup formElements(RegisterDto? registerDto) => FormGroup({
        fullNameControlName: FormControl<String>(
            value: registerDto?.fullName,
            validators: [RequiredValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        emailControlName: FormControl<String>(
            value: registerDto?.email,
            validators: [RequiredValidator(), EmailValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        passwordControlName: FormControl<String>(
            value: registerDto?.password,
            validators: [RequiredValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        passwordConfirmationControlName: FormControl<String>(
            value: registerDto?.passwordConfirmation,
            validators: [
              RequiredValidator(),
              MustMatchValidatorCustom('password', 'passwordConfirmation', true)
            ],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        acceptLicenseControlName: FormControl<bool>(
            value: registerDto?.acceptLicense,
            validators: [RequiredTrueValidator()],
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

class ReactiveRegisterDtoFormArrayBuilder<ReactiveRegisterDtoFormArrayBuilderT>
    extends StatelessWidget {
  const ReactiveRegisterDtoFormArrayBuilder({
    Key? key,
    this.control,
    this.formControl,
    this.builder,
    required this.itemBuilder,
  })  : assert(control != null || formControl != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final FormArray<ReactiveRegisterDtoFormArrayBuilderT>? formControl;

  final FormArray<ReactiveRegisterDtoFormArrayBuilderT>? Function(
      RegisterDtoForm formModel)? control;

  final Widget Function(BuildContext context, List<Widget> itemList,
      RegisterDtoForm formModel)? builder;

  final Widget Function(
      BuildContext context,
      int i,
      ReactiveRegisterDtoFormArrayBuilderT? item,
      RegisterDtoForm formModel) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveRegisterDtoForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    return ReactiveFormArray<ReactiveRegisterDtoFormArrayBuilderT>(
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

class ReactiveRegisterDtoFormFormGroupArrayBuilder<
    ReactiveRegisterDtoFormFormGroupArrayBuilderT> extends StatelessWidget {
  const ReactiveRegisterDtoFormFormGroupArrayBuilder({
    Key? key,
    this.extended,
    this.getExtended,
    this.builder,
    required this.itemBuilder,
  })  : assert(extended != null || getExtended != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final ExtendedControl<List<Map<String, Object?>?>,
      List<ReactiveRegisterDtoFormFormGroupArrayBuilderT>>? extended;

  final ExtendedControl<List<Map<String, Object?>?>,
          List<ReactiveRegisterDtoFormFormGroupArrayBuilderT>>
      Function(RegisterDtoForm formModel)? getExtended;

  final Widget Function(BuildContext context, List<Widget> itemList,
      RegisterDtoForm formModel)? builder;

  final Widget Function(
      BuildContext context,
      int i,
      ReactiveRegisterDtoFormFormGroupArrayBuilderT? item,
      RegisterDtoForm formModel) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveRegisterDtoForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final value = (extended ?? getExtended?.call(formModel))!;

    return StreamBuilder<List<Map<String, Object?>?>?>(
      stream: value.control.valueChanges,
      builder: (context, snapshot) {
        final itemList =
            (value.value() ?? <ReactiveRegisterDtoFormFormGroupArrayBuilderT>[])
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
