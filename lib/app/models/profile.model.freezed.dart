// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
mixin _$Profile {
  double? get weight => throw _privateConstructorUsedError;
  double? get height => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_id')
  int? get companyId => throw _privateConstructorUsedError;
  int? get verified => throw _privateConstructorUsedError;
  @JsonKey(name: 'short_bio')
  String? get shortBio => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call(
      {double? weight,
      double? height,
      @JsonKey(name: 'company_id') int? companyId,
      int? verified,
      @JsonKey(name: 'short_bio') String? shortBio});
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weight = freezed,
    Object? height = freezed,
    Object? companyId = freezed,
    Object? verified = freezed,
    Object? shortBio = freezed,
  }) {
    return _then(_value.copyWith(
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int?,
      verified: freezed == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as int?,
      shortBio: freezed == shortBio
          ? _value.shortBio
          : shortBio // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$_ProfileCopyWith(
          _$_Profile value, $Res Function(_$_Profile) then) =
      __$$_ProfileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double? weight,
      double? height,
      @JsonKey(name: 'company_id') int? companyId,
      int? verified,
      @JsonKey(name: 'short_bio') String? shortBio});
}

/// @nodoc
class __$$_ProfileCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$_Profile>
    implements _$$_ProfileCopyWith<$Res> {
  __$$_ProfileCopyWithImpl(_$_Profile _value, $Res Function(_$_Profile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weight = freezed,
    Object? height = freezed,
    Object? companyId = freezed,
    Object? verified = freezed,
    Object? shortBio = freezed,
  }) {
    return _then(_$_Profile(
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as int?,
      verified: freezed == verified
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as int?,
      shortBio: freezed == shortBio
          ? _value.shortBio
          : shortBio // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Profile implements _Profile {
  _$_Profile(
      {this.weight,
      this.height,
      @JsonKey(name: 'company_id') this.companyId,
      this.verified,
      @JsonKey(name: 'short_bio') this.shortBio});

  factory _$_Profile.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileFromJson(json);

  @override
  final double? weight;
  @override
  final double? height;
  @override
  @JsonKey(name: 'company_id')
  final int? companyId;
  @override
  final int? verified;
  @override
  @JsonKey(name: 'short_bio')
  final String? shortBio;

  @override
  String toString() {
    return 'Profile(weight: $weight, height: $height, companyId: $companyId, verified: $verified, shortBio: $shortBio)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Profile &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.verified, verified) ||
                other.verified == verified) &&
            (identical(other.shortBio, shortBio) ||
                other.shortBio == shortBio));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, weight, height, companyId, verified, shortBio);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileCopyWith<_$_Profile> get copyWith =>
      __$$_ProfileCopyWithImpl<_$_Profile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileToJson(
      this,
    );
  }
}

abstract class _Profile implements Profile {
  factory _Profile(
      {final double? weight,
      final double? height,
      @JsonKey(name: 'company_id') final int? companyId,
      final int? verified,
      @JsonKey(name: 'short_bio') final String? shortBio}) = _$_Profile;

  factory _Profile.fromJson(Map<String, dynamic> json) = _$_Profile.fromJson;

  @override
  double? get weight;
  @override
  double? get height;
  @override
  @JsonKey(name: 'company_id')
  int? get companyId;
  @override
  int? get verified;
  @override
  @JsonKey(name: 'short_bio')
  String? get shortBio;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileCopyWith<_$_Profile> get copyWith =>
      throw _privateConstructorUsedError;
}
