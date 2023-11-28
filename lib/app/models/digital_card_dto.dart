import 'dart:typed_data';
import 'package:digicard/ui/common/app_colors.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:reactive_links_picker/reactive_links_picker.dart';
part 'digital_card_dto.freezed.dart';
part 'digital_card_dto.g.dart';
part 'digital_card_dto.gform.dart';

@freezed
@ReactiveFormAnnotation()
class DigitalCardDTO with _$DigitalCardDTO {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  factory DigitalCardDTO({
    int? id,
    String? userId,
    String? uuid,
    String? logoUrl,
    String? avatarUrl,
    @Default("New Card") @RfControl() String? title,
    @RfControl(validators: [RequiredValidator()]) String? firstName,
    @RfControl() String? prefix,
    @RfControl() String? middleName,
    @RfControl() String? lastName,
    @RfControl() String? suffix,
    @RfControl() dynamic avatarFile,
    @RfControl() dynamic logoFile,
    @ColorConverter() @RfControl() @RfControl() Color? color,
    @RfControl() int? layout,
    @RfControl() String? position,
    @RfControl() String? company,
    @RfControl() String? headline,
    @Default([])
    @RfControl(validators: [NotEmptyValidator()])
    List<Map<String, dynamic>>? customLinks,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? addedToContactsAt,
  }) = _DigitalCardDTO;

  factory DigitalCardDTO.blank() => DigitalCardDTO(
        customLinks: [],
      );

  factory DigitalCardDTO.fromJson(Map<String, dynamic> json) =>
      _$DigitalCardDTOFromJson(json);
}

class ColorConverter implements JsonConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromJson(int? val) {
    return val == null ? kcPrimaryColor : Color(val);
  }

  @override
  int toJson(Color val) => val.value;
}

class Uint8ListConverter implements JsonConverter<Uint8List?, List<int>?> {
  const Uint8ListConverter();

  @override
  Uint8List? fromJson(List<int>? json) {
    return json == null ? null : Uint8List.fromList(json);
  }

  @override
  List<int>? toJson(Uint8List? object) {
    return object?.toList();
  }
}
