import 'package:digicard/app/models/digital_card.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'digicontact.g.dart';
part 'digicontact.freezed.dart';

@freezed
class DigiContact with _$DigiContact {
  @JsonSerializable(
    fieldRename: FieldRename.snake,
  )
  factory DigiContact({
    required int id,
    required DigitalCard card,
    required DateTime createdAt,
  }) = _DigiContact;

  factory DigiContact.fromJson(Map<String, dynamic> json) =>
      _$DigiContactFromJson(json);
}
