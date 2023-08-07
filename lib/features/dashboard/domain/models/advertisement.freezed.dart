// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'advertisement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Advertisement {
  String get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get modifiedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AdvertisementCopyWith<Advertisement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdvertisementCopyWith<$Res> {
  factory $AdvertisementCopyWith(
          Advertisement value, $Res Function(Advertisement) then) =
      _$AdvertisementCopyWithImpl<$Res, Advertisement>;
  @useResult
  $Res call(
      {String id,
      String description,
      String imagePath,
      DateTime createdAt,
      DateTime modifiedAt});
}

/// @nodoc
class _$AdvertisementCopyWithImpl<$Res, $Val extends Advertisement>
    implements $AdvertisementCopyWith<$Res> {
  _$AdvertisementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? imagePath = null,
    Object? createdAt = null,
    Object? modifiedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modifiedAt: null == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AdvertisementCopyWith<$Res>
    implements $AdvertisementCopyWith<$Res> {
  factory _$$_AdvertisementCopyWith(
          _$_Advertisement value, $Res Function(_$_Advertisement) then) =
      __$$_AdvertisementCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String description,
      String imagePath,
      DateTime createdAt,
      DateTime modifiedAt});
}

/// @nodoc
class __$$_AdvertisementCopyWithImpl<$Res>
    extends _$AdvertisementCopyWithImpl<$Res, _$_Advertisement>
    implements _$$_AdvertisementCopyWith<$Res> {
  __$$_AdvertisementCopyWithImpl(
      _$_Advertisement _value, $Res Function(_$_Advertisement) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? imagePath = null,
    Object? createdAt = null,
    Object? modifiedAt = null,
  }) {
    return _then(_$_Advertisement(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      modifiedAt: null == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_Advertisement extends _Advertisement {
  _$_Advertisement(
      {this.id = '',
      this.description = '',
      this.imagePath = '',
      required this.createdAt,
      required this.modifiedAt})
      : super._();

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final String imagePath;
  @override
  final DateTime createdAt;
  @override
  final DateTime modifiedAt;

  @override
  String toString() {
    return 'Advertisement(id: $id, description: $description, imagePath: $imagePath, createdAt: $createdAt, modifiedAt: $modifiedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Advertisement &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.modifiedAt, modifiedAt) ||
                other.modifiedAt == modifiedAt));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, description, imagePath, createdAt, modifiedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdvertisementCopyWith<_$_Advertisement> get copyWith =>
      __$$_AdvertisementCopyWithImpl<_$_Advertisement>(this, _$identity);
}

abstract class _Advertisement extends Advertisement {
  factory _Advertisement(
      {final String id,
      final String description,
      final String imagePath,
      required final DateTime createdAt,
      required final DateTime modifiedAt}) = _$_Advertisement;
  _Advertisement._() : super._();

  @override
  String get id;
  @override
  String get description;
  @override
  String get imagePath;
  @override
  DateTime get createdAt;
  @override
  DateTime get modifiedAt;
  @override
  @JsonKey(ignore: true)
  _$$_AdvertisementCopyWith<_$_Advertisement> get copyWith =>
      throw _privateConstructorUsedError;
}
