// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reset_password_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResetPasswordDto _$ResetPasswordDtoFromJson(Map<String, dynamic> json) {
  return _ResetPasswordDto.fromJson(json);
}

/// @nodoc
mixin _$ResetPasswordDto {
  @RfControl(validators: [RequiredValidator()])
  String? get password => throw _privateConstructorUsedError;
  @RfControl(validators: [
    RequiredValidator(),
    MustMatchValidatorCustom('password', 'passwordConfirmation', true)
  ])
  String? get passwordConfirmation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResetPasswordDtoCopyWith<ResetPasswordDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResetPasswordDtoCopyWith<$Res> {
  factory $ResetPasswordDtoCopyWith(
          ResetPasswordDto value, $Res Function(ResetPasswordDto) then) =
      _$ResetPasswordDtoCopyWithImpl<$Res, ResetPasswordDto>;
  @useResult
  $Res call(
      {@RfControl(validators: [RequiredValidator()]) String? password,
      @RfControl(validators: [
        RequiredValidator(),
        MustMatchValidatorCustom('password', 'passwordConfirmation', true)
      ])
      String? passwordConfirmation});
}

/// @nodoc
class _$ResetPasswordDtoCopyWithImpl<$Res, $Val extends ResetPasswordDto>
    implements $ResetPasswordDtoCopyWith<$Res> {
  _$ResetPasswordDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = freezed,
    Object? passwordConfirmation = freezed,
  }) {
    return _then(_value.copyWith(
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordConfirmation: freezed == passwordConfirmation
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResetPasswordDtoImplCopyWith<$Res>
    implements $ResetPasswordDtoCopyWith<$Res> {
  factory _$$ResetPasswordDtoImplCopyWith(_$ResetPasswordDtoImpl value,
          $Res Function(_$ResetPasswordDtoImpl) then) =
      __$$ResetPasswordDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@RfControl(validators: [RequiredValidator()]) String? password,
      @RfControl(validators: [
        RequiredValidator(),
        MustMatchValidatorCustom('password', 'passwordConfirmation', true)
      ])
      String? passwordConfirmation});
}

/// @nodoc
class __$$ResetPasswordDtoImplCopyWithImpl<$Res>
    extends _$ResetPasswordDtoCopyWithImpl<$Res, _$ResetPasswordDtoImpl>
    implements _$$ResetPasswordDtoImplCopyWith<$Res> {
  __$$ResetPasswordDtoImplCopyWithImpl(_$ResetPasswordDtoImpl _value,
      $Res Function(_$ResetPasswordDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = freezed,
    Object? passwordConfirmation = freezed,
  }) {
    return _then(_$ResetPasswordDtoImpl(
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      passwordConfirmation: freezed == passwordConfirmation
          ? _value.passwordConfirmation
          : passwordConfirmation // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$ResetPasswordDtoImpl implements _ResetPasswordDto {
  _$ResetPasswordDtoImpl(
      {@RfControl(validators: [RequiredValidator()]) this.password,
      @RfControl(validators: [
        RequiredValidator(),
        MustMatchValidatorCustom('password', 'passwordConfirmation', true)
      ])
      this.passwordConfirmation});

  factory _$ResetPasswordDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResetPasswordDtoImplFromJson(json);

  @override
  @RfControl(validators: [RequiredValidator()])
  final String? password;
  @override
  @RfControl(validators: [
    RequiredValidator(),
    MustMatchValidatorCustom('password', 'passwordConfirmation', true)
  ])
  final String? passwordConfirmation;

  @override
  String toString() {
    return 'ResetPasswordDto(password: $password, passwordConfirmation: $passwordConfirmation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetPasswordDtoImpl &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.passwordConfirmation, passwordConfirmation) ||
                other.passwordConfirmation == passwordConfirmation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, password, passwordConfirmation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResetPasswordDtoImplCopyWith<_$ResetPasswordDtoImpl> get copyWith =>
      __$$ResetPasswordDtoImplCopyWithImpl<_$ResetPasswordDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResetPasswordDtoImplToJson(
      this,
    );
  }
}

abstract class _ResetPasswordDto implements ResetPasswordDto {
  factory _ResetPasswordDto(
      {@RfControl(validators: [RequiredValidator()]) final String? password,
      @RfControl(validators: [
        RequiredValidator(),
        MustMatchValidatorCustom('password', 'passwordConfirmation', true)
      ])
      final String? passwordConfirmation}) = _$ResetPasswordDtoImpl;

  factory _ResetPasswordDto.fromJson(Map<String, dynamic> json) =
      _$ResetPasswordDtoImpl.fromJson;

  @override
  @RfControl(validators: [RequiredValidator()])
  String? get password;
  @override
  @RfControl(validators: [
    RequiredValidator(),
    MustMatchValidatorCustom('password', 'passwordConfirmation', true)
  ])
  String? get passwordConfirmation;
  @override
  @JsonKey(ignore: true)
  _$$ResetPasswordDtoImplCopyWith<_$ResetPasswordDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
