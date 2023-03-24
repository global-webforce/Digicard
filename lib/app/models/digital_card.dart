import 'package:digicard/app/models/custom_link.dart';
import 'package:digicard/app/models/full_name.dart';
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
    @FormControlAnnotation<String>() String? title,
    @FormControlAnnotation<String>() String? logoImage,
    @FormControlAnnotation<String>() String? profileImage,
    @FormControlAnnotation<String>() String? color,
    @FormGroupAnnotation() FullName? fullname,
    @FormControlAnnotation<String>() String? position,
    @FormControlAnnotation<String>() String? department,
    @FormControlAnnotation<String>() String? company,
    @FormControlAnnotation<String>() String? headline,
    @Default([]) @FormArrayAnnotation() List<CustomLink> customLinks,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _DigitalCard;

  factory DigitalCard.fromJson(Map<String, dynamic> json) =>
      _$DigitalCardFromJson(json);
}
