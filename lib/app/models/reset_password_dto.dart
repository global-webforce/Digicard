import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

import 'register_dto.dart';

part 'reset_password_dto.freezed.dart';
part 'reset_password_dto.g.dart';
part 'reset_password_dto.gform.dart';

@freezed
@Rf()
class ResetPasswordDto with _$ResetPasswordDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  factory ResetPasswordDto({
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
  }) = _ResetPasswordDto;

  factory ResetPasswordDto.fromJson(Map<String, dynamic> json) =>
      _$ResetPasswordDtoFromJson(json);
}
