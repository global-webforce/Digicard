import 'package:freezed_annotation/freezed_annotation.dart';

import 'address.model.dart';
import 'profile.model.dart';

part 'user.model.freezed.dart';
part 'user.model.g.dart';

@freezed
class User with _$User {
  factory User({
    int? id,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? email,
    @JsonKey(name: 'birth_date') dynamic birthDate,
    dynamic gender,
    @JsonKey(name: 'email_verified_at') dynamic emailVerifiedAt,
    @JsonKey(name: 'mobile_number') dynamic mobileNumber,
    dynamic role,
    @JsonKey(name: 'profile_pic') dynamic profilePic,
    Profile? profile,
    Address? address,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
