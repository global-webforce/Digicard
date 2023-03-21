// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'digital_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DigitalCard _$DigitalCardFromJson(Map<String, dynamic> json) {
  return _DigitalCard.fromJson(json);
}

/// @nodoc
mixin _$DigitalCard {
  @FormControlAnnotation<int>()
  int? get id => throw _privateConstructorUsedError;
  @FormControlAnnotation<int>()
  int? get userId => throw _privateConstructorUsedError;
  @FormControlAnnotation<String>()
  String? get uuid => throw _privateConstructorUsedError;
  @FormControlAnnotation<String>()
  String? get title => throw _privateConstructorUsedError;
  @FormControlAnnotation<String>()
  String? get logoImage => throw _privateConstructorUsedError;
  @FormControlAnnotation<String>()
  String? get profileImage => throw _privateConstructorUsedError;
  @FormControlAnnotation<String>()
  String? get color => throw _privateConstructorUsedError;
  @FormGroupAnnotation()
  FullName? get fullname => throw _privateConstructorUsedError;
  @FormControlAnnotation<String>()
  String? get position => throw _privateConstructorUsedError;
  @FormControlAnnotation<String>()
  String? get department => throw _privateConstructorUsedError;
  @FormControlAnnotation<String>()
  String? get company => throw _privateConstructorUsedError;
  @FormControlAnnotation<String>()
  String? get headline => throw _privateConstructorUsedError;
  @FormArrayAnnotation()
  List<CustomLink> get customLinks => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DigitalCardCopyWith<DigitalCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DigitalCardCopyWith<$Res> {
  factory $DigitalCardCopyWith(
          DigitalCard value, $Res Function(DigitalCard) then) =
      _$DigitalCardCopyWithImpl<$Res, DigitalCard>;
  @useResult
  $Res call(
      {@FormControlAnnotation<int>() int? id,
      @FormControlAnnotation<int>() int? userId,
      @FormControlAnnotation<String>() String? uuid,
      @FormControlAnnotation<String>() String? title,
      @FormControlAnnotation<String>() String? logoImage,
      @FormControlAnnotation<String>() String? profileImage,
      @FormControlAnnotation<String>() String? color,
      @FormGroupAnnotation() FullName? fullname,
      @FormControlAnnotation<String>() String? position,
      @FormControlAnnotation<String>() String? department,
      @FormControlAnnotation<String>() String? company,
      @FormControlAnnotation<String>() String? headline,
      @FormArrayAnnotation() List<CustomLink> customLinks,
      DateTime? createdAt,
      DateTime? updatedAt});

  $FullNameCopyWith<$Res>? get fullname;
}

/// @nodoc
class _$DigitalCardCopyWithImpl<$Res, $Val extends DigitalCard>
    implements $DigitalCardCopyWith<$Res> {
  _$DigitalCardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? uuid = freezed,
    Object? title = freezed,
    Object? logoImage = freezed,
    Object? profileImage = freezed,
    Object? color = freezed,
    Object? fullname = freezed,
    Object? position = freezed,
    Object? department = freezed,
    Object? company = freezed,
    Object? headline = freezed,
    Object? customLinks = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      logoImage: freezed == logoImage
          ? _value.logoImage
          : logoImage // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      fullname: freezed == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as FullName?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      headline: freezed == headline
          ? _value.headline
          : headline // ignore: cast_nullable_to_non_nullable
              as String?,
      customLinks: null == customLinks
          ? _value.customLinks
          : customLinks // ignore: cast_nullable_to_non_nullable
              as List<CustomLink>,
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

  @override
  @pragma('vm:prefer-inline')
  $FullNameCopyWith<$Res>? get fullname {
    if (_value.fullname == null) {
      return null;
    }

    return $FullNameCopyWith<$Res>(_value.fullname!, (value) {
      return _then(_value.copyWith(fullname: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DigitalCardCopyWith<$Res>
    implements $DigitalCardCopyWith<$Res> {
  factory _$$_DigitalCardCopyWith(
          _$_DigitalCard value, $Res Function(_$_DigitalCard) then) =
      __$$_DigitalCardCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@FormControlAnnotation<int>() int? id,
      @FormControlAnnotation<int>() int? userId,
      @FormControlAnnotation<String>() String? uuid,
      @FormControlAnnotation<String>() String? title,
      @FormControlAnnotation<String>() String? logoImage,
      @FormControlAnnotation<String>() String? profileImage,
      @FormControlAnnotation<String>() String? color,
      @FormGroupAnnotation() FullName? fullname,
      @FormControlAnnotation<String>() String? position,
      @FormControlAnnotation<String>() String? department,
      @FormControlAnnotation<String>() String? company,
      @FormControlAnnotation<String>() String? headline,
      @FormArrayAnnotation() List<CustomLink> customLinks,
      DateTime? createdAt,
      DateTime? updatedAt});

  @override
  $FullNameCopyWith<$Res>? get fullname;
}

/// @nodoc
class __$$_DigitalCardCopyWithImpl<$Res>
    extends _$DigitalCardCopyWithImpl<$Res, _$_DigitalCard>
    implements _$$_DigitalCardCopyWith<$Res> {
  __$$_DigitalCardCopyWithImpl(
      _$_DigitalCard _value, $Res Function(_$_DigitalCard) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? uuid = freezed,
    Object? title = freezed,
    Object? logoImage = freezed,
    Object? profileImage = freezed,
    Object? color = freezed,
    Object? fullname = freezed,
    Object? position = freezed,
    Object? department = freezed,
    Object? company = freezed,
    Object? headline = freezed,
    Object? customLinks = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$_DigitalCard(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      logoImage: freezed == logoImage
          ? _value.logoImage
          : logoImage // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      fullname: freezed == fullname
          ? _value.fullname
          : fullname // ignore: cast_nullable_to_non_nullable
              as FullName?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      department: freezed == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      headline: freezed == headline
          ? _value.headline
          : headline // ignore: cast_nullable_to_non_nullable
              as String?,
      customLinks: null == customLinks
          ? _value._customLinks
          : customLinks // ignore: cast_nullable_to_non_nullable
              as List<CustomLink>,
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
class _$_DigitalCard implements _DigitalCard {
  _$_DigitalCard(
      {@FormControlAnnotation<int>() this.id,
      @FormControlAnnotation<int>() this.userId,
      @FormControlAnnotation<String>() this.uuid,
      @FormControlAnnotation<String>() this.title,
      @FormControlAnnotation<String>() this.logoImage,
      @FormControlAnnotation<String>() this.profileImage,
      @FormControlAnnotation<String>() this.color,
      @FormGroupAnnotation() this.fullname,
      @FormControlAnnotation<String>() this.position,
      @FormControlAnnotation<String>() this.department,
      @FormControlAnnotation<String>() this.company,
      @FormControlAnnotation<String>() this.headline,
      @FormArrayAnnotation() final List<CustomLink> customLinks = const [],
      this.createdAt,
      this.updatedAt})
      : _customLinks = customLinks;

  factory _$_DigitalCard.fromJson(Map<String, dynamic> json) =>
      _$$_DigitalCardFromJson(json);

  @override
  @FormControlAnnotation<int>()
  final int? id;
  @override
  @FormControlAnnotation<int>()
  final int? userId;
  @override
  @FormControlAnnotation<String>()
  final String? uuid;
  @override
  @FormControlAnnotation<String>()
  final String? title;
  @override
  @FormControlAnnotation<String>()
  final String? logoImage;
  @override
  @FormControlAnnotation<String>()
  final String? profileImage;
  @override
  @FormControlAnnotation<String>()
  final String? color;
  @override
  @FormGroupAnnotation()
  final FullName? fullname;
  @override
  @FormControlAnnotation<String>()
  final String? position;
  @override
  @FormControlAnnotation<String>()
  final String? department;
  @override
  @FormControlAnnotation<String>()
  final String? company;
  @override
  @FormControlAnnotation<String>()
  final String? headline;
  final List<CustomLink> _customLinks;
  @override
  @JsonKey()
  @FormArrayAnnotation()
  List<CustomLink> get customLinks {
    if (_customLinks is EqualUnmodifiableListView) return _customLinks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_customLinks);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'DigitalCard(id: $id, userId: $userId, uuid: $uuid, title: $title, logoImage: $logoImage, profileImage: $profileImage, color: $color, fullname: $fullname, position: $position, department: $department, company: $company, headline: $headline, customLinks: $customLinks, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DigitalCard &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.logoImage, logoImage) ||
                other.logoImage == logoImage) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.fullname, fullname) ||
                other.fullname == fullname) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.headline, headline) ||
                other.headline == headline) &&
            const DeepCollectionEquality()
                .equals(other._customLinks, _customLinks) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      uuid,
      title,
      logoImage,
      profileImage,
      color,
      fullname,
      position,
      department,
      company,
      headline,
      const DeepCollectionEquality().hash(_customLinks),
      createdAt,
      updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DigitalCardCopyWith<_$_DigitalCard> get copyWith =>
      __$$_DigitalCardCopyWithImpl<_$_DigitalCard>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DigitalCardToJson(
      this,
    );
  }
}

abstract class _DigitalCard implements DigitalCard {
  factory _DigitalCard(
      {@FormControlAnnotation<int>() final int? id,
      @FormControlAnnotation<int>() final int? userId,
      @FormControlAnnotation<String>() final String? uuid,
      @FormControlAnnotation<String>() final String? title,
      @FormControlAnnotation<String>() final String? logoImage,
      @FormControlAnnotation<String>() final String? profileImage,
      @FormControlAnnotation<String>() final String? color,
      @FormGroupAnnotation() final FullName? fullname,
      @FormControlAnnotation<String>() final String? position,
      @FormControlAnnotation<String>() final String? department,
      @FormControlAnnotation<String>() final String? company,
      @FormControlAnnotation<String>() final String? headline,
      @FormArrayAnnotation() final List<CustomLink> customLinks,
      final DateTime? createdAt,
      final DateTime? updatedAt}) = _$_DigitalCard;

  factory _DigitalCard.fromJson(Map<String, dynamic> json) =
      _$_DigitalCard.fromJson;

  @override
  @FormControlAnnotation<int>()
  int? get id;
  @override
  @FormControlAnnotation<int>()
  int? get userId;
  @override
  @FormControlAnnotation<String>()
  String? get uuid;
  @override
  @FormControlAnnotation<String>()
  String? get title;
  @override
  @FormControlAnnotation<String>()
  String? get logoImage;
  @override
  @FormControlAnnotation<String>()
  String? get profileImage;
  @override
  @FormControlAnnotation<String>()
  String? get color;
  @override
  @FormGroupAnnotation()
  FullName? get fullname;
  @override
  @FormControlAnnotation<String>()
  String? get position;
  @override
  @FormControlAnnotation<String>()
  String? get department;
  @override
  @FormControlAnnotation<String>()
  String? get company;
  @override
  @FormControlAnnotation<String>()
  String? get headline;
  @override
  @FormArrayAnnotation()
  List<CustomLink> get customLinks;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_DigitalCardCopyWith<_$_DigitalCard> get copyWith =>
      throw _privateConstructorUsedError;
}
