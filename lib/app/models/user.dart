import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  @Assert('id != null', 'User id must be integer and not null')
  @Assert('email.isNotEmpty', 'User email must be string and not null')
  factory User({
    required int id,
    required String email,
    String? firstName,
    String? lastName,
    String? gender,
    String? mobileNumber,
    String? profilePic,
    DateTime? emailVerifiedAt,
    String? token,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
