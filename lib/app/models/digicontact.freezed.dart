// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'digicontact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DigiContact _$DigiContactFromJson(Map<String, dynamic> json) {
  return _DigiContact.fromJson(json);
}

/// @nodoc
mixin _$DigiContact {
  int get id => throw _privateConstructorUsedError;
  DigitalCard get card => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DigiContactCopyWith<DigiContact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DigiContactCopyWith<$Res> {
  factory $DigiContactCopyWith(
          DigiContact value, $Res Function(DigiContact) then) =
      _$DigiContactCopyWithImpl<$Res, DigiContact>;
  @useResult
  $Res call({int id, DigitalCard card, DateTime createdAt});

  $DigitalCardCopyWith<$Res> get card;
}

/// @nodoc
class _$DigiContactCopyWithImpl<$Res, $Val extends DigiContact>
    implements $DigiContactCopyWith<$Res> {
  _$DigiContactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? card = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as DigitalCard,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DigitalCardCopyWith<$Res> get card {
    return $DigitalCardCopyWith<$Res>(_value.card, (value) {
      return _then(_value.copyWith(card: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DigiContactCopyWith<$Res>
    implements $DigiContactCopyWith<$Res> {
  factory _$$_DigiContactCopyWith(
          _$_DigiContact value, $Res Function(_$_DigiContact) then) =
      __$$_DigiContactCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, DigitalCard card, DateTime createdAt});

  @override
  $DigitalCardCopyWith<$Res> get card;
}

/// @nodoc
class __$$_DigiContactCopyWithImpl<$Res>
    extends _$DigiContactCopyWithImpl<$Res, _$_DigiContact>
    implements _$$_DigiContactCopyWith<$Res> {
  __$$_DigiContactCopyWithImpl(
      _$_DigiContact _value, $Res Function(_$_DigiContact) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? card = null,
    Object? createdAt = null,
  }) {
    return _then(_$_DigiContact(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      card: null == card
          ? _value.card
          : card // ignore: cast_nullable_to_non_nullable
              as DigitalCard,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_DigiContact implements _DigiContact {
  _$_DigiContact(
      {required this.id, required this.card, required this.createdAt});

  factory _$_DigiContact.fromJson(Map<String, dynamic> json) =>
      _$$_DigiContactFromJson(json);

  @override
  final int id;
  @override
  final DigitalCard card;
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'DigiContact(id: $id, card: $card, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DigiContact &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.card, card) || other.card == card) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, card, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DigiContactCopyWith<_$_DigiContact> get copyWith =>
      __$$_DigiContactCopyWithImpl<_$_DigiContact>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DigiContactToJson(
      this,
    );
  }
}

abstract class _DigiContact implements DigiContact {
  factory _DigiContact(
      {required final int id,
      required final DigitalCard card,
      required final DateTime createdAt}) = _$_DigiContact;

  factory _DigiContact.fromJson(Map<String, dynamic> json) =
      _$_DigiContact.fromJson;

  @override
  int get id;
  @override
  DigitalCard get card;
  @override
  DateTime get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_DigiContactCopyWith<_$_DigiContact> get copyWith =>
      throw _privateConstructorUsedError;
}
