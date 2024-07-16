// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file:

part of 'forgot_password_dto.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveForgotPasswordDtoFormConsumer extends StatelessWidget {
  const ReactiveForgotPasswordDtoFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
          BuildContext context, ForgotPasswordDtoForm formModel, Widget? child)
      builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveForgotPasswordDtoForm.of(context);

    if (formModel is! ForgotPasswordDtoForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class ForgotPasswordDtoFormInheritedStreamer
    extends InheritedStreamer<dynamic> {
  const ForgotPasswordDtoFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(
          stream,
          child,
          key: key,
        );

  final ForgotPasswordDtoForm form;
}

class ReactiveForgotPasswordDtoForm extends StatelessWidget {
  const ReactiveForgotPasswordDtoForm({
    Key? key,
    required this.form,
    required this.child,
    this.canPop,
    this.onPopInvoked,
  }) : super(key: key);

  final Widget child;

  final ForgotPasswordDtoForm form;

  final bool Function(FormGroup formGroup)? canPop;

  final void Function(FormGroup formGroup, bool didPop)? onPopInvoked;

  static ForgotPasswordDtoForm? of(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<
              ForgotPasswordDtoFormInheritedStreamer>()
          ?.form;
    }

    final element = context.getElementForInheritedWidgetOfExactType<
        ForgotPasswordDtoFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as ForgotPasswordDtoFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return ForgotPasswordDtoFormInheritedStreamer(
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

extension ReactiveReactiveForgotPasswordDtoFormExt on BuildContext {
  ForgotPasswordDtoForm? forgotPasswordDtoFormWatch() =>
      ReactiveForgotPasswordDtoForm.of(this);

  ForgotPasswordDtoForm? forgotPasswordDtoFormRead() =>
      ReactiveForgotPasswordDtoForm.of(this, listen: false);
}

class ForgotPasswordDtoFormBuilder extends StatefulWidget {
  const ForgotPasswordDtoFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.canPop,
    this.onPopInvoked,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final ForgotPasswordDto? model;

  final Widget? child;

  final bool Function(FormGroup formGroup)? canPop;

  final void Function(FormGroup formGroup, bool didPop)? onPopInvoked;

  final Widget Function(
          BuildContext context, ForgotPasswordDtoForm formModel, Widget? child)
      builder;

  final void Function(BuildContext context, ForgotPasswordDtoForm formModel)?
      initState;

  @override
  _ForgotPasswordDtoFormBuilderState createState() =>
      _ForgotPasswordDtoFormBuilderState();
}

class _ForgotPasswordDtoFormBuilderState
    extends State<ForgotPasswordDtoFormBuilder> {
  late ForgotPasswordDtoForm _formModel;

  @override
  void initState() {
    _formModel = ForgotPasswordDtoForm(
        ForgotPasswordDtoForm.formElements(widget.model), null);

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant ForgotPasswordDtoFormBuilder oldWidget) {
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
    return ReactiveForgotPasswordDtoForm(
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

class ForgotPasswordDtoForm implements FormModel<ForgotPasswordDto> {
  ForgotPasswordDtoForm(
    this.form,
    this.path,
  );

  static const String emailControlName = "email";

  final FormGroup form;

  final String? path;

  final Map<String, bool> _disabled = {};

  String emailControlPath() => pathBuilder(emailControlName);

  String? get _emailValue => emailControl?.value;

  bool get containsEmail {
    try {
      form.control(emailControlPath());
      return true;
    } catch (e) {
      return false;
    }
  }

  Map<String, Object>? get emailErrors => emailControl?.errors;

  void get emailFocus => form.focus(emailControlPath());

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

  void emailValueUpdate(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) {
    emailControl?.updateValue(value,
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

  void emailValueReset(
    String? value, {
    bool updateParent = true,
    bool emitEvent = true,
    bool removeFocus = false,
    bool? disabled,
  }) =>
      emailControl?.reset(
          value: value, updateParent: updateParent, emitEvent: emitEvent);

  FormControl<String>? get emailControl => containsEmail
      ? form.control(emailControlPath()) as FormControl<String>?
      : null;

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

  @override
  ForgotPasswordDto get model {
    final isValid = !currentForm.hasErrors && currentForm.errors.isEmpty;

    if (!isValid) {
      debugPrintStack(
          label:
              '[${path ?? 'ForgotPasswordDtoForm'}]\n┗━ Avoid calling `model` on invalid form. Possible exceptions for non-nullable fields which should be guarded by `required` validator.');
    }
    return ForgotPasswordDto(email: _emailValue);
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
    required void Function(ForgotPasswordDto model) onValid,
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
    ForgotPasswordDto? value, {
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.updateValue(ForgotPasswordDtoForm.formElements(value).rawValue,
          updateParent: updateParent, emitEvent: emitEvent);

  @override
  void reset({
    ForgotPasswordDto? value,
    bool updateParent = true,
    bool emitEvent = true,
  }) =>
      form.reset(
          value: value != null ? formElements(value).rawValue : null,
          updateParent: updateParent,
          emitEvent: emitEvent);

  String pathBuilder(String? pathItem) =>
      [path, pathItem].whereType<String>().join(".");

  static FormGroup formElements(ForgotPasswordDto? forgotPasswordDto) =>
      FormGroup({
        emailControlName: FormControl<String>(
            value: forgotPasswordDto?.email,
            validators: [RequiredValidator(), EmailValidator()],
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

class ReactiveForgotPasswordDtoFormArrayBuilder<
    ReactiveForgotPasswordDtoFormArrayBuilderT> extends StatelessWidget {
  const ReactiveForgotPasswordDtoFormArrayBuilder({
    Key? key,
    this.control,
    this.formControl,
    this.builder,
    required this.itemBuilder,
  })  : assert(control != null || formControl != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final FormArray<ReactiveForgotPasswordDtoFormArrayBuilderT>? formControl;

  final FormArray<ReactiveForgotPasswordDtoFormArrayBuilderT>? Function(
      ForgotPasswordDtoForm formModel)? control;

  final Widget Function(BuildContext context, List<Widget> itemList,
      ForgotPasswordDtoForm formModel)? builder;

  final Widget Function(
      BuildContext context,
      int i,
      ReactiveForgotPasswordDtoFormArrayBuilderT? item,
      ForgotPasswordDtoForm formModel) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveForgotPasswordDtoForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    return ReactiveFormArray<ReactiveForgotPasswordDtoFormArrayBuilderT>(
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

class ReactiveForgotPasswordDtoFormFormGroupArrayBuilder<
        ReactiveForgotPasswordDtoFormFormGroupArrayBuilderT>
    extends StatelessWidget {
  const ReactiveForgotPasswordDtoFormFormGroupArrayBuilder({
    Key? key,
    this.extended,
    this.getExtended,
    this.builder,
    required this.itemBuilder,
  })  : assert(extended != null || getExtended != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final ExtendedControl<List<Map<String, Object?>?>,
      List<ReactiveForgotPasswordDtoFormFormGroupArrayBuilderT>>? extended;

  final ExtendedControl<List<Map<String, Object?>?>,
          List<ReactiveForgotPasswordDtoFormFormGroupArrayBuilderT>>
      Function(ForgotPasswordDtoForm formModel)? getExtended;

  final Widget Function(BuildContext context, List<Widget> itemList,
      ForgotPasswordDtoForm formModel)? builder;

  final Widget Function(
      BuildContext context,
      int i,
      ReactiveForgotPasswordDtoFormFormGroupArrayBuilderT? item,
      ForgotPasswordDtoForm formModel) itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveForgotPasswordDtoForm.of(context);

    if (formModel == null) {
      throw FormControlParentNotFoundException(this);
    }

    final value = (extended ?? getExtended?.call(formModel))!;

    return StreamBuilder<List<Map<String, Object?>?>?>(
      stream: value.control.valueChanges,
      builder: (context, snapshot) {
        final itemList = (value.value() ??
                <ReactiveForgotPasswordDtoFormFormGroupArrayBuilderT>[])
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
