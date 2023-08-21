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
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(
            String id,
            String title,
            double price,
            String description,
            String imagePath,
            String category,
            int unitsSold,
            String advertisementId,
            int discount)
        normal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(
            String id,
            String title,
            double price,
            String description,
            String imagePath,
            String category,
            int unitsSold,
            String advertisementId,
            int discount)?
        normal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(
            String id,
            String title,
            double price,
            String description,
            String imagePath,
            String category,
            int unitsSold,
            String advertisementId,
            int discount)?
        normal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyProductDto value) empty,
    required TResult Function(NormalProductDto value) normal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyProductDto value)? empty,
    TResult? Function(NormalProductDto value)? normal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyProductDto value)? empty,
    TResult Function(NormalProductDto value)? normal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDtoCopyWith<$Res> {
  factory $ProductDtoCopyWith(
          ProductDto value, $Res Function(ProductDto) then) =
      _$ProductDtoCopyWithImpl<$Res, ProductDto>;
}

/// @nodoc
class _$ProductDtoCopyWithImpl<$Res, $Val extends ProductDto>
    implements $ProductDtoCopyWith<$Res> {
  _$ProductDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EmptyProductDtoCopyWith<$Res> {
  factory _$$EmptyProductDtoCopyWith(
          _$EmptyProductDto value, $Res Function(_$EmptyProductDto) then) =
      __$$EmptyProductDtoCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyProductDtoCopyWithImpl<$Res>
    extends _$ProductDtoCopyWithImpl<$Res, _$EmptyProductDto>
    implements _$$EmptyProductDtoCopyWith<$Res> {
  __$$EmptyProductDtoCopyWithImpl(
      _$EmptyProductDto _value, $Res Function(_$EmptyProductDto) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EmptyProductDto extends EmptyProductDto {
  const _$EmptyProductDto() : super._();

  @override
  String toString() {
    return 'ProductDto.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyProductDto);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(
            String id,
            String title,
            double price,
            String description,
            String imagePath,
            String category,
            int unitsSold,
            String advertisementId,
            int discount)
        normal,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(
            String id,
            String title,
            double price,
            String description,
            String imagePath,
            String category,
            int unitsSold,
            String advertisementId,
            int discount)?
        normal,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(
            String id,
            String title,
            double price,
            String description,
            String imagePath,
            String category,
            int unitsSold,
            String advertisementId,
            int discount)?
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
    required TResult Function(EmptyProductDto value) empty,
    required TResult Function(NormalProductDto value) normal,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyProductDto value)? empty,
    TResult? Function(NormalProductDto value)? normal,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyProductDto value)? empty,
    TResult Function(NormalProductDto value)? normal,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class EmptyProductDto extends ProductDto {
  const factory EmptyProductDto() = _$EmptyProductDto;
  const EmptyProductDto._() : super._();
}

/// @nodoc
abstract class _$$NormalProductDtoCopyWith<$Res> {
  factory _$$NormalProductDtoCopyWith(
          _$NormalProductDto value, $Res Function(_$NormalProductDto) then) =
      __$$NormalProductDtoCopyWithImpl<$Res>;
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
class __$$NormalProductDtoCopyWithImpl<$Res>
    extends _$ProductDtoCopyWithImpl<$Res, _$NormalProductDto>
    implements _$$NormalProductDtoCopyWith<$Res> {
  __$$NormalProductDtoCopyWithImpl(
      _$NormalProductDto _value, $Res Function(_$NormalProductDto) _then)
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
    return _then(_$NormalProductDto(
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

class _$NormalProductDto extends NormalProductDto {
  const _$NormalProductDto(
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
    return 'ProductDto.normal(id: $id, title: $title, price: $price, description: $description, imagePath: $imagePath, category: $category, unitsSold: $unitsSold, advertisementId: $advertisementId, discount: $discount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NormalProductDto &&
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
  _$$NormalProductDtoCopyWith<_$NormalProductDto> get copyWith =>
      __$$NormalProductDtoCopyWithImpl<_$NormalProductDto>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(
            String id,
            String title,
            double price,
            String description,
            String imagePath,
            String category,
            int unitsSold,
            String advertisementId,
            int discount)
        normal,
  }) {
    return normal(id, title, price, description, imagePath, category, unitsSold,
        advertisementId, discount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(
            String id,
            String title,
            double price,
            String description,
            String imagePath,
            String category,
            int unitsSold,
            String advertisementId,
            int discount)?
        normal,
  }) {
    return normal?.call(id, title, price, description, imagePath, category,
        unitsSold, advertisementId, discount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(
            String id,
            String title,
            double price,
            String description,
            String imagePath,
            String category,
            int unitsSold,
            String advertisementId,
            int discount)?
        normal,
    required TResult orElse(),
  }) {
    if (normal != null) {
      return normal(id, title, price, description, imagePath, category,
          unitsSold, advertisementId, discount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyProductDto value) empty,
    required TResult Function(NormalProductDto value) normal,
  }) {
    return normal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyProductDto value)? empty,
    TResult? Function(NormalProductDto value)? normal,
  }) {
    return normal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyProductDto value)? empty,
    TResult Function(NormalProductDto value)? normal,
    required TResult orElse(),
  }) {
    if (normal != null) {
      return normal(this);
    }
    return orElse();
  }
}

abstract class NormalProductDto extends ProductDto {
  const factory NormalProductDto(
      {required final String id,
      required final String title,
      required final double price,
      required final String description,
      required final String imagePath,
      required final String category,
      final int unitsSold,
      final String advertisementId,
      final int discount}) = _$NormalProductDto;
  const NormalProductDto._() : super._();

  String get id;
  String get title;
  double get price;
  String get description;
  String get imagePath;
  String get category;
  int get unitsSold;
  String get advertisementId;
  int get discount;
  @JsonKey(ignore: true)
  _$$NormalProductDtoCopyWith<_$NormalProductDto> get copyWith =>
      throw _privateConstructorUsedError;
}
