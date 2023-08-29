// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CartItem _$CartItemFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'empty':
      return EmptyCartItem.fromJson(json);
    case 'normal':
      return NormalCartItem.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'CartItem',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$CartItem {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(
            NormalProduct product,
            int amount,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'modified_at')
            DateTime? modifiedAt)
        normal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(
            NormalProduct product,
            int amount,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'modified_at')
            DateTime? modifiedAt)?
        normal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(
            NormalProduct product,
            int amount,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'modified_at')
            DateTime? modifiedAt)?
        normal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyCartItem value) empty,
    required TResult Function(NormalCartItem value) normal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyCartItem value)? empty,
    TResult? Function(NormalCartItem value)? normal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyCartItem value)? empty,
    TResult Function(NormalCartItem value)? normal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartItemCopyWith<$Res> {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) then) =
      _$CartItemCopyWithImpl<$Res, CartItem>;
}

/// @nodoc
class _$CartItemCopyWithImpl<$Res, $Val extends CartItem>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EmptyCartItemCopyWith<$Res> {
  factory _$$EmptyCartItemCopyWith(
          _$EmptyCartItem value, $Res Function(_$EmptyCartItem) then) =
      __$$EmptyCartItemCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyCartItemCopyWithImpl<$Res>
    extends _$CartItemCopyWithImpl<$Res, _$EmptyCartItem>
    implements _$$EmptyCartItemCopyWith<$Res> {
  __$$EmptyCartItemCopyWithImpl(
      _$EmptyCartItem _value, $Res Function(_$EmptyCartItem) _then)
      : super(_value, _then);
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$EmptyCartItem extends EmptyCartItem {
  const _$EmptyCartItem({final String? $type})
      : $type = $type ?? 'empty',
        super._();

  factory _$EmptyCartItem.fromJson(Map<String, dynamic> json) =>
      _$$EmptyCartItemFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'CartItem.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyCartItem);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(
            NormalProduct product,
            int amount,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'modified_at')
            DateTime? modifiedAt)
        normal,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(
            NormalProduct product,
            int amount,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'modified_at')
            DateTime? modifiedAt)?
        normal,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(
            NormalProduct product,
            int amount,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'modified_at')
            DateTime? modifiedAt)?
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
    required TResult Function(EmptyCartItem value) empty,
    required TResult Function(NormalCartItem value) normal,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyCartItem value)? empty,
    TResult? Function(NormalCartItem value)? normal,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyCartItem value)? empty,
    TResult Function(NormalCartItem value)? normal,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EmptyCartItemToJson(
      this,
    );
  }
}

abstract class EmptyCartItem extends CartItem {
  const factory EmptyCartItem() = _$EmptyCartItem;
  const EmptyCartItem._() : super._();

  factory EmptyCartItem.fromJson(Map<String, dynamic> json) =
      _$EmptyCartItem.fromJson;
}

/// @nodoc
abstract class _$$NormalCartItemCopyWith<$Res> {
  factory _$$NormalCartItemCopyWith(
          _$NormalCartItem value, $Res Function(_$NormalCartItem) then) =
      __$$NormalCartItemCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {NormalProduct product,
      int amount,
      @DateTimeTimestampConverter()
      @JsonKey(name: 'created_at')
      DateTime? createdAt,
      @DateTimeTimestampConverter()
      @JsonKey(name: 'modified_at')
      DateTime? modifiedAt});
}

/// @nodoc
class __$$NormalCartItemCopyWithImpl<$Res>
    extends _$CartItemCopyWithImpl<$Res, _$NormalCartItem>
    implements _$$NormalCartItemCopyWith<$Res> {
  __$$NormalCartItemCopyWithImpl(
      _$NormalCartItem _value, $Res Function(_$NormalCartItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = freezed,
    Object? amount = null,
    Object? createdAt = freezed,
    Object? modifiedAt = freezed,
  }) {
    return _then(_$NormalCartItem(
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as NormalProduct,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      modifiedAt: freezed == modifiedAt
          ? _value.modifiedAt
          : modifiedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$NormalCartItem extends NormalCartItem {
  _$NormalCartItem(
      {required this.product,
      this.amount = 1,
      @DateTimeTimestampConverter() @JsonKey(name: 'created_at') this.createdAt,
      @DateTimeTimestampConverter()
      @JsonKey(name: 'modified_at')
      this.modifiedAt,
      final String? $type})
      : assert(amount >= 0, 'amount cannot negative'),
        $type = $type ?? 'normal',
        super._();

  factory _$NormalCartItem.fromJson(Map<String, dynamic> json) =>
      _$$NormalCartItemFromJson(json);

// required String id,
  @override
  final NormalProduct product;
  @override
  @JsonKey()
  final int amount;
  @override
  @DateTimeTimestampConverter()
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @DateTimeTimestampConverter()
  @JsonKey(name: 'modified_at')
  final DateTime? modifiedAt;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'CartItem.normal(product: $product, amount: $amount, createdAt: $createdAt, modifiedAt: $modifiedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NormalCartItem &&
            const DeepCollectionEquality().equals(other.product, product) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.modifiedAt, modifiedAt) ||
                other.modifiedAt == modifiedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(product),
      amount,
      createdAt,
      modifiedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NormalCartItemCopyWith<_$NormalCartItem> get copyWith =>
      __$$NormalCartItemCopyWithImpl<_$NormalCartItem>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(
            NormalProduct product,
            int amount,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'modified_at')
            DateTime? modifiedAt)
        normal,
  }) {
    return normal(product, amount, createdAt, modifiedAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(
            NormalProduct product,
            int amount,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'modified_at')
            DateTime? modifiedAt)?
        normal,
  }) {
    return normal?.call(product, amount, createdAt, modifiedAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(
            NormalProduct product,
            int amount,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'modified_at')
            DateTime? modifiedAt)?
        normal,
    required TResult orElse(),
  }) {
    if (normal != null) {
      return normal(product, amount, createdAt, modifiedAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyCartItem value) empty,
    required TResult Function(NormalCartItem value) normal,
  }) {
    return normal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyCartItem value)? empty,
    TResult? Function(NormalCartItem value)? normal,
  }) {
    return normal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyCartItem value)? empty,
    TResult Function(NormalCartItem value)? normal,
    required TResult orElse(),
  }) {
    if (normal != null) {
      return normal(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NormalCartItemToJson(
      this,
    );
  }
}

abstract class NormalCartItem extends CartItem {
  factory NormalCartItem(
      {required final NormalProduct product,
      final int amount,
      @DateTimeTimestampConverter()
      @JsonKey(name: 'created_at')
      final DateTime? createdAt,
      @DateTimeTimestampConverter()
      @JsonKey(name: 'modified_at')
      final DateTime? modifiedAt}) = _$NormalCartItem;
  NormalCartItem._() : super._();

  factory NormalCartItem.fromJson(Map<String, dynamic> json) =
      _$NormalCartItem.fromJson;

// required String id,
  NormalProduct get product;
  int get amount;
  @DateTimeTimestampConverter()
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @DateTimeTimestampConverter()
  @JsonKey(name: 'modified_at')
  DateTime? get modifiedAt;
  @JsonKey(ignore: true)
  _$$NormalCartItemCopyWith<_$NormalCartItem> get copyWith =>
      throw _privateConstructorUsedError;
}
