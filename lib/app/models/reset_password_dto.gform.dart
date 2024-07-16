// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file:

part of 'reset_password_dto.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveResetPasswordDtoFormConsumer extends StatelessWidget {
  const ReactiveResetPasswordDtoFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
          BuildContext context, ResetPasswordDtoForm formModel, Widget? child)
      builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveResetPasswordDtoForm.of(context);

    if (formModel is! ResetPasswordDtoForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class ResetPasswordDtoFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const ResetPasswordDtoFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(
          stream,
          child,
          key: key,
        );

  final ResetPasswordDtoForm form;
}

class ReactiveResetPasswordDtoForm extends StatelessWidget {
  const ReactiveResetPasswordDtoForm({
    Key? key,
    required this.form,
    required this.child,
    this.canPop,
    this.onPopInvoked,
  }) : super(key: key);

  final Widget child;

  final ResetPasswordDtoForm form;

  final bool Function(FormGroup formGroup)? canPop;

  final void Function(FormGroup formGroup, bool didPop)? onPopInvoked;

  static ResetPasswordDtoForm? of(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<
              ResetPasswordDtoFormInheritedStreamer>()
          ?.form;
    }

    final element = context.getElementForInheritedWidgetOfExactType<
        ResetPasswordDtoFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as ResetPasswordDtoFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return ResetPasswordDtoFormInheritedStreamer(
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

extension ReactiveReactiveResetPasswordDtoFormExt on BuildContext {
  ResetPasswordDtoForm? resetPasswordDtoFormWatch() =>
      ReactiveResetPasswordDtoForm.of(this);

  ResetPasswordDtoForm? resetPasswordDtoFormRead() =>
      ReactiveResetPasswordDtoForm.of(this, listen: false);
}

class ResetPasswordDtoFormBuilder extends StatefulWidget {
  const ResetPasswordDtoFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.canPop,
    this.onPopInvoked,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final ResetPasswordDto? model;

  final Widget? child;

  final bool Function(FormGroup formGroup)? canPop;

  final void Function(FormGroup formGroup, bool didPop)? onPopInvoked;

  final Widget Function(
          BuildContext context, ResetPasswordDtoForm formModel, Widget? child)
      builder;

  final void Function(BuildContext context, ResetPasswordDtoForm formModel)?
      initState;

  @override
  _ResetPasswordDtoFormBuilderState createState() =>
      _ResetPasswordDtoFormBuilderState();
}

class _ResetPasswordDtoFormBuilderState
    extends State<ResetPasswordDtoFormBuilder> {
  late ResetPasswordDtoForm _formModel;

  @override
  void initState() {
    _formModel = ResetPasswordDtoForm(
        ResetPasswordDtoForm.formElements(widget.model), null);

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant ResetPasswordDtoFormBuilder oldWidget) {
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
    return ReactiveResetPasswordDtoForm(
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

class ResetPasswordDtoForm implements FormModel<ResetPasswordDto> {
  ResetPasswordDtoForm(
    this.form,
    this.path,
  );

  static const String passwordControlName = "password";

  static const String passwordConfirmationControlName = "passwordConfirmation";

  final FormGroup form;

  final String? path;

  final Map<String, bool> _disabled = {};

  String passwordControlPath() => pathBuilder(passwordControlName);

  String passwordConfirmationControlPath() =>
      pathBuilder(passwordConfirmationControlName);

  String? get _passwordValue => passwordControl?.value;

  String? get _passwordConfirmationValue => passwordConfirmationControl?.value;

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

  Map<String, Object>? get passwordErrors => passwordControl?.errors;

  Map<String, Object>? get passwordConfirmationErrors =>
      passwordConfirmationControl?.errors;

  void get passwordFocus => form.focus(passwordControlPath());

  void get passwordConfirmationFocus =>
      form.focus(passwordConfirmationControlPath());

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

  FormControl<String>? get passwordControl => containsPassword
      ? form.control(passwordControlPath()) as FormControl<String>?
      : null;

  FormControl<String>? get passwordConfirmationControl =>
      containsPasswordConfirmation
          ? form.control(passwordConfirmationControlPath())
              as FormControl<String>?
          : null;

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

  @override
  ResetPasswordDto get model {
    final isValid = !currentForm.hasErrors && currentForm.errors.isEmpty;

    if (!isValid) {
      debugPrintStack(
          label:
              '[${path ?? 'ResetPasswordDtoForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
    }
    return ResetPasswordDto(
        password: _passwordValue,
        passwordConfirmation: _passwordConfirmationValue);
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
    required void Function(ResetPasswordDto model) onValid,
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
    ResetPasswordDto? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(ResetPasswordDtoForm.formElements(value).rawValue,
          updateParent: updateParent, emitEvent: emitEvent);

  @override
  void reset({
    ResetPasswordDto? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: value != null ? formElements(value).rawValue : null,
          updateParent: updateParent,
          emitEvent: emitEvent);

  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");

  static FormGroup formElements(ResetPasswordDto? resetPasswordDto) =>
      FormGroup({
        passwordControlName: FormControl<String>(
            value: resetPasswordDto?.password,
            validators: [RequiredValidator()],
            asyncValidators: [],
            asyncValidatorsDebounceTime: 250,
            disabled: false,
            touched: false),
        passwordConfirmationControlName: FormControl<String>(
            value: resetPasswordDto?.passwordConfirmation,
            validators: [
              RequiredValidator(),
              MustMatchValidatorCustom('password', 'passwordConfirmation', true)
            ],
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

class ReactiveResetPasswordDtoFormArrayBuilder<
    ReactiveResetPasswordDtoFormArrayBuilderT> extends StatelessWidget {
  const ReactiveResetPasswordDtoFormArrayBuilder({
    Key? key,
    this.control,
    this.formControl,
    this.builder,
    required this.itemBuilder,
  })  : assert(control != null || formControl != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final FormArray<ReactiveResetPasswordDtoFormArrayBuilderT>? formControl;

  final FormArray<ReactiveResetPasswordDtoFormArrayBuilderT>? Function(
      ResetPasswordDtoForm formModel)? control;

  final Widget Function(BuildContext context, List<Widget> itemList,
      ResetPasswordDtoForm formModel)? builder;

  final Widget Function(
      BuildContext context,
      int i,
      ReactiveResetPasswordDtoFormArrayBuilderT? item,
      ResetPasswordDtoForm formModel) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveResetPasswordDtoForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    return ReactiveFormArray<ReactiveResetPasswordDtoFormArrayBuilderT>(
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

class ReactiveResetPasswordDtoFormFormGroupArrayBuilder<
        ReactiveResetPasswordDtoFormFormGroupArrayBuilderT>
    extends StatelessWidget {
  const ReactiveResetPasswordDtoFormFormGroupArrayBuilder({
    Key? key,
    this.extended,
    this.getExtended,
    this.builder,
    required this.itemBuilder,
  })  : assert(extended != null || getExtended != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final ExtendedControl<List<Map<String, Object?>?>,
      List<ReactiveResetPasswordDtoFormFormGroupArrayBuilderT>>? extended;

  final ExtendedControl<List<Map<String, Object?>?>,
          List<ReactiveResetPasswordDtoFormFormGroupArrayBuilderT>>
      Function(ResetPasswordDtoForm formModel)? getExtended;

  final Widget Function(BuildContext context, List<Widget> itemList,
      ResetPasswordDtoForm formModel)? builder;

  final Widget Function(
      BuildContext context,
      int i,
      ReactiveResetPasswordDtoFormFormGroupArrayBuilderT? item,
      ResetPasswordDtoForm formModel) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveResetPasswordDtoForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final value = (extended ?? getExtended?.call(formModel))!;

    return StreamBuilder<List<Map<String, Object?>?>?>(
      stream: value.control.valueChanges,
      builder: (context, snapshot) {
        final itemList = (value.value() ??
                <ReactiveResetPasswordDtoFormFormGroupArrayBuilderT>[])
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
