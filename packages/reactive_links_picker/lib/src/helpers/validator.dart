import 'package:reactive_forms/reactive_forms.dart';

class NotEmptyValidator extends Validator<dynamic> {
  const NotEmptyValidator() : super();

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    bool hasError = false;
    if (control.value == null) {
      return null;
    } else if (control.value is List && (control.value as List).isNotEmpty) {
      control.value?.forEach((e) {
        if ((e['value'] as String).isEmpty || e['value'] == null) {
          hasError = true;
          return;
        }
      });
    }

    if (hasError == true) {
      return <String, dynamic>{'emptyValueInList': hasError};
    }

    return null;
  }
}
