import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'forgot_password_dto.freezed.dart';
part 'forgot_password_dto.g.dart';
part 'forgot_password_dto.gform.dart';

@freezed
@Rf()
class ForgotPasswordDto with _$ForgotPasswordDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  factory ForgotPasswordDto({
    @RfControl(validators: [
      RequiredValidator(),
      EmailValidator(),
    ])
    String? email,
  }) = _ForgotPasswordDto;

  factory ForgotPasswordDto.fromJson(Map<String, dynamic> json) =>
      _$ForgotPasswordDtoFromJson(json);
}
