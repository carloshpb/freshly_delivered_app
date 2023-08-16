// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CartDto {
  String get userId => throw _privateConstructorUsedError;
  double get totalPrice => throw _privateConstructorUsedError;
  List<({double amount, ProductDto product})> get items =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartDtoCopyWith<CartDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartDtoCopyWith<$Res> {
  factory $CartDtoCopyWith(CartDto value, $Res Function(CartDto) then) =
      _$CartDtoCopyWithImpl<$Res, CartDto>;
  @useResult
  $Res call(
      {String userId,
      double totalPrice,
      List<({double amount, ProductDto product})> items});
}

/// @nodoc
class _$CartDtoCopyWithImpl<$Res, $Val extends CartDto>
    implements $CartDtoCopyWith<$Res> {
  _$CartDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? totalPrice = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<({double amount, ProductDto product})>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CartDtoCopyWith<$Res> implements $CartDtoCopyWith<$Res> {
  factory _$$_CartDtoCopyWith(
          _$_CartDto value, $Res Function(_$_CartDto) then) =
      __$$_CartDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      double totalPrice,
      List<({double amount, ProductDto product})> items});
}

/// @nodoc
class __$$_CartDtoCopyWithImpl<$Res>
    extends _$CartDtoCopyWithImpl<$Res, _$_CartDto>
    implements _$$_CartDtoCopyWith<$Res> {
  __$$_CartDtoCopyWithImpl(_$_CartDto _value, $Res Function(_$_CartDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? totalPrice = null,
    Object? items = null,
  }) {
    return _then(_$_CartDto(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<({double amount, ProductDto product})>,
    ));
  }
}

/// @nodoc

class _$_CartDto extends _CartDto {
  const _$_CartDto(
      {this.userId = '',
      this.totalPrice = 0.0,
      final List<({double amount, ProductDto product})> items = const <({
        ProductDto product,
        double amount
      })>[]})
      : _items = items,
        super._();

  @override
  @JsonKey()
  final String userId;
  @override
  @JsonKey()
  final double totalPrice;
  final List<({double amount, ProductDto product})> _items;
  @override
  @JsonKey()
  List<({double amount, ProductDto product})> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'CartDto(userId: $userId, totalPrice: $totalPrice, items: $items)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CartDto &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, totalPrice,
      const DeepCollectionEquality().hash(_items));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CartDtoCopyWith<_$_CartDto> get copyWith =>
      __$$_CartDtoCopyWithImpl<_$_CartDto>(this, _$identity);
}

abstract class _CartDto extends CartDto {
  const factory _CartDto(
      {final String userId,
      final double totalPrice,
      final List<({double amount, ProductDto product})> items}) = _$_CartDto;
  const _CartDto._() : super._();

  @override
  String get userId;
  @override
  double get totalPrice;
  @override
  List<({double amount, ProductDto product})> get items;
  @override
  @JsonKey(ignore: true)
  _$$_CartDtoCopyWith<_$_CartDto> get copyWith =>
      throw _privateConstructorUsedError;
}
