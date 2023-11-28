// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'custom_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CustomLink _$CustomLinkFromJson(Map<String, dynamic> json) {
  return _CustomLink.fromJson(json);
}

/// @nodoc
mixin _$CustomLink {
  String? get value => throw _privateConstructorUsedError;
  String? get custom => throw _privateConstructorUsedError;
  String? get label => throw _privateConstructorUsedError;
  String? get prefixLink => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  Widget? get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CustomLinkCopyWith<CustomLink> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomLinkCopyWith<$Res> {
  factory $CustomLinkCopyWith(
          CustomLink value, $Res Function(CustomLink) then) =
      _$CustomLinkCopyWithImpl<$Res, CustomLink>;
  @useResult
  $Res call(
      {String? value,
      String? custom,
      String? label,
      String? prefixLink,
      @JsonKey(includeFromJson: false, includeToJson: false) Widget? icon});
}

/// @nodoc
class _$CustomLinkCopyWithImpl<$Res, $Val extends CustomLink>
    implements $CustomLinkCopyWith<$Res> {
  _$CustomLinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? custom = freezed,
    Object? label = freezed,
    Object? prefixLink = freezed,
    Object? icon = freezed,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      custom: freezed == custom
          ? _value.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      prefixLink: freezed == prefixLink
          ? _value.prefixLink
          : prefixLink // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Widget?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomLinkImplCopyWith<$Res>
    implements $CustomLinkCopyWith<$Res> {
  factory _$$CustomLinkImplCopyWith(
          _$CustomLinkImpl value, $Res Function(_$CustomLinkImpl) then) =
      __$$CustomLinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? value,
      String? custom,
      String? label,
      String? prefixLink,
      @JsonKey(includeFromJson: false, includeToJson: false) Widget? icon});
}

/// @nodoc
class __$$CustomLinkImplCopyWithImpl<$Res>
    extends _$CustomLinkCopyWithImpl<$Res, _$CustomLinkImpl>
    implements _$$CustomLinkImplCopyWith<$Res> {
  __$$CustomLinkImplCopyWithImpl(
      _$CustomLinkImpl _value, $Res Function(_$CustomLinkImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? custom = freezed,
    Object? label = freezed,
    Object? prefixLink = freezed,
    Object? icon = freezed,
  }) {
    return _then(_$CustomLinkImpl(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      custom: freezed == custom
          ? _value.custom
          : custom // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      prefixLink: freezed == prefixLink
          ? _value.prefixLink
          : prefixLink // ignore: cast_nullable_to_non_nullable
              as String?,
      icon: freezed == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as Widget?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$CustomLinkImpl implements _CustomLink {
  _$CustomLinkImpl(
      {this.value = "",
      this.custom = "",
      this.label = "Info",
      this.prefixLink = "",
      @JsonKey(includeFromJson: false, includeToJson: false) this.icon});

  factory _$CustomLinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomLinkImplFromJson(json);

  @override
  @JsonKey()
  final String? value;
  @override
  @JsonKey()
  final String? custom;
  @override
  @JsonKey()
  final String? label;
  @override
  @JsonKey()
  final String? prefixLink;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final Widget? icon;

  @override
  String toString() {
    return 'CustomLink(value: $value, custom: $custom, label: $label, prefixLink: $prefixLink, icon: $icon)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomLinkImpl &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.custom, custom) || other.custom == custom) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.prefixLink, prefixLink) ||
                other.prefixLink == prefixLink) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, value, custom, label, prefixLink, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomLinkImplCopyWith<_$CustomLinkImpl> get copyWith =>
      __$$CustomLinkImplCopyWithImpl<_$CustomLinkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomLinkImplToJson(
      this,
    );
  }
}

abstract class _CustomLink implements CustomLink {
  factory _CustomLink(
      {final String? value,
      final String? custom,
      final String? label,
      final String? prefixLink,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final Widget? icon}) = _$CustomLinkImpl;

  factory _CustomLink.fromJson(Map<String, dynamic> json) =
      _$CustomLinkImpl.fromJson;

  @override
  String? get value;
  @override
  String? get custom;
  @override
  String? get label;
  @override
  String? get prefixLink;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  Widget? get icon;
  @override
  @JsonKey(ignore: true)
  _$$CustomLinkImplCopyWith<_$CustomLinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
