import 'package:freezed_annotation/freezed_annotation.dart';

part 'push_notification.model.freezed.dart';
part 'push_notification.model.g.dart';

@freezed
class PushNotification with _$PushNotification {
  factory PushNotification({
    int? id,
    @JsonKey(name: 'user_id') int? userId,
    String? notification,
    String? link,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
    String? type,
  }) = _PushNotification;

  factory PushNotification.fromJson(Map<String, dynamic> json) =>
      _$PushNotificationFromJson(json);
}
