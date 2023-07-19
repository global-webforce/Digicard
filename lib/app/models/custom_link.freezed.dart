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
  @FormControlAnnotation()
  String? get text => throw _privateConstructorUsedError;
  @FormControlAnnotation()
  String? get label => throw _privateConstructorUsedError;
  @FormControlAnnotation()
  String? get type => throw _privateConstructorUsedError;

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
      {@FormControlAnnotation() String? text,
      @FormControlAnnotation() String? label,
      @FormControlAnnotation() String? type});
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
    Object? text = freezed,
    Object? label = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CustomLinkCopyWith<$Res>
    implements $CustomLinkCopyWith<$Res> {
  factory _$$_CustomLinkCopyWith(
          _$_CustomLink value, $Res Function(_$_CustomLink) then) =
      __$$_CustomLinkCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@FormControlAnnotation() String? text,
      @FormControlAnnotation() String? label,
      @FormControlAnnotation() String? type});
}

/// @nodoc
class __$$_CustomLinkCopyWithImpl<$Res>
    extends _$CustomLinkCopyWithImpl<$Res, _$_CustomLink>
    implements _$$_CustomLinkCopyWith<$Res> {
  __$$_CustomLinkCopyWithImpl(
      _$_CustomLink _value, $Res Function(_$_CustomLink) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? label = freezed,
    Object? type = freezed,
  }) {
    return _then(_$_CustomLink(
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      label: freezed == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_CustomLink implements _CustomLink {
  _$_CustomLink(
      {@FormControlAnnotation() this.text,
      @FormControlAnnotation() this.label,
      @FormControlAnnotation() this.type});

  factory _$_CustomLink.fromJson(Map<String, dynamic> json) =>
      _$$_CustomLinkFromJson(json);

  @override
  @FormControlAnnotation()
  final String? text;
  @override
  @FormControlAnnotation()
  final String? label;
  @override
  @FormControlAnnotation()
  final String? type;

  @override
  String toString() {
    return 'CustomLink(text: $text, label: $label, type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CustomLink &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, text, label, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CustomLinkCopyWith<_$_CustomLink> get copyWith =>
      __$$_CustomLinkCopyWithImpl<_$_CustomLink>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CustomLinkToJson(
      this,
    );
  }
}

abstract class _CustomLink implements CustomLink {
  factory _CustomLink(
      {@FormControlAnnotation() final String? text,
      @FormControlAnnotation() final String? label,
      @FormControlAnnotation() final String? type}) = _$_CustomLink;

  factory _CustomLink.fromJson(Map<String, dynamic> json) =
      _$_CustomLink.fromJson;

  @override
  @FormControlAnnotation()
  String? get text;
  @override
  @FormControlAnnotation()
  String? get label;
  @override
  @FormControlAnnotation()
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$_CustomLinkCopyWith<_$_CustomLink> get copyWith =>
      throw _privateConstructorUsedError;
}
