// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'digital_card_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DigitalCardDTO _$DigitalCardDTOFromJson(Map<String, dynamic> json) {
  return _DigitalCardDTO.fromJson(json);
}

/// @nodoc
mixin _$DigitalCardDTO {
  int? get id => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get uuid => throw _privateConstructorUsedError;
  String? get logoUrl => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  @RfControl()
  String? get title => throw _privateConstructorUsedError;
  @RfControl(validators: [RequiredValidator()])
  String? get firstName => throw _privateConstructorUsedError;
  @RfControl()
  String? get prefix => throw _privateConstructorUsedError;
  @RfControl()
  String? get middleName => throw _privateConstructorUsedError;
  @RfControl()
  String? get lastName => throw _privateConstructorUsedError;
  @RfControl()
  String? get suffix => throw _privateConstructorUsedError;
  @RfControl()
  dynamic get avatarFile => throw _privateConstructorUsedError;
  @RfControl()
  dynamic get logoFile => throw _privateConstructorUsedError;
  @ColorConverter()
  @RfControl()
  @RfControl()
  Color? get color => throw _privateConstructorUsedError;
  @RfControl()
  int? get layout => throw _privateConstructorUsedError;
  @RfControl()
  String? get position => throw _privateConstructorUsedError;
  @RfControl()
  String? get company => throw _privateConstructorUsedError;
  @RfControl()
  String? get headline => throw _privateConstructorUsedError;
  @RfControl(validators: [NotEmptyValidator()])
  List<Map<String, dynamic>>? get customLinks =>
      throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  DateTime? get addedToContactsAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DigitalCardDTOCopyWith<DigitalCardDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DigitalCardDTOCopyWith<$Res> {
  factory $DigitalCardDTOCopyWith(
          DigitalCardDTO value, $Res Function(DigitalCardDTO) then) =
      _$DigitalCardDTOCopyWithImpl<$Res, DigitalCardDTO>;
  @useResult
  $Res call(
      {int? id,
      String? userId,
      String? uuid,
      String? logoUrl,
      String? avatarUrl,
      @RfControl() String? title,
      @RfControl(validators: [RequiredValidator()]) String? firstName,
      @RfControl() String? prefix,
      @RfControl() String? middleName,
      @RfControl() String? lastName,
      @RfControl() String? suffix,
      @RfControl() dynamic avatarFile,
      @RfControl() dynamic logoFile,
      @ColorConverter() @RfControl() @RfControl() Color? color,
      @RfControl() int? layout,
      @RfControl() String? position,
      @RfControl() String? company,
      @RfControl() String? headline,
      @RfControl(validators: [NotEmptyValidator()])
      List<Map<String, dynamic>>? customLinks,
      DateTime? createdAt,
      DateTime? updatedAt,
      DateTime? addedToContactsAt});
}

/// @nodoc
class _$DigitalCardDTOCopyWithImpl<$Res, $Val extends DigitalCardDTO>
    implements $DigitalCardDTOCopyWith<$Res> {
  _$DigitalCardDTOCopyWithImpl(this._value, this._then);

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
    Object? logoUrl = freezed,
    Object? avatarUrl = freezed,
    Object? title = freezed,
    Object? firstName = freezed,
    Object? prefix = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? suffix = freezed,
    Object? avatarFile = freezed,
    Object? logoFile = freezed,
    Object? color = freezed,
    Object? layout = freezed,
    Object? position = freezed,
    Object? company = freezed,
    Object? headline = freezed,
    Object? customLinks = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? addedToContactsAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      prefix: freezed == prefix
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      suffix: freezed == suffix
          ? _value.suffix
          : suffix // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarFile: freezed == avatarFile
          ? _value.avatarFile
          : avatarFile // ignore: cast_nullable_to_non_nullable
              as dynamic,
      logoFile: freezed == logoFile
          ? _value.logoFile
          : logoFile // ignore: cast_nullable_to_non_nullable
              as dynamic,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      layout: freezed == layout
          ? _value.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as int?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      headline: freezed == headline
          ? _value.headline
          : headline // ignore: cast_nullable_to_non_nullable
              as String?,
      customLinks: freezed == customLinks
          ? _value.customLinks
          : customLinks // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      addedToContactsAt: freezed == addedToContactsAt
          ? _value.addedToContactsAt
          : addedToContactsAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DigitalCardDTOImplCopyWith<$Res>
    implements $DigitalCardDTOCopyWith<$Res> {
  factory _$$DigitalCardDTOImplCopyWith(_$DigitalCardDTOImpl value,
          $Res Function(_$DigitalCardDTOImpl) then) =
      __$$DigitalCardDTOImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? userId,
      String? uuid,
      String? logoUrl,
      String? avatarUrl,
      @RfControl() String? title,
      @RfControl(validators: [RequiredValidator()]) String? firstName,
      @RfControl() String? prefix,
      @RfControl() String? middleName,
      @RfControl() String? lastName,
      @RfControl() String? suffix,
      @RfControl() dynamic avatarFile,
      @RfControl() dynamic logoFile,
      @ColorConverter() @RfControl() @RfControl() Color? color,
      @RfControl() int? layout,
      @RfControl() String? position,
      @RfControl() String? company,
      @RfControl() String? headline,
      @RfControl(validators: [NotEmptyValidator()])
      List<Map<String, dynamic>>? customLinks,
      DateTime? createdAt,
      DateTime? updatedAt,
      DateTime? addedToContactsAt});
}

/// @nodoc
class __$$DigitalCardDTOImplCopyWithImpl<$Res>
    extends _$DigitalCardDTOCopyWithImpl<$Res, _$DigitalCardDTOImpl>
    implements _$$DigitalCardDTOImplCopyWith<$Res> {
  __$$DigitalCardDTOImplCopyWithImpl(
      _$DigitalCardDTOImpl _value, $Res Function(_$DigitalCardDTOImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? uuid = freezed,
    Object? logoUrl = freezed,
    Object? avatarUrl = freezed,
    Object? title = freezed,
    Object? firstName = freezed,
    Object? prefix = freezed,
    Object? middleName = freezed,
    Object? lastName = freezed,
    Object? suffix = freezed,
    Object? avatarFile = freezed,
    Object? logoFile = freezed,
    Object? color = freezed,
    Object? layout = freezed,
    Object? position = freezed,
    Object? company = freezed,
    Object? headline = freezed,
    Object? customLinks = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? addedToContactsAt = freezed,
  }) {
    return _then(_$DigitalCardDTOImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      uuid: freezed == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String?,
      logoUrl: freezed == logoUrl
          ? _value.logoUrl
          : logoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      prefix: freezed == prefix
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as String?,
      middleName: freezed == middleName
          ? _value.middleName
          : middleName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      suffix: freezed == suffix
          ? _value.suffix
          : suffix // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarFile: freezed == avatarFile
          ? _value.avatarFile
          : avatarFile // ignore: cast_nullable_to_non_nullable
              as dynamic,
      logoFile: freezed == logoFile
          ? _value.logoFile
          : logoFile // ignore: cast_nullable_to_non_nullable
              as dynamic,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      layout: freezed == layout
          ? _value.layout
          : layout // ignore: cast_nullable_to_non_nullable
              as int?,
      position: freezed == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      headline: freezed == headline
          ? _value.headline
          : headline // ignore: cast_nullable_to_non_nullable
              as String?,
      customLinks: freezed == customLinks
          ? _value._customLinks
          : customLinks // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      addedToContactsAt: freezed == addedToContactsAt
          ? _value.addedToContactsAt
          : addedToContactsAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$DigitalCardDTOImpl implements _DigitalCardDTO {
  _$DigitalCardDTOImpl(
      {this.id,
      this.userId,
      this.uuid,
      this.logoUrl,
      this.avatarUrl,
      @RfControl() this.title = "New Card",
      @RfControl(validators: [RequiredValidator()]) this.firstName,
      @RfControl() this.prefix,
      @RfControl() this.middleName,
      @RfControl() this.lastName,
      @RfControl() this.suffix,
      @RfControl() this.avatarFile,
      @RfControl() this.logoFile,
      @ColorConverter() @RfControl() @RfControl() this.color,
      @RfControl() this.layout,
      @RfControl() this.position,
      @RfControl() this.company,
      @RfControl() this.headline,
      @RfControl(validators: [NotEmptyValidator()])
      final List<Map<String, dynamic>>? customLinks = const [],
      this.createdAt,
      this.updatedAt,
      this.addedToContactsAt})
      : _customLinks = customLinks;

  factory _$DigitalCardDTOImpl.fromJson(Map<String, dynamic> json) =>
      _$$DigitalCardDTOImplFromJson(json);

  @override
  final int? id;
  @override
  final String? userId;
  @override
  final String? uuid;
  @override
  final String? logoUrl;
  @override
  final String? avatarUrl;
  @override
  @JsonKey()
  @RfControl()
  final String? title;
  @override
  @RfControl(validators: [RequiredValidator()])
  final String? firstName;
  @override
  @RfControl()
  final String? prefix;
  @override
  @RfControl()
  final String? middleName;
  @override
  @RfControl()
  final String? lastName;
  @override
  @RfControl()
  final String? suffix;
  @override
  @RfControl()
  final dynamic avatarFile;
  @override
  @RfControl()
  final dynamic logoFile;
  @override
  @ColorConverter()
  @RfControl()
  @RfControl()
  final Color? color;
  @override
  @RfControl()
  final int? layout;
  @override
  @RfControl()
  final String? position;
  @override
  @RfControl()
  final String? company;
  @override
  @RfControl()
  final String? headline;
  final List<Map<String, dynamic>>? _customLinks;
  @override
  @JsonKey()
  @RfControl(validators: [NotEmptyValidator()])
  List<Map<String, dynamic>>? get customLinks {
    final value = _customLinks;
    if (value == null) return null;
    if (_customLinks is EqualUnmodifiableListView) return _customLinks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  final DateTime? addedToContactsAt;

  @override
  String toString() {
    return 'DigitalCardDTO(id: $id, userId: $userId, uuid: $uuid, logoUrl: $logoUrl, avatarUrl: $avatarUrl, title: $title, firstName: $firstName, prefix: $prefix, middleName: $middleName, lastName: $lastName, suffix: $suffix, avatarFile: $avatarFile, logoFile: $logoFile, color: $color, layout: $layout, position: $position, company: $company, headline: $headline, customLinks: $customLinks, createdAt: $createdAt, updatedAt: $updatedAt, addedToContactsAt: $addedToContactsAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DigitalCardDTOImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.prefix, prefix) || other.prefix == prefix) &&
            (identical(other.middleName, middleName) ||
                other.middleName == middleName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.suffix, suffix) || other.suffix == suffix) &&
            const DeepCollectionEquality()
                .equals(other.avatarFile, avatarFile) &&
            const DeepCollectionEquality().equals(other.logoFile, logoFile) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.layout, layout) || other.layout == layout) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.headline, headline) ||
                other.headline == headline) &&
            const DeepCollectionEquality()
                .equals(other._customLinks, _customLinks) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.addedToContactsAt, addedToContactsAt) ||
                other.addedToContactsAt == addedToContactsAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        uuid,
        logoUrl,
        avatarUrl,
        title,
        firstName,
        prefix,
        middleName,
        lastName,
        suffix,
        const DeepCollectionEquality().hash(avatarFile),
        const DeepCollectionEquality().hash(logoFile),
        color,
        layout,
        position,
        company,
        headline,
        const DeepCollectionEquality().hash(_customLinks),
        createdAt,
        updatedAt,
        addedToContactsAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DigitalCardDTOImplCopyWith<_$DigitalCardDTOImpl> get copyWith =>
      __$$DigitalCardDTOImplCopyWithImpl<_$DigitalCardDTOImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DigitalCardDTOImplToJson(
      this,
    );
  }
}

abstract class _DigitalCardDTO implements DigitalCardDTO {
  factory _DigitalCardDTO(
      {final int? id,
      final String? userId,
      final String? uuid,
      final String? logoUrl,
      final String? avatarUrl,
      @RfControl() final String? title,
      @RfControl(validators: [RequiredValidator()]) final String? firstName,
      @RfControl() final String? prefix,
      @RfControl() final String? middleName,
      @RfControl() final String? lastName,
      @RfControl() final String? suffix,
      @RfControl() final dynamic avatarFile,
      @RfControl() final dynamic logoFile,
      @ColorConverter() @RfControl() @RfControl() final Color? color,
      @RfControl() final int? layout,
      @RfControl() final String? position,
      @RfControl() final String? company,
      @RfControl() final String? headline,
      @RfControl(validators: [NotEmptyValidator()])
      final List<Map<String, dynamic>>? customLinks,
      final DateTime? createdAt,
      final DateTime? updatedAt,
      final DateTime? addedToContactsAt}) = _$DigitalCardDTOImpl;

  factory _DigitalCardDTO.fromJson(Map<String, dynamic> json) =
      _$DigitalCardDTOImpl.fromJson;

  @override
  int? get id;
  @override
  String? get userId;
  @override
  String? get uuid;
  @override
  String? get logoUrl;
  @override
  String? get avatarUrl;
  @override
  @RfControl()
  String? get title;
  @override
  @RfControl(validators: [RequiredValidator()])
  String? get firstName;
  @override
  @RfControl()
  String? get prefix;
  @override
  @RfControl()
  String? get middleName;
  @override
  @RfControl()
  String? get lastName;
  @override
  @RfControl()
  String? get suffix;
  @override
  @RfControl()
  dynamic get avatarFile;
  @override
  @RfControl()
  dynamic get logoFile;
  @override
  @ColorConverter()
  @RfControl()
  @RfControl()
  Color? get color;
  @override
  @RfControl()
  int? get layout;
  @override
  @RfControl()
  String? get position;
  @override
  @RfControl()
  String? get company;
  @override
  @RfControl()
  String? get headline;
  @override
  @RfControl(validators: [NotEmptyValidator()])
  List<Map<String, dynamic>>? get customLinks;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  DateTime? get addedToContactsAt;
  @override
  @JsonKey(ignore: true)
  _$$DigitalCardDTOImplCopyWith<_$DigitalCardDTOImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
