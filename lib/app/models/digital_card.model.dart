import 'package:freezed_annotation/freezed_annotation.dart';

part 'digital_card.model.freezed.dart';
part 'digital_card.model.g.dart';

@freezed
class DigitalCard with _$DigitalCard {
  factory DigitalCard({
    int? id,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'owner_id') int? ownerId,
    String? title,
    @JsonKey(name: 'logo_image') String? logoImage,
    String? color,
    @JsonKey(name: 'profile_image') String? profileImage,
    String? prefix,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'middle_name') String? middleName,
    @JsonKey(name: 'last_name') String? lastName,
    String? suffix,
    @JsonKey(name: 'short_bio') String? shortBio,
    String? position,
    String? company,
    String? email,
    String? address,
    @JsonKey(name: 'mobile_number') String? mobileNumber,
    String? website,
    @JsonKey(name: 'goes_by') String? goesBy,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _DigitalCard;

  factory DigitalCard.fromJson(Map<String, dynamic> json) =>
      _$DigitalCardFromJson(json);
}
