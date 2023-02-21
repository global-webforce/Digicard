// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'push_notification.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PushNotification _$PushNotificationFromJson(Map<String, dynamic> json) {
  return _PushNotification.fromJson(json);
}

/// @nodoc
mixin _$PushNotification {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  String? get notification => throw _privateConstructorUsedError;
  String? get link => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PushNotificationCopyWith<PushNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PushNotificationCopyWith<$Res> {
  factory $PushNotificationCopyWith(
          PushNotification value, $Res Function(PushNotification) then) =
      _$PushNotificationCopyWithImpl<$Res, PushNotification>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'user_id') int? userId,
      String? notification,
      String? link,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      String? type});
}

/// @nodoc
class _$PushNotificationCopyWithImpl<$Res, $Val extends PushNotification>
    implements $PushNotificationCopyWith<$Res> {
  _$PushNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? notification = freezed,
    Object? link = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      notification: freezed == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PushNotificationCopyWith<$Res>
    implements $PushNotificationCopyWith<$Res> {
  factory _$$_PushNotificationCopyWith(
          _$_PushNotification value, $Res Function(_$_PushNotification) then) =
      __$$_PushNotificationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'user_id') int? userId,
      String? notification,
      String? link,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt,
      String? type});
}

/// @nodoc
class __$$_PushNotificationCopyWithImpl<$Res>
    extends _$PushNotificationCopyWithImpl<$Res, _$_PushNotification>
    implements _$$_PushNotificationCopyWith<$Res> {
  __$$_PushNotificationCopyWithImpl(
      _$_PushNotification _value, $Res Function(_$_PushNotification) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? notification = freezed,
    Object? link = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_PushNotification(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      notification: freezed == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PushNotification implements _PushNotification {
  _$_PushNotification(
      {this.id,
      @JsonKey(name: 'user_id') this.userId,
      this.notification,
      this.link,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt,
      this.type});

  factory _$_PushNotification.fromJson(Map<String, dynamic> json) =>
      _$$_PushNotificationFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  final String? notification;
  @override
  final String? link;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  @override
  final String? type;

  @override
  String toString() {
    return 'PushNotification(id: $id, userId: $userId, notification: $notification, link: $link, createdAt: $createdAt, updatedAt: $updatedAt, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PushNotification &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.notification, notification) ||
                other.notification == notification) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, notification, link, createdAt, updatedAt, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PushNotificationCopyWith<_$_PushNotification> get copyWith =>
      __$$_PushNotificationCopyWithImpl<_$_PushNotification>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PushNotificationToJson(
      this,
    );
  }
}

abstract class _PushNotification implements PushNotification {
  factory _PushNotification(
      {final int? id,
      @JsonKey(name: 'user_id') final int? userId,
      final String? notification,
      final String? link,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt,
      final String? type}) = _$_PushNotification;

  factory _PushNotification.fromJson(Map<String, dynamic> json) =
      _$_PushNotification.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  String? get notification;
  @override
  String? get link;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$_PushNotificationCopyWith<_$_PushNotification> get copyWith =>
      throw _privateConstructorUsedError;
}
