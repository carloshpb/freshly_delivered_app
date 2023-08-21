// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_item_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartItemDto {
  NormalProductDto get product => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartItemDtoCopyWith<CartItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemDtoCopyWith<$Res> {
  factory $CartItemDtoCopyWith(
          CartItemDto value, $Res Function(CartItemDto) then) =
      _$CartItemDtoCopyWithImpl<$Res, CartItemDto>;
  @useResult
  $Res call({NormalProductDto product, int amount});
}

/// @nodoc
class _$CartItemDtoCopyWithImpl<$Res, $Val extends CartItemDto>
    implements $CartItemDtoCopyWith<$Res> {
  _$CartItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = freezed,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as NormalProductDto,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CartItemDtoCopyWith<$Res>
    implements $CartItemDtoCopyWith<$Res> {
  factory _$$_CartItemDtoCopyWith(
          _$_CartItemDto value, $Res Function(_$_CartItemDto) then) =
      __$$_CartItemDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({NormalProductDto product, int amount});
}

/// @nodoc
class __$$_CartItemDtoCopyWithImpl<$Res>
    extends _$CartItemDtoCopyWithImpl<$Res, _$_CartItemDto>
    implements _$$_CartItemDtoCopyWith<$Res> {
  __$$_CartItemDtoCopyWithImpl(
      _$_CartItemDto _value, $Res Function(_$_CartItemDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = freezed,
    Object? amount = null,
  }) {
    return _then(_$_CartItemDto(
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as NormalProductDto,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CartItemDto extends _CartItemDto {
  _$_CartItemDto({required this.product, this.amount = 1}) : super._();

  @override
  final NormalProductDto product;
  @override
  @JsonKey()
  final int amount;

  @override
  String toString() {
    return 'CartItemDto(product: $product, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartItemDto &&
            const DeepCollectionEquality().equals(other.product, product) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(product), amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartItemDtoCopyWith<_$_CartItemDto> get copyWith =>
      __$$_CartItemDtoCopyWithImpl<_$_CartItemDto>(this, _$identity);
}

abstract class _CartItemDto extends CartItemDto {
  factory _CartItemDto(
      {required final NormalProductDto product,
      final int amount}) = _$_CartItemDto;
  _CartItemDto._() : super._();

  @override
  NormalProductDto get product;
  @override
  int get amount;
  @override
  @JsonKey(ignore: true)
  _$$_CartItemDtoCopyWith<_$_CartItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}
