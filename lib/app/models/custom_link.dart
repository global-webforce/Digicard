import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
part 'custom_link.freezed.dart';
part 'custom_link.g.dart';

@freezed
@FormGroupAnnotation()
class CustomLink with _$CustomLink {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  factory CustomLink({
    @FormControlAnnotation() int? id,
    @FormControlAnnotation() int? cardId,
    @FormControlAnnotation(validators: [requiredValidator]) String? text,
    @FormControlAnnotation() String? label,
    @FormControlAnnotation() String? type,
  }) = _CustomLink;

  factory CustomLink.fromJson(Map<String, dynamic> json) =>
      _$CustomLinkFromJson(json);
}

Map<String, dynamic>? requiredValidator(AbstractControl<dynamic> control) {
  return Validators.required(control);
}
