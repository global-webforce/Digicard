import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'digital_card.freezed.dart';
part 'digital_card.g.dart';
part 'digital_card.gform.dart';

@freezed
@ReactiveFormAnnotation()
class DigitalCard with _$DigitalCard {
  factory DigitalCard({
    @FormControlAnnotation<int>() int? id,
    @FormControlAnnotation<int>() int? userId,
    @FormControlAnnotation<String>() String? uuid,
    @Default("New Card") @FormControlAnnotation<String>() String? title,
    @FormControlAnnotation<String>() String? logoImage,
    @FormControlAnnotation<String>() String? color,
    @FormControlAnnotation<String>() String? profileImage,
    @FormControlAnnotation<String>() String? prefix,
    @FormControlAnnotation<String>() String? firstName,
    @FormControlAnnotation<String>() String? middleName,
    @FormControlAnnotation<String>() String? lastName,
    @FormControlAnnotation<String>() String? suffix,
    @FormControlAnnotation<String>() String? shortBio,
    @FormControlAnnotation<String>() String? position,
    @FormControlAnnotation<String>() String? company,
    @FormControlAnnotation<String>() String? email,
    @FormControlAnnotation<String>() String? address,
    @FormControlAnnotation<String>() String? mobileNumber,
    @FormControlAnnotation<String>() String? website,
    @FormControlAnnotation<String>() String? goesBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _DigitalCard;

  factory DigitalCard.fromJson(Map<String, dynamic> json) =>
      _$DigitalCardFromJson(json);
}

Map<String, dynamic>? requiredValidator(AbstractControl<dynamic> control) {
  return Validators.required(control);
}
