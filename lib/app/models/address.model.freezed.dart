// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
mixin _$Address {
  int? get postcode => throw _privateConstructorUsedError;
  @JsonKey(name: 'place_name')
  String? get placeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'state_name')
  String? get stateName => throw _privateConstructorUsedError;
  @JsonKey(name: 'state_code')
  String? get stateCode => throw _privateConstructorUsedError;
  double? get latitude => throw _privateConstructorUsedError;
  double? get longitude => throw _privateConstructorUsedError;
  int? get accuracy => throw _privateConstructorUsedError;
  @JsonKey(name: 'full_address')
  String? get fullAddress => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res, Address>;
  @useResult
  $Res call(
      {int? postcode,
      @JsonKey(name: 'place_name') String? placeName,
      @JsonKey(name: 'state_name') String? stateName,
      @JsonKey(name: 'state_code') String? stateCode,
      double? latitude,
      double? longitude,
      int? accuracy,
      @JsonKey(name: 'full_address') String? fullAddress});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res, $Val extends Address>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postcode = freezed,
    Object? placeName = freezed,
    Object? stateName = freezed,
    Object? stateCode = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? accuracy = freezed,
    Object? fullAddress = freezed,
  }) {
    return _then(_value.copyWith(
      postcode: freezed == postcode
          ? _value.postcode
          : postcode // ignore: cast_nullable_to_non_nullable
              as int?,
      placeName: freezed == placeName
          ? _value.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String?,
      stateName: freezed == stateName
          ? _value.stateName
          : stateName // ignore: cast_nullable_to_non_nullable
              as String?,
      stateCode: freezed == stateCode
          ? _value.stateCode
          : stateCode // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      accuracy: freezed == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as int?,
      fullAddress: freezed == fullAddress
          ? _value.fullAddress
          : fullAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddressCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$_AddressCopyWith(
          _$_Address value, $Res Function(_$_Address) then) =
      __$$_AddressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? postcode,
      @JsonKey(name: 'place_name') String? placeName,
      @JsonKey(name: 'state_name') String? stateName,
      @JsonKey(name: 'state_code') String? stateCode,
      double? latitude,
      double? longitude,
      int? accuracy,
      @JsonKey(name: 'full_address') String? fullAddress});
}

/// @nodoc
class __$$_AddressCopyWithImpl<$Res>
    extends _$AddressCopyWithImpl<$Res, _$_Address>
    implements _$$_AddressCopyWith<$Res> {
  __$$_AddressCopyWithImpl(_$_Address _value, $Res Function(_$_Address) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? postcode = freezed,
    Object? placeName = freezed,
    Object? stateName = freezed,
    Object? stateCode = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? accuracy = freezed,
    Object? fullAddress = freezed,
  }) {
    return _then(_$_Address(
      postcode: freezed == postcode
          ? _value.postcode
          : postcode // ignore: cast_nullable_to_non_nullable
              as int?,
      placeName: freezed == placeName
          ? _value.placeName
          : placeName // ignore: cast_nullable_to_non_nullable
              as String?,
      stateName: freezed == stateName
          ? _value.stateName
          : stateName // ignore: cast_nullable_to_non_nullable
              as String?,
      stateCode: freezed == stateCode
          ? _value.stateCode
          : stateCode // ignore: cast_nullable_to_non_nullable
              as String?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      accuracy: freezed == accuracy
          ? _value.accuracy
          : accuracy // ignore: cast_nullable_to_non_nullable
              as int?,
      fullAddress: freezed == fullAddress
          ? _value.fullAddress
          : fullAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Address implements _Address {
  _$_Address(
      {this.postcode,
      @JsonKey(name: 'place_name') this.placeName,
      @JsonKey(name: 'state_name') this.stateName,
      @JsonKey(name: 'state_code') this.stateCode,
      this.latitude,
      this.longitude,
      this.accuracy,
      @JsonKey(name: 'full_address') this.fullAddress});

  factory _$_Address.fromJson(Map<String, dynamic> json) =>
      _$$_AddressFromJson(json);

  @override
  final int? postcode;
  @override
  @JsonKey(name: 'place_name')
  final String? placeName;
  @override
  @JsonKey(name: 'state_name')
  final String? stateName;
  @override
  @JsonKey(name: 'state_code')
  final String? stateCode;
  @override
  final double? latitude;
  @override
  final double? longitude;
  @override
  final int? accuracy;
  @override
  @JsonKey(name: 'full_address')
  final String? fullAddress;

  @override
  String toString() {
    return 'Address(postcode: $postcode, placeName: $placeName, stateName: $stateName, stateCode: $stateCode, latitude: $latitude, longitude: $longitude, accuracy: $accuracy, fullAddress: $fullAddress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Address &&
            (identical(other.postcode, postcode) ||
                other.postcode == postcode) &&
            (identical(other.placeName, placeName) ||
                other.placeName == placeName) &&
            (identical(other.stateName, stateName) ||
                other.stateName == stateName) &&
            (identical(other.stateCode, stateCode) ||
                other.stateCode == stateCode) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.accuracy, accuracy) ||
                other.accuracy == accuracy) &&
            (identical(other.fullAddress, fullAddress) ||
                other.fullAddress == fullAddress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, postcode, placeName, stateName,
      stateCode, latitude, longitude, accuracy, fullAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddressCopyWith<_$_Address> get copyWith =>
      __$$_AddressCopyWithImpl<_$_Address>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddressToJson(
      this,
    );
  }
}

abstract class _Address implements Address {
  factory _Address(
      {final int? postcode,
      @JsonKey(name: 'place_name') final String? placeName,
      @JsonKey(name: 'state_name') final String? stateName,
      @JsonKey(name: 'state_code') final String? stateCode,
      final double? latitude,
      final double? longitude,
      final int? accuracy,
      @JsonKey(name: 'full_address') final String? fullAddress}) = _$_Address;

  factory _Address.fromJson(Map<String, dynamic> json) = _$_Address.fromJson;

  @override
  int? get postcode;
  @override
  @JsonKey(name: 'place_name')
  String? get placeName;
  @override
  @JsonKey(name: 'state_name')
  String? get stateName;
  @override
  @JsonKey(name: 'state_code')
  String? get stateCode;
  @override
  double? get latitude;
  @override
  double? get longitude;
  @override
  int? get accuracy;
  @override
  @JsonKey(name: 'full_address')
  String? get fullAddress;
  @override
  @JsonKey(ignore: true)
  _$$_AddressCopyWith<_$_Address> get copyWith =>
      throw _privateConstructorUsedError;
}
