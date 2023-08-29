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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(NormalProductDto product, int amount) normal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(NormalProductDto product, int amount)? normal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(NormalProductDto product, int amount)? normal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyCartItemDto value) empty,
    required TResult Function(NormalCartItemDto value) normal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyCartItemDto value)? empty,
    TResult? Function(NormalCartItemDto value)? normal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyCartItemDto value)? empty,
    TResult Function(NormalCartItemDto value)? normal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemDtoCopyWith<$Res> {
  factory $CartItemDtoCopyWith(
          CartItemDto value, $Res Function(CartItemDto) then) =
      _$CartItemDtoCopyWithImpl<$Res, CartItemDto>;
}

/// @nodoc
class _$CartItemDtoCopyWithImpl<$Res, $Val extends CartItemDto>
    implements $CartItemDtoCopyWith<$Res> {
  _$CartItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EmptyCartItemDtoCopyWith<$Res> {
  factory _$$EmptyCartItemDtoCopyWith(
          _$EmptyCartItemDto value, $Res Function(_$EmptyCartItemDto) then) =
      __$$EmptyCartItemDtoCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyCartItemDtoCopyWithImpl<$Res>
    extends _$CartItemDtoCopyWithImpl<$Res, _$EmptyCartItemDto>
    implements _$$EmptyCartItemDtoCopyWith<$Res> {
  __$$EmptyCartItemDtoCopyWithImpl(
      _$EmptyCartItemDto _value, $Res Function(_$EmptyCartItemDto) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmptyCartItemDto extends EmptyCartItemDto {
  const _$EmptyCartItemDto() : super._();

  @override
  String toString() {
    return 'CartItemDto.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyCartItemDto);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(NormalProductDto product, int amount) normal,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(NormalProductDto product, int amount)? normal,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(NormalProductDto product, int amount)? normal,
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
    required TResult Function(EmptyCartItemDto value) empty,
    required TResult Function(NormalCartItemDto value) normal,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyCartItemDto value)? empty,
    TResult? Function(NormalCartItemDto value)? normal,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyCartItemDto value)? empty,
    TResult Function(NormalCartItemDto value)? normal,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class EmptyCartItemDto extends CartItemDto {
  const factory EmptyCartItemDto() = _$EmptyCartItemDto;
  const EmptyCartItemDto._() : super._();
}

/// @nodoc
abstract class _$$NormalCartItemDtoCopyWith<$Res> {
  factory _$$NormalCartItemDtoCopyWith(
          _$NormalCartItemDto value, $Res Function(_$NormalCartItemDto) then) =
      __$$NormalCartItemDtoCopyWithImpl<$Res>;
  @useResult
  $Res call({NormalProductDto product, int amount});
}

/// @nodoc
class __$$NormalCartItemDtoCopyWithImpl<$Res>
    extends _$CartItemDtoCopyWithImpl<$Res, _$NormalCartItemDto>
    implements _$$NormalCartItemDtoCopyWith<$Res> {
  __$$NormalCartItemDtoCopyWithImpl(
      _$NormalCartItemDto _value, $Res Function(_$NormalCartItemDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = freezed,
    Object? amount = null,
  }) {
    return _then(_$NormalCartItemDto(
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

class _$NormalCartItemDto extends NormalCartItemDto {
  _$NormalCartItemDto({required this.product, this.amount = 1})
      : assert(amount >= 0, 'amount cannot negative'),
        super._();

  @override
  final NormalProductDto product;
  @override
  @JsonKey()
  final int amount;

  @override
  String toString() {
    return 'CartItemDto.normal(product: $product, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NormalCartItemDto &&
            const DeepCollectionEquality().equals(other.product, product) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(product), amount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NormalCartItemDtoCopyWith<_$NormalCartItemDto> get copyWith =>
      __$$NormalCartItemDtoCopyWithImpl<_$NormalCartItemDto>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(NormalProductDto product, int amount) normal,
  }) {
    return normal(product, amount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(NormalProductDto product, int amount)? normal,
  }) {
    return normal?.call(product, amount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(NormalProductDto product, int amount)? normal,
    required TResult orElse(),
  }) {
    if (normal != null) {
      return normal(product, amount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyCartItemDto value) empty,
    required TResult Function(NormalCartItemDto value) normal,
  }) {
    return normal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyCartItemDto value)? empty,
    TResult? Function(NormalCartItemDto value)? normal,
  }) {
    return normal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyCartItemDto value)? empty,
    TResult Function(NormalCartItemDto value)? normal,
    required TResult orElse(),
  }) {
    if (normal != null) {
      return normal(this);
    }
    return orElse();
  }
}

abstract class NormalCartItemDto extends CartItemDto {
  factory NormalCartItemDto(
      {required final NormalProductDto product,
      final int amount}) = _$NormalCartItemDto;
  NormalCartItemDto._() : super._();

  NormalProductDto get product;
  int get amount;
  @JsonKey(ignore: true)
  _$$NormalCartItemDtoCopyWith<_$NormalCartItemDto> get copyWith =>
      throw _privateConstructorUsedError;
}
