// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'advertisement_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AdvertisementDto {
  String get id => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AdvertisementDtoCopyWith<AdvertisementDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdvertisementDtoCopyWith<$Res> {
  factory $AdvertisementDtoCopyWith(
          AdvertisementDto value, $Res Function(AdvertisementDto) then) =
      _$AdvertisementDtoCopyWithImpl<$Res, AdvertisementDto>;
  @useResult
  $Res call({String id, String description, String imagePath});
}

/// @nodoc
class _$AdvertisementDtoCopyWithImpl<$Res, $Val extends AdvertisementDto>
    implements $AdvertisementDtoCopyWith<$Res> {
  _$AdvertisementDtoCopyWithImpl(this._value, this._then);

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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AdvertisementDtoCopyWith<$Res>
    implements $AdvertisementDtoCopyWith<$Res> {
  factory _$$_AdvertisementDtoCopyWith(
          _$_AdvertisementDto value, $Res Function(_$_AdvertisementDto) then) =
      __$$_AdvertisementDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String description, String imagePath});
}

/// @nodoc
class __$$_AdvertisementDtoCopyWithImpl<$Res>
    extends _$AdvertisementDtoCopyWithImpl<$Res, _$_AdvertisementDto>
    implements _$$_AdvertisementDtoCopyWith<$Res> {
  __$$_AdvertisementDtoCopyWithImpl(
      _$_AdvertisementDto _value, $Res Function(_$_AdvertisementDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? imagePath = null,
  }) {
    return _then(_$_AdvertisementDto(
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
    ));
  }
}

/// @nodoc

class _$_AdvertisementDto extends _AdvertisementDto {
  const _$_AdvertisementDto(
      {this.id = '', this.description = '', this.imagePath = ''})
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
  String toString() {
    return 'AdvertisementDto(id: $id, description: $description, imagePath: $imagePath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AdvertisementDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, description, imagePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AdvertisementDtoCopyWith<_$_AdvertisementDto> get copyWith =>
      __$$_AdvertisementDtoCopyWithImpl<_$_AdvertisementDto>(this, _$identity);
}

abstract class _AdvertisementDto extends AdvertisementDto {
  const factory _AdvertisementDto(
      {final String id,
      final String description,
      final String imagePath}) = _$_AdvertisementDto;
  const _AdvertisementDto._() : super._();

  @override
  String get id;
  @override
  String get description;
  @override
  String get imagePath;
  @override
  @JsonKey(ignore: true)
  _$$_AdvertisementDtoCopyWith<_$_AdvertisementDto> get copyWith =>
      throw _privateConstructorUsedError;
}
