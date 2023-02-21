import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.model.freezed.dart';
part 'profile.model.g.dart';

@freezed
class Profile with _$Profile {
  factory Profile({
    double? weight,
    double? height,
    @JsonKey(name: 'company_id') int? companyId,
    int? verified,
    @JsonKey(name: 'short_bio') String? shortBio,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}
