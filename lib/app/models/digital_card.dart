import 'package:freezed_annotation/freezed_annotation.dart';

part 'digital_card.freezed.dart';
part 'digital_card.g.dart';

@freezed
class DigitalCard with _$DigitalCard {
  factory DigitalCard({
    required int id,
    int? userId,
    int? ownerId,
    String? title,
    String? logoImage,
    int? color,
    String? profileImage,
    String? prefix,
    String? firstName,
    String? middleName,
    String? lastName,
    String? suffix,
    String? shortBio,
    String? position,
    String? company,
    String? email,
    String? address,
    String? mobileNumber,
    String? website,
    String? goesBy,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _DigitalCard;

  factory DigitalCard.fromJson(Map<String, dynamic> json) =>
      _$DigitalCardFromJson(json);
}
