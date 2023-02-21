// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_name')
  String? get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_name')
  String? get lastName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'birth_date')
  dynamic get birthDate => throw _privateConstructorUsedError;
  dynamic get gender => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_verified_at')
  dynamic get emailVerifiedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'mobile_number')
  dynamic get mobileNumber => throw _privateConstructorUsedError;
  dynamic get role => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_pic')
  dynamic get profilePic => throw _privateConstructorUsedError;
  Profile? get profile => throw _privateConstructorUsedError;
  Address? get address => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      String? email,
      @JsonKey(name: 'birth_date') dynamic birthDate,
      dynamic gender,
      @JsonKey(name: 'email_verified_at') dynamic emailVerifiedAt,
      @JsonKey(name: 'mobile_number') dynamic mobileNumber,
      dynamic role,
      @JsonKey(name: 'profile_pic') dynamic profilePic,
      Profile? profile,
      Address? address});

  $ProfileCopyWith<$Res>? get profile;
  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

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
    Object? birthDate = freezed,
    Object? gender = freezed,
    Object? emailVerifiedAt = freezed,
    Object? mobileNumber = freezed,
    Object? role = freezed,
    Object? profilePic = freezed,
    Object? profile = freezed,
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
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as dynamic,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as dynamic,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as dynamic,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res>? get profile {
    if (_value.profile == null) {
      return null;
    }

    return $ProfileCopyWith<$Res>(_value.profile!, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'first_name') String? firstName,
      @JsonKey(name: 'last_name') String? lastName,
      String? email,
      @JsonKey(name: 'birth_date') dynamic birthDate,
      dynamic gender,
      @JsonKey(name: 'email_verified_at') dynamic emailVerifiedAt,
      @JsonKey(name: 'mobile_number') dynamic mobileNumber,
      dynamic role,
      @JsonKey(name: 'profile_pic') dynamic profilePic,
      Profile? profile,
      Address? address});

  @override
  $ProfileCopyWith<$Res>? get profile;
  @override
  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? email = freezed,
    Object? birthDate = freezed,
    Object? gender = freezed,
    Object? emailVerifiedAt = freezed,
    Object? mobileNumber = freezed,
    Object? role = freezed,
    Object? profilePic = freezed,
    Object? profile = freezed,
    Object? address = freezed,
  }) {
    return _then(_$_User(
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
      birthDate: freezed == birthDate
          ? _value.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as dynamic,
      emailVerifiedAt: freezed == emailVerifiedAt
          ? _value.emailVerifiedAt
          : emailVerifiedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      mobileNumber: freezed == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      role: freezed == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as dynamic,
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as dynamic,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  _$_User(
      {this.id,
      @JsonKey(name: 'first_name') this.firstName,
      @JsonKey(name: 'last_name') this.lastName,
      this.email,
      @JsonKey(name: 'birth_date') this.birthDate,
      this.gender,
      @JsonKey(name: 'email_verified_at') this.emailVerifiedAt,
      @JsonKey(name: 'mobile_number') this.mobileNumber,
      this.role,
      @JsonKey(name: 'profile_pic') this.profilePic,
      this.profile,
      this.address});

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

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
  @JsonKey(name: 'birth_date')
  final dynamic birthDate;
  @override
  final dynamic gender;
  @override
  @JsonKey(name: 'email_verified_at')
  final dynamic emailVerifiedAt;
  @override
  @JsonKey(name: 'mobile_number')
  final dynamic mobileNumber;
  @override
  final dynamic role;
  @override
  @JsonKey(name: 'profile_pic')
  final dynamic profilePic;
  @override
  final Profile? profile;
  @override
  final Address? address;

  @override
  String toString() {
    return 'User(id: $id, firstName: $firstName, lastName: $lastName, email: $email, birthDate: $birthDate, gender: $gender, emailVerifiedAt: $emailVerifiedAt, mobileNumber: $mobileNumber, role: $role, profilePic: $profilePic, profile: $profile, address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality().equals(other.birthDate, birthDate) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality()
                .equals(other.emailVerifiedAt, emailVerifiedAt) &&
            const DeepCollectionEquality()
                .equals(other.mobileNumber, mobileNumber) &&
            const DeepCollectionEquality().equals(other.role, role) &&
            const DeepCollectionEquality()
                .equals(other.profilePic, profilePic) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      firstName,
      lastName,
      email,
      const DeepCollectionEquality().hash(birthDate),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(emailVerifiedAt),
      const DeepCollectionEquality().hash(mobileNumber),
      const DeepCollectionEquality().hash(role),
      const DeepCollectionEquality().hash(profilePic),
      profile,
      address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User implements User {
  factory _User(
      {final int? id,
      @JsonKey(name: 'first_name') final String? firstName,
      @JsonKey(name: 'last_name') final String? lastName,
      final String? email,
      @JsonKey(name: 'birth_date') final dynamic birthDate,
      final dynamic gender,
      @JsonKey(name: 'email_verified_at') final dynamic emailVerifiedAt,
      @JsonKey(name: 'mobile_number') final dynamic mobileNumber,
      final dynamic role,
      @JsonKey(name: 'profile_pic') final dynamic profilePic,
      final Profile? profile,
      final Address? address}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

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
  @JsonKey(name: 'birth_date')
  dynamic get birthDate;
  @override
  dynamic get gender;
  @override
  @JsonKey(name: 'email_verified_at')
  dynamic get emailVerifiedAt;
  @override
  @JsonKey(name: 'mobile_number')
  dynamic get mobileNumber;
  @override
  dynamic get role;
  @override
  @JsonKey(name: 'profile_pic')
  dynamic get profilePic;
  @override
  Profile? get profile;
  @override
  Address? get address;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
