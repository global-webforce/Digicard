import 'package:freezed_annotation/freezed_annotation.dart';

part 'client.model.freezed.dart';
part 'client.model.g.dart';

@freezed
class Client with _$Client {
  factory Client({
    int? id,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    String? email,
    @JsonKey(name: 'email_verified_at') dynamic emailVerifiedAt,
    @JsonKey(name: 'mobile_number') String? mobileNumber,
    dynamic role,
    @JsonKey(name: 'profile_pic') dynamic profilePic,
    @JsonKey(name: 'company_id') dynamic companyId,
    dynamic gender,
    dynamic age,
    dynamic height,
    dynamic weight,
    @JsonKey(name: 'birth_date') dynamic birthDate,
    dynamic address,
  }) = _Client;

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
}
