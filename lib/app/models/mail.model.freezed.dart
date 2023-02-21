// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mail.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Mail _$MailFromJson(Map<String, dynamic> json) {
  return _Mail.fromJson(json);
}

/// @nodoc
mixin _$Mail {
  int? get id => throw _privateConstructorUsedError;
  String? get subject => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  String? get link => throw _privateConstructorUsedError;
  bool? get isRead => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MailCopyWith<Mail> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MailCopyWith<$Res> {
  factory $MailCopyWith(Mail value, $Res Function(Mail) then) =
      _$MailCopyWithImpl<$Res, Mail>;
  @useResult
  $Res call(
      {int? id,
      String? subject,
      String? body,
      String? link,
      bool? isRead,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class _$MailCopyWithImpl<$Res, $Val extends Mail>
    implements $MailCopyWith<$Res> {
  _$MailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? subject = freezed,
    Object? body = freezed,
    Object? link = freezed,
    Object? isRead = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      isRead: freezed == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MailCopyWith<$Res> implements $MailCopyWith<$Res> {
  factory _$$_MailCopyWith(_$_Mail value, $Res Function(_$_Mail) then) =
      __$$_MailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? subject,
      String? body,
      String? link,
      bool? isRead,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'updated_at') DateTime? updatedAt});
}

/// @nodoc
class __$$_MailCopyWithImpl<$Res> extends _$MailCopyWithImpl<$Res, _$_Mail>
    implements _$$_MailCopyWith<$Res> {
  __$$_MailCopyWithImpl(_$_Mail _value, $Res Function(_$_Mail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? subject = freezed,
    Object? body = freezed,
    Object? link = freezed,
    Object? isRead = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_Mail(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      subject: freezed == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      isRead: freezed == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Mail implements _Mail {
  _$_Mail(
      {this.id,
      this.subject,
      this.body,
      this.link,
      this.isRead,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$_Mail.fromJson(Map<String, dynamic> json) => _$$_MailFromJson(json);

  @override
  final int? id;
  @override
  final String? subject;
  @override
  final String? body;
  @override
  final String? link;
  @override
  final bool? isRead;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'Mail(id: $id, subject: $subject, body: $body, link: $link, isRead: $isRead, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Mail &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, subject, body, link, isRead, createdAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MailCopyWith<_$_Mail> get copyWith =>
      __$$_MailCopyWithImpl<_$_Mail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MailToJson(
      this,
    );
  }
}

abstract class _Mail implements Mail {
  factory _Mail(
      {final int? id,
      final String? subject,
      final String? body,
      final String? link,
      final bool? isRead,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'updated_at') final DateTime? updatedAt}) = _$_Mail;

  factory _Mail.fromJson(Map<String, dynamic> json) = _$_Mail.fromJson;

  @override
  int? get id;
  @override
  String? get subject;
  @override
  String? get body;
  @override
  String? get link;
  @override
  bool? get isRead;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_MailCopyWith<_$_Mail> get copyWith => throw _privateConstructorUsedError;
}
