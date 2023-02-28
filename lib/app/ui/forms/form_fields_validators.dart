class FormFieldValidators {
  static String? name(String? value, {bool? required = false}) {
    if (required == true) {
      if (value == null || value.trim().isEmpty) {
        return "Required";
      }
    }
    if (value != null) {
      if (value.contains(RegExp(r'[0-9]'))) {
        return 'No numbers allowed';
      }
    }
    return null;
  }
}
