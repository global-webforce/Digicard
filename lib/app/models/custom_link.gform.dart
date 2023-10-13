// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file:

part of 'custom_link.dart';

// **************************************************************************
// ReactiveFormsGenerator
// **************************************************************************

class ReactiveCustomLinkFormConsumer extends StatelessWidget {
  const ReactiveCustomLinkFormConsumer({
    Key? key,
    required this.builder,
    this.child,
  }) : super(key: key);

  final Widget? child;

  final Widget Function(
      BuildContext context, CustomLinkForm formModel, Widget? child) builder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveCustomLinkForm.of(context);

    if (formModel is! CustomLinkForm) {
      throw FormControlParentNotFoundException(this);
    }
    return builder(context, formModel, child);
  }
}

class CustomLinkFormInheritedStreamer extends InheritedStreamer<dynamic> {
  const CustomLinkFormInheritedStreamer({
    Key? key,
    required this.form,
    required Stream<dynamic> stream,
    required Widget child,
  }) : super(
          stream,
          child,
          key: key,
        );

  final CustomLinkForm form;
}

class ReactiveCustomLinkForm extends StatelessWidget {
  const ReactiveCustomLinkForm({
    Key? key,
    required this.form,
    required this.child,
    this.onWillPop,
  }) : super(key: key);

  final Widget child;

  final CustomLinkForm form;

  final WillPopCallback? onWillPop;

  static CustomLinkForm? of(
    BuildContext context, {
    bool listen = true,
  }) {
    if (listen) {
      return context
          .dependOnInheritedWidgetOfExactType<CustomLinkFormInheritedStreamer>()
          ?.form;
    }

    final element = context.getElementForInheritedWidgetOfExactType<
        CustomLinkFormInheritedStreamer>();
    return element == null
        ? null
        : (element.widget as CustomLinkFormInheritedStreamer).form;
  }

  @override
  Widget build(BuildContext context) {
    return CustomLinkFormInheritedStreamer(
      form: form,
      stream: form.form.statusChanged,
      child: WillPopScope(
        onWillPop: onWillPop,
        child: child,
      ),
    );
  }
}

class CustomLinkFormBuilder extends StatefulWidget {
  const CustomLinkFormBuilder({
    Key? key,
    this.model,
    this.child,
    this.onWillPop,
    required this.builder,
    this.initState,
  }) : super(key: key);

  final CustomLink? model;

  final Widget? child;

  final WillPopCallback? onWillPop;

  final Widget Function(
      BuildContext context, CustomLinkForm formModel, Widget? child) builder;

  final void Function(BuildContext context, CustomLinkForm formModel)?
      initState;

  @override
  _CustomLinkFormBuilderState createState() => _CustomLinkFormBuilderState();
}

class _CustomLinkFormBuilderState extends State<CustomLinkFormBuilder> {
  late CustomLinkForm _formModel;

  @override
  void initState() {
    _formModel =
        CustomLinkForm(CustomLinkForm.formElements(widget.model), null);

    if (_formModel.form.disabled) {
      _formModel.form.markAsDisabled();
    }

    widget.initState?.call(context, _formModel);

    super.initState();
  }

  @override
  void didUpdateWidget(covariant CustomLinkFormBuilder oldWidget) {
    if (widget.model != oldWidget.model) {
      _formModel =
          CustomLinkForm(CustomLinkForm.formElements(widget.model), null);

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
    return ReactiveCustomLinkForm(
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

class ReactiveCustomLinkFormArrayBuilder<T> extends StatelessWidget {
  const ReactiveCustomLinkFormArrayBuilder({
    Key? key,
    this.control,
    this.formControl,
    this.builder,
    required this.itemBuilder,
  })  : assert(control != null || formControl != null,
            "You have to specify `control` or `formControl`!"),
        super(key: key);

  final FormArray<T>? formControl;

  final FormArray<T>? Function(CustomLinkForm formModel)? control;

  final Widget Function(BuildContext context, List<Widget> itemList,
      CustomLinkForm formModel)? builder;

  final Widget Function(
          BuildContext context, int i, T? item, CustomLinkForm formModel)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveCustomLinkForm.of(context);

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

class ReactiveCustomLinkFormFormGroupArrayBuilder<T> extends StatelessWidget {
  const ReactiveCustomLinkFormFormGroupArrayBuilder({
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
      CustomLinkForm formModel)? getExtended;

  final Widget Function(BuildContext context, List<Widget> itemList,
      CustomLinkForm formModel)? builder;

  final Widget Function(
          BuildContext context, int i, T? item, CustomLinkForm formModel)
      itemBuilder;

  @override
  Widget build(BuildContext context) {
    final formModel = ReactiveCustomLinkForm.of(context);

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
