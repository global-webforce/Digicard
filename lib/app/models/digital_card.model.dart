import 'package:freezed_annotation/freezed_annotation.dart';

part 'digital_card.model.freezed.dart';
part 'digital_card.model.g.dart';

@freezed
class DigitalCard with _$DigitalCard {
  factory DigitalCard({
    int? id,
    @JsonKey(name: 'user_id') int? userId,
    String? name,
    String? title,
    String? company,
    String? image,
    String? color,
    @JsonKey(name: 'mobile_number') String? mobileNumber,
    String? email,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _DigitalCard;

  factory DigitalCard.fromJson(Map<String, dynamic> json) =>
      _$DigitalCardFromJson(json);
}
