// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discount_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DiscountDto {
  String get id => throw _privateConstructorUsedError;
  int get discountPercent => throw _privateConstructorUsedError;
  DateTime? get expiresAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DiscountDtoCopyWith<DiscountDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscountDtoCopyWith<$Res> {
  factory $DiscountDtoCopyWith(
          DiscountDto value, $Res Function(DiscountDto) then) =
      _$DiscountDtoCopyWithImpl<$Res, DiscountDto>;
  @useResult
  $Res call({String id, int discountPercent, DateTime? expiresAt});
}

/// @nodoc
class _$DiscountDtoCopyWithImpl<$Res, $Val extends DiscountDto>
    implements $DiscountDtoCopyWith<$Res> {
  _$DiscountDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? discountPercent = null,
    Object? expiresAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      discountPercent: null == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as int,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DiscountDtoCopyWith<$Res>
    implements $DiscountDtoCopyWith<$Res> {
  factory _$$_DiscountDtoCopyWith(
          _$_DiscountDto value, $Res Function(_$_DiscountDto) then) =
      __$$_DiscountDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, int discountPercent, DateTime? expiresAt});
}

/// @nodoc
class __$$_DiscountDtoCopyWithImpl<$Res>
    extends _$DiscountDtoCopyWithImpl<$Res, _$_DiscountDto>
    implements _$$_DiscountDtoCopyWith<$Res> {
  __$$_DiscountDtoCopyWithImpl(
      _$_DiscountDto _value, $Res Function(_$_DiscountDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? discountPercent = null,
    Object? expiresAt = freezed,
  }) {
    return _then(_$_DiscountDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      discountPercent: null == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as int,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_DiscountDto extends _DiscountDto {
  const _$_DiscountDto(
      {required this.id, this.discountPercent = 0, this.expiresAt})
      : assert(id != "", 'id cannot be empty'),
        assert(discountPercent >= 0 && discountPercent <= 100,
            'price cannot be negative or bigger than 100'),
        super._();

  @override
  final String id;
  @override
  @JsonKey()
  final int discountPercent;
  @override
  final DateTime? expiresAt;

  @override
  String toString() {
    return 'DiscountDto(id: $id, discountPercent: $discountPercent, expiresAt: $expiresAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DiscountDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.discountPercent, discountPercent) ||
                other.discountPercent == discountPercent) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, discountPercent, expiresAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DiscountDtoCopyWith<_$_DiscountDto> get copyWith =>
      __$$_DiscountDtoCopyWithImpl<_$_DiscountDto>(this, _$identity);
}

abstract class _DiscountDto extends DiscountDto {
  const factory _DiscountDto(
      {required final String id,
      final int discountPercent,
      final DateTime? expiresAt}) = _$_DiscountDto;
  const _DiscountDto._() : super._();

  @override
  String get id;
  @override
  int get discountPercent;
  @override
  DateTime? get expiresAt;
  @override
  @JsonKey(ignore: true)
  _$$_DiscountDtoCopyWith<_$_DiscountDto> get copyWith =>
      throw _privateConstructorUsedError;
}
