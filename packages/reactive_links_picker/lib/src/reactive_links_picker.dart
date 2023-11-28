import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'fields_list/fields_list.dart';
import 'icons_list/icons_list.dart';
import 'icons_list/icons.dart';

FormGroup formGroupBuilder(Map<String, dynamic>? data) {
  return FormGroup({
    'id': FormControl<String>(value: "customLink-${UniqueKey()}"),
    'value': FormControl<String>(
      value: data?['value'],
      validators: [const RequiredValidator()],
    ),
    'custom': FormControl<String>(value: data?['custom']),
    'label': FormControl<String>(value: data?['label']),
  });
}

class LinksPicker extends StatefulWidget {
  final Color? backgroundColor;
  final List<Map<String, dynamic>?> value;
  final Function(List<Map<String, dynamic>?>?) onValueChanged;

  const LinksPicker(
      {super.key,
      required this.onValueChanged,
      this.value = const [],
      this.backgroundColor});

  @override
  State<LinksPicker> createState() => _LinksPickerState();
}

class _LinksPickerState extends State<LinksPicker> {
  late FormGroup form;
  FormArray<Map<String, dynamic>> get customLinks =>
      form.control('customLinks') as FormArray<Map<String, dynamic>>;

  @override
  void initState() {
    form = FormGroup({
      'customLinks': FormArray<Map<String, dynamic>>([]),
    });
    for (var i = 0; i < widget.value.length; i++) {
      customLinks.add(formGroupBuilder(widget.value[i]));
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    customLinks.dispose();
    form.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, size) {
      return ReactiveForm(
        formGroup: form,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                constraints: const BoxConstraints(minHeight: 150),
                child: FieldsList(
                  onUpdateAt: (index, link) {
                    customLinks.insert(index, formGroupBuilder(link.toJson()));
                    customLinks.removeAt(index);
                    widget.onValueChanged(customLinks.value);
                  },
                  onReorder: (value) async {
                    customLinks.clear();
                    for (var i = 0; i < value.length; i++) {
                      customLinks.add(formGroupBuilder(value[i]));
                    }

                    widget.onValueChanged(customLinks.value);
                  },
                  onRemoveAt: (value) {
                    customLinks.clear();

                    for (var i = 0; i < value.length; i++) {
                      customLinks.add(formGroupBuilder(value[i]));
                    }

                    widget.onValueChanged(customLinks.value);
                  },
                ),
              ),
              Container(
                height: (MediaQuery.of(context).size.height) - 150,
                constraints: const BoxConstraints(minHeight: 150),
                child: IconsList(
                  backgroundColor: widget.backgroundColor,
                  customLinks: icons,
                  onLinkCreated: (customLink) {
                    customLinks.add(formGroupBuilder(customLink.toJson()));
                    widget.onValueChanged(customLinks.value);
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class ReactiveLinksPicker<T>
    extends ReactiveFormField<T, List<Map<String, dynamic>>> {
  ReactiveLinksPicker({
    Key? key,
    String? formControlName,
    final Color? backgroundColor,
    FormControl<T>? formControl,
    ReactiveFormFieldCallback<T>? onChanged,
  }) : super(
          key: key,
          formControlName: formControlName,
          formControl: formControl,
          builder: (field) {
            return LinksPicker(
              backgroundColor: backgroundColor,
              value: field.value ?? [],
              onValueChanged: (customLinks) {
                final List<Map<String, dynamic>>? x =
                    customLinks?.cast<Map<String, dynamic>>();
                field.control.markAsDirty();
                field.control.updateValueAndValidity();
                field.didChange(x ?? []);
                onChanged?.call(field.control);
              },
            );
          },
        ) {
    if (this.formControlName == null && this.formControl == null) {
      assert(this.formControlName == null && this.formControl == null,
          'ReactiveLinksPicker requires atleast a formControlName or formControl');
    }
  }

  @override
  ReactiveFormFieldState<T, List<Map<String, dynamic>>> createState() =>
      ReactiveFormFieldState<T, List<Map<String, dynamic>>>();
}
