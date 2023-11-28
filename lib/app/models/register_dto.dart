import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
part 'register_dto.freezed.dart';
part 'register_dto.g.dart';
part 'register_dto.gform.dart';

class RequiredTrueValidator extends Validator<dynamic> {
  const RequiredTrueValidator() : super();

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    return control.isNotNull && control.value is bool && control.value == true
        ? null
        : {'requiredTrue': true};
  }
}

class MustMatchValidatorCustom extends Validator<dynamic> {
  final String controlName;
  final String matchingControlName;
  final bool markAsDirty;
  const MustMatchValidatorCustom(
      this.controlName, this.matchingControlName, this.markAsDirty)
      : super();

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    try {
      final error = {ValidationMessage.mustMatch: true};
      var dto = <dynamic, dynamic>{};
      control.parent?.valueChanges.listen((event) {
        if (event != null) {
          dto = event as Map;
          if (dto[controlName] != dto[matchingControlName]) {
            control.setErrors(error, markAsDirty: markAsDirty);
            control.markAsTouched();
          } else {
            control.removeError(ValidationMessage.mustMatch);
          }
        }
      });
    } catch (e) {
      return null;
    }
    return null;
  }
}

@freezed
@Rf()
class RegisterDto with _$RegisterDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory RegisterDto({
    @RfControl(validators: [RequiredValidator()]) String? fullName,
    @RfControl(validators: [RequiredValidator(), EmailValidator()])
    String? email,
    @RfControl(validators: [
      RequiredValidator(),
    ])
    String? password,
    @RfControl(validators: [
      RequiredValidator(),
      MustMatchValidatorCustom(
        'password',
        'passwordConfirmation',
        true,
      )
    ])
    String? passwordConfirmation,
    @RfControl(validators: [RequiredTrueValidator()]) bool? acceptLicense,
  }) = _RegisterDto;

  factory RegisterDto.fromJson(Map<String, dynamic> json) =>
      _$RegisterDtoFromJson(json);
}
