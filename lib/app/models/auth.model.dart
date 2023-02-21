import 'package:freezed_annotation/freezed_annotation.dart';

import 'user.model.dart';

part 'auth.model.freezed.dart';
part 'auth.model.g.dart';

@freezed
class Auth with _$Auth {
  factory Auth({
    User? user,
    dynamic token,
  }) = _Auth;

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);
}
