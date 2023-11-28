import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reactive_forms/reactive_forms.dart';

Future showMyDialog(BuildContext context, customLink) async {
  final form = FormGroup({
    'value': FormControl<String>(value: ''),
    'custom': FormControl<String>(value: ''),
  });

  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Wrap(
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          runSpacing: 8.0,
          spacing: 8.0,
          children: [
            const Icon(FontAwesomeIcons.linkedin),
            Text(customLink.label),
          ],
        ),
        content: ReactiveForm(
          formGroup: form,
          child: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                ReactiveTextField(
                  showErrors: (control) {
                    return false;
                  },
                  formControlName: 'value',
                  decoration: const InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    filled: true,
                  ),
                ),
                const SizedBox(height: 12.0),
                ReactiveTextField(
                  showErrors: (control) {
                    return false;
                  },
                  formControlName: 'custom',
                  decoration: const InputDecoration(
                    label: Text("Label"),
                    isDense: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    filled: true,
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: const Text('Create'),
            onPressed: () {
              Navigator.of(context).pop(customLink.copyWith(
                  value: form.value['value'].toString(),
                  custom: form.value['custom'] as String? ?? ""));
            },
          ),
        ],
      );
    },
  );
}
