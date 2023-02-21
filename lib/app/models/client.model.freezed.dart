// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Client _$ClientFromJson(Map<String, dynamic> json) {
  return _Client.fromJson(json);
}

/// @nodoc
mixin _$Client {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_verified_at')
  dynamic get emailVerifiedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobile_number')
  String? get mobileNumber => throw _privateConstructorUsedError;
  dynamic get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_pic')
  dynamic get profilePic => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_id')
  dynamic get companyId => throw _privateConstructorUsedError;
  dynamic get gender => throw _privateConstructorUsedError;
  dynamic get age => throw _privateConstructorUsedError;
  dynamic get height => throw _privateConstructorUsedError;
  dynamic get weight => throw _privateConstructorUsedError;
  @JsonKey(name: 'birth_date')
  dynamic get birthDate => throw _privateConstructorUsedError;
  dynamic get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ClientCopyWith<Client> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClientCopyWith<$Res> {
  factory $ClientCopyWith(Client value, $Res Function(Client) then) =
      _$ClientCopyWithImpl<$Res, Client>;
  @useResult
  $Res call(
      {int? id,
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
      dynamic address});
}

/// @nodoc
class _$ClientCopyWithImpl<$Res, $Val extends Client>
    implements $ClientCopyWith<$Res> {
  _$ClientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? emailVerifiedAt = freezed,
    Object? mobileNumber = freezed,
    Object? role = freezed,
    Object? profilePic = freezed,
    Object? companyId = freezed,
    Object? gender = freezed,
    Object? age = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? birthDate = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as dynamic,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as dynamic,
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as dynamic,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as dynamic,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as dynamic,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as dynamic,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ClientCopyWith<$Res> implements $ClientCopyWith<$Res> {
  factory _$$_ClientCopyWith(_$_Client value, $Res Function(_$_Client) then) =
      __$$_ClientCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
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
      dynamic address});
}

/// @nodoc
class __$$_ClientCopyWithImpl<$Res>
    extends _$ClientCopyWithImpl<$Res, _$_Client>
    implements _$$_ClientCopyWith<$Res> {
  __$$_ClientCopyWithImpl(_$_Client _value, $Res Function(_$_Client) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? emailVerifiedAt = freezed,
    Object? mobileNumber = freezed,
    Object? role = freezed,
    Object? profilePic = freezed,
    Object? companyId = freezed,
    Object? gender = freezed,
    Object? age = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? birthDate = freezed,
    Object? address = freezed,
  }) {
    return _then(_$_Client(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as dynamic,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as dynamic,
      companyId: freezed == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as dynamic,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as dynamic,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as dynamic,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as dynamic,
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Client implements _Client {
  _$_Client(
      {this.id,
      @JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      this.email,
      @JsonKey(name: 'email_verified_at') this.emailVerifiedAt,
      @JsonKey(name: 'mobile_number') this.mobileNumber,
      this.role,
      @JsonKey(name: 'profile_pic') this.profilePic,
      @JsonKey(name: 'company_id') this.companyId,
      this.gender,
      this.age,
      this.height,
      this.weight,
      @JsonKey(name: 'birth_date') this.birthDate,
      this.address});

  factory _$_Client.fromJson(Map<String, dynamic> json) =>
      _$$_ClientFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'first_name')
  final String? firstName;
  @override
  @JsonKey(name: 'last_name')
  final String? lastName;
  @override
  final String? email;
  @override
  @JsonKey(name: 'email_verified_at')
  final dynamic emailVerifiedAt;
  @override
  @JsonKey(name: 'mobile_number')
  final String? mobileNumber;
  @override
  final dynamic role;
  @override
  @JsonKey(name: 'profile_pic')
  final dynamic profilePic;
  @override
  @JsonKey(name: 'company_id')
  final dynamic companyId;
  @override
  final dynamic gender;
  @override
  final dynamic age;
  @override
  final dynamic height;
  @override
  final dynamic weight;
  @override
  @JsonKey(name: 'birth_date')
  final dynamic birthDate;
  @override
  final dynamic address;

  @override
  String toString() {
    return 'Client(id: $id, firstName: $firstName, lastName: $lastName, email: $email, emailVerifiedAt: $emailVerifiedAt, mobileNumber: $mobileNumber, role: $role, profilePic: $profilePic, companyId: $companyId, gender: $gender, age: $age, height: $height, weight: $weight, birthDate: $birthDate, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Client &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality()
                .equals(other.emailVerifiedAt, emailVerifiedAt) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            const DeepCollectionEquality().equals(other.role, role) &&
            const DeepCollectionEquality()
                .equals(other.profilePic, profilePic) &&
            const DeepCollectionEquality().equals(other.companyId, companyId) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.age, age) &&
            const DeepCollectionEquality().equals(other.height, height) &&
            const DeepCollectionEquality().equals(other.weight, weight) &&
            const DeepCollectionEquality().equals(other.birthDate, birthDate) &&
            const DeepCollectionEquality().equals(other.address, address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstName,
      lastName,
      email,
      const DeepCollectionEquality().hash(emailVerifiedAt),
      mobileNumber,
      const DeepCollectionEquality().hash(role),
      const DeepCollectionEquality().hash(profilePic),
      const DeepCollectionEquality().hash(companyId),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(age),
      const DeepCollectionEquality().hash(height),
      const DeepCollectionEquality().hash(weight),
      const DeepCollectionEquality().hash(birthDate),
      const DeepCollectionEquality().hash(address));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ClientCopyWith<_$_Client> get copyWith =>
      __$$_ClientCopyWithImpl<_$_Client>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ClientToJson(
      this,
    );
  }
}

abstract class _Client implements Client {
  factory _Client(
      {final int? id,
      @JsonKey(name: 'first_name') final String? firstName,
      @JsonKey(name: 'last_name') final String? lastName,
      final String? email,
      @JsonKey(name: 'email_verified_at') final dynamic emailVerifiedAt,
      @JsonKey(name: 'mobile_number') final String? mobileNumber,
      final dynamic role,
      @JsonKey(name: 'profile_pic') final dynamic profilePic,
      @JsonKey(name: 'company_id') final dynamic companyId,
      final dynamic gender,
      final dynamic age,
      final dynamic height,
      final dynamic weight,
      @JsonKey(name: 'birth_date') final dynamic birthDate,
      final dynamic address}) = _$_Client;

  factory _Client.fromJson(Map<String, dynamic> json) = _$_Client.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'first_name')
  String? get firstName;
  @override
  @JsonKey(name: 'last_name')
  String? get lastName;
  @override
  String? get email;
  @override
  @JsonKey(name: 'email_verified_at')
  dynamic get emailVerifiedAt;
  @override
  @JsonKey(name: 'mobile_number')
  String? get mobileNumber;
  @override
  dynamic get role;
  @override
  @JsonKey(name: 'profile_pic')
  dynamic get profilePic;
  @override
  @JsonKey(name: 'company_id')
  dynamic get companyId;
  @override
  dynamic get gender;
  @override
  dynamic get age;
  @override
  dynamic get height;
  @override
  dynamic get weight;
  @override
  @JsonKey(name: 'birth_date')
  dynamic get birthDate;
  @override
  dynamic get address;
  @override
  @JsonKey(ignore: true)
  _$$_ClientCopyWith<_$_Client> get copyWith =>
      throw _privateConstructorUsedError;
}
