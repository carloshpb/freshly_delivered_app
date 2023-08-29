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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(String id, String description, String imagePath,
            bool isSpecial, int discount)
        normal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(String id, String description, String imagePath,
            bool isSpecial, int discount)?
        normal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(String id, String description, String imagePath,
            bool isSpecial, int discount)?
        normal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyAdvertisementDto value) empty,
    required TResult Function(NormalAdvertisementDto value) normal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyAdvertisementDto value)? empty,
    TResult? Function(NormalAdvertisementDto value)? normal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyAdvertisementDto value)? empty,
    TResult Function(NormalAdvertisementDto value)? normal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdvertisementDtoCopyWith<$Res> {
  factory $AdvertisementDtoCopyWith(
          AdvertisementDto value, $Res Function(AdvertisementDto) then) =
      _$AdvertisementDtoCopyWithImpl<$Res, AdvertisementDto>;
}

/// @nodoc
class _$AdvertisementDtoCopyWithImpl<$Res, $Val extends AdvertisementDto>
    implements $AdvertisementDtoCopyWith<$Res> {
  _$AdvertisementDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EmptyAdvertisementDtoCopyWith<$Res> {
  factory _$$EmptyAdvertisementDtoCopyWith(_$EmptyAdvertisementDto value,
          $Res Function(_$EmptyAdvertisementDto) then) =
      __$$EmptyAdvertisementDtoCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyAdvertisementDtoCopyWithImpl<$Res>
    extends _$AdvertisementDtoCopyWithImpl<$Res, _$EmptyAdvertisementDto>
    implements _$$EmptyAdvertisementDtoCopyWith<$Res> {
  __$$EmptyAdvertisementDtoCopyWithImpl(_$EmptyAdvertisementDto _value,
      $Res Function(_$EmptyAdvertisementDto) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmptyAdvertisementDto extends EmptyAdvertisementDto {
  const _$EmptyAdvertisementDto() : super._();

  @override
  String toString() {
    return 'AdvertisementDto.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyAdvertisementDto);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(String id, String description, String imagePath,
            bool isSpecial, int discount)
        normal,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(String id, String description, String imagePath,
            bool isSpecial, int discount)?
        normal,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(String id, String description, String imagePath,
            bool isSpecial, int discount)?
        normal,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyAdvertisementDto value) empty,
    required TResult Function(NormalAdvertisementDto value) normal,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyAdvertisementDto value)? empty,
    TResult? Function(NormalAdvertisementDto value)? normal,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyAdvertisementDto value)? empty,
    TResult Function(NormalAdvertisementDto value)? normal,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class EmptyAdvertisementDto extends AdvertisementDto {
  const factory EmptyAdvertisementDto() = _$EmptyAdvertisementDto;
  const EmptyAdvertisementDto._() : super._();
}

/// @nodoc
abstract class _$$NormalAdvertisementDtoCopyWith<$Res> {
  factory _$$NormalAdvertisementDtoCopyWith(_$NormalAdvertisementDto value,
          $Res Function(_$NormalAdvertisementDto) then) =
      __$$NormalAdvertisementDtoCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String id,
      String description,
      String imagePath,
      bool isSpecial,
      int discount});
}

/// @nodoc
class __$$NormalAdvertisementDtoCopyWithImpl<$Res>
    extends _$AdvertisementDtoCopyWithImpl<$Res, _$NormalAdvertisementDto>
    implements _$$NormalAdvertisementDtoCopyWith<$Res> {
  __$$NormalAdvertisementDtoCopyWithImpl(_$NormalAdvertisementDto _value,
      $Res Function(_$NormalAdvertisementDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? description = null,
    Object? imagePath = null,
    Object? isSpecial = null,
    Object? discount = null,
  }) {
    return _then(_$NormalAdvertisementDto(
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
      isSpecial: null == isSpecial
          ? _value.isSpecial
          : isSpecial // ignore: cast_nullable_to_non_nullable
              as bool,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$NormalAdvertisementDto extends NormalAdvertisementDto {
  const _$NormalAdvertisementDto(
      {this.id = '',
      this.description = '',
      this.imagePath = '',
      this.isSpecial = false,
      this.discount = 0})
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
  @JsonKey()
  final bool isSpecial;
  @override
  @JsonKey()
  final int discount;

  @override
  String toString() {
    return 'AdvertisementDto.normal(id: $id, description: $description, imagePath: $imagePath, isSpecial: $isSpecial, discount: $discount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NormalAdvertisementDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.isSpecial, isSpecial) ||
                other.isSpecial == isSpecial) &&
            (identical(other.discount, discount) ||
                other.discount == discount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, description, imagePath, isSpecial, discount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NormalAdvertisementDtoCopyWith<_$NormalAdvertisementDto> get copyWith =>
      __$$NormalAdvertisementDtoCopyWithImpl<_$NormalAdvertisementDto>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(String id, String description, String imagePath,
            bool isSpecial, int discount)
        normal,
  }) {
    return normal(id, description, imagePath, isSpecial, discount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(String id, String description, String imagePath,
            bool isSpecial, int discount)?
        normal,
  }) {
    return normal?.call(id, description, imagePath, isSpecial, discount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(String id, String description, String imagePath,
            bool isSpecial, int discount)?
        normal,
    required TResult orElse(),
  }) {
    if (normal != null) {
      return normal(id, description, imagePath, isSpecial, discount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyAdvertisementDto value) empty,
    required TResult Function(NormalAdvertisementDto value) normal,
  }) {
    return normal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyAdvertisementDto value)? empty,
    TResult? Function(NormalAdvertisementDto value)? normal,
  }) {
    return normal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyAdvertisementDto value)? empty,
    TResult Function(NormalAdvertisementDto value)? normal,
    required TResult orElse(),
  }) {
    if (normal != null) {
      return normal(this);
    }
    return orElse();
  }
}

abstract class NormalAdvertisementDto extends AdvertisementDto {
  const factory NormalAdvertisementDto(
      {final String id,
      final String description,
      final String imagePath,
      final bool isSpecial,
      final int discount}) = _$NormalAdvertisementDto;
  const NormalAdvertisementDto._() : super._();

  String get id;
  String get description;
  String get imagePath;
  bool get isSpecial;
  int get discount;
  @JsonKey(ignore: true)
  _$$NormalAdvertisementDtoCopyWith<_$NormalAdvertisementDto> get copyWith =>
      throw _privateConstructorUsedError;
}
