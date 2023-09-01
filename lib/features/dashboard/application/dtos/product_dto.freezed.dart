// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductDto {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  int get unitsSold => throw _privateConstructorUsedError;
  String get advertisementId => throw _privateConstructorUsedError;
  int get discount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductDtoCopyWith<ProductDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDtoCopyWith<$Res> {
  factory $ProductDtoCopyWith(
          ProductDto value, $Res Function(ProductDto) then) =
      _$ProductDtoCopyWithImpl<$Res, ProductDto>;
  @useResult
  $Res call(
      {String id,
      String title,
      double price,
      String description,
      String imagePath,
      String category,
      int unitsSold,
      String advertisementId,
      int discount});
}

/// @nodoc
class _$ProductDtoCopyWithImpl<$Res, $Val extends ProductDto>
    implements $ProductDtoCopyWith<$Res> {
  _$ProductDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? price = null,
    Object? description = null,
    Object? imagePath = null,
    Object? category = null,
    Object? unitsSold = null,
    Object? advertisementId = null,
    Object? discount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      unitsSold: null == unitsSold
          ? _value.unitsSold
          : unitsSold // ignore: cast_nullable_to_non_nullable
              as int,
      advertisementId: null == advertisementId
          ? _value.advertisementId
          : advertisementId // ignore: cast_nullable_to_non_nullable
              as String,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProductDtoCopyWith<$Res>
    implements $ProductDtoCopyWith<$Res> {
  factory _$$_ProductDtoCopyWith(
          _$_ProductDto value, $Res Function(_$_ProductDto) then) =
      __$$_ProductDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      double price,
      String description,
      String imagePath,
      String category,
      int unitsSold,
      String advertisementId,
      int discount});
}

/// @nodoc
class __$$_ProductDtoCopyWithImpl<$Res>
    extends _$ProductDtoCopyWithImpl<$Res, _$_ProductDto>
    implements _$$_ProductDtoCopyWith<$Res> {
  __$$_ProductDtoCopyWithImpl(
      _$_ProductDto _value, $Res Function(_$_ProductDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? price = null,
    Object? description = null,
    Object? imagePath = null,
    Object? category = null,
    Object? unitsSold = null,
    Object? advertisementId = null,
    Object? discount = null,
  }) {
    return _then(_$_ProductDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      unitsSold: null == unitsSold
          ? _value.unitsSold
          : unitsSold // ignore: cast_nullable_to_non_nullable
              as int,
      advertisementId: null == advertisementId
          ? _value.advertisementId
          : advertisementId // ignore: cast_nullable_to_non_nullable
              as String,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ProductDto extends _ProductDto {
  const _$_ProductDto(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.imagePath,
      required this.category,
      this.unitsSold = 0,
      this.advertisementId = '',
      this.discount = 0})
      : assert(price >= 0.0, 'price cannot be negative'),
        assert(id != "", 'id cannot be empty'),
        assert(title != "", 'title cannot be empty'),
        assert(description != "", 'description cannot be empty'),
        assert(category != "", 'category cannot be empty'),
        assert(imagePath != "", 'imagePath cannot be empty'),
        super._();

  @override
  final String id;
  @override
  final String title;
  @override
  final double price;
  @override
  final String description;
  @override
  final String imagePath;
  @override
  final String category;
  @override
  @JsonKey()
  final int unitsSold;
  @override
  @JsonKey()
  final String advertisementId;
  @override
  @JsonKey()
  final int discount;

  @override
  String toString() {
    return 'ProductDto(id: $id, title: $title, price: $price, description: $description, imagePath: $imagePath, category: $category, unitsSold: $unitsSold, advertisementId: $advertisementId, discount: $discount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProductDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.unitsSold, unitsSold) ||
                other.unitsSold == unitsSold) &&
            (identical(other.advertisementId, advertisementId) ||
                other.advertisementId == advertisementId) &&
            (identical(other.discount, discount) ||
                other.discount == discount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, price, description,
      imagePath, category, unitsSold, advertisementId, discount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProductDtoCopyWith<_$_ProductDto> get copyWith =>
      __$$_ProductDtoCopyWithImpl<_$_ProductDto>(this, _$identity);
}

abstract class _ProductDto extends ProductDto {
  const factory _ProductDto(
      {required final String id,
      required final String title,
      required final double price,
      required final String description,
      required final String imagePath,
      required final String category,
      final int unitsSold,
      final String advertisementId,
      final int discount}) = _$_ProductDto;
  const _ProductDto._() : super._();

  @override
  String get id;
  @override
  String get title;
  @override
  double get price;
  @override
  String get description;
  @override
  String get imagePath;
  @override
  String get category;
  @override
  int get unitsSold;
  @override
  String get advertisementId;
  @override
  int get discount;
  @override
  @JsonKey(ignore: true)
  _$$_ProductDtoCopyWith<_$_ProductDto> get copyWith =>
      throw _privateConstructorUsedError;
}
