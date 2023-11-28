import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'login_dto.freezed.dart';
part 'login_dto.g.dart';
part 'login_dto.gform.dart';

@freezed
@Rf()
class LoginDto with _$LoginDto {
  // ignore: invalid_annotation_target
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  factory LoginDto({
    @RfControl(validators: [
      RequiredValidator(),
      EmailValidator(),
    ])
    String? email,
    @RfControl(validators: [
      RequiredValidator(),
    ])
    String? password,
  }) = _LoginDto;

  factory LoginDto.fromJson(Map<String, dynamic> json) =>
      _$LoginDtoFromJson(json);
}
