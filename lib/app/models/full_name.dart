import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
part 'full_name.freezed.dart';
part 'full_name.g.dart';

@freezed
@FormGroupAnnotation()
class FullName with _$FullName {
  factory FullName({
    @FormControlAnnotation<String>() String? prefix,
    @FormControlAnnotation<String>() String? firstName,
    @FormControlAnnotation<String>() String? middleName,
    @FormControlAnnotation<String>() String? lastName,
    @FormControlAnnotation<String>() String? suffix,
    @FormControlAnnotation<String>() String? accreditations,
    @FormControlAnnotation<String>() String? preferredName,
    @FormControlAnnotation<String>() String? maidenName,
    @FormControlAnnotation<String>() String? pronouns,
  }) = _FullName;

  factory FullName.fromJson(Map<String, dynamic> json) =>
      _$FullNameFromJson(json);
}
