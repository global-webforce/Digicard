import 'package:freezed_annotation/freezed_annotation.dart';

part 'mail.model.freezed.dart';
part 'mail.model.g.dart';

@freezed
class Mail with _$Mail {
  factory Mail({
    int? id,
    String? subject,
    String? body,
    String? link,
    bool? isRead,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Mail;

  factory Mail.fromJson(Map<String, dynamic> json) => _$MailFromJson(json);
}
