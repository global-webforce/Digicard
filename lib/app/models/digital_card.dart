import 'package:digicard/app/constants/colors.dart';
import 'package:digicard/app/models/custom_link.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'digital_card.freezed.dart';
part 'digital_card.g.dart';
part 'digital_card.gform.dart';

@freezed
@ReactiveFormAnnotation()
class DigitalCard with _$DigitalCard {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  factory DigitalCard({
    @FormControlAnnotation<int>()
        int? id,
    @FormControlAnnotation<String>()
        String? userId,
    @FormControlAnnotation<String>()
        String? uuid,
    @Default("New Card")
    @FormControlAnnotation<String>()
        String? title,
    @FormControlAnnotation<String>()
        String? prefix,
    @FormControlAnnotation<String>(
      validators: [requiredValidator],
    )
        String? firstName,
    @FormControlAnnotation<String>()
        String? middleName,
    @FormControlAnnotation<String>()
        String? lastName,
    @FormControlAnnotation<String>()
        String? suffix,
    @FormControlAnnotation<String>()
        String? accreditations,
    @FormControlAnnotation<String>()
        String? preferredName,
    @FormControlAnnotation<String>()
        String? maidenName,
    @FormControlAnnotation<String>()
        String? pronouns,
    @FormControlAnnotation<String>()
        String? logoUrl,
    @FormControlAnnotation<String>()
        String? avatarUrl,
    @Default(kcPrimaryColorInt)
    @FormControlAnnotation<int>()
        int? color,
    @FormControlAnnotation<String>()
        String? position,
    @FormControlAnnotation<String>()
        String? department,
    @FormControlAnnotation<String>()
        String? company,
    @FormControlAnnotation<String>()
        String? headline,
    @Default([])
    @FormArrayAnnotation()
        List<CustomLink> customLinks,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _DigitalCard;

  factory DigitalCard.fromJson(Map<String, dynamic> json) =>
      _$DigitalCardFromJson(json);
}

Map<String, dynamic>? requiredValidator(AbstractControl<dynamic> control) {
  return Validators.required(control);
}
