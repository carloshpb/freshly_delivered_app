// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Product _$ProductFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'empty':
      return EmptyProduct.fromJson(json);
    case 'normal':
      return NormalProduct.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Product',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Product {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(
            String id,
            String title,
            double price,
            String description,
            String category,
            @JsonKey(name: 'image_path') String imagePath,
            @JsonKey(name: 'units_sold') int unitsSold,
            @JsonKey(name: 'advertisement_id') String advertisementId,
            int discount,
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
            String id,
            String title,
            double price,
            String description,
            String category,
            @JsonKey(name: 'image_path') String imagePath,
            @JsonKey(name: 'units_sold') int unitsSold,
            @JsonKey(name: 'advertisement_id') String advertisementId,
            int discount,
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
            String id,
            String title,
            double price,
            String description,
            String category,
            @JsonKey(name: 'image_path') String imagePath,
            @JsonKey(name: 'units_sold') int unitsSold,
            @JsonKey(name: 'advertisement_id') String advertisementId,
            int discount,
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
    required TResult Function(EmptyProduct value) empty,
    required TResult Function(NormalProduct value) normal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyProduct value)? empty,
    TResult? Function(NormalProduct value)? normal,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyProduct value)? empty,
    TResult Function(NormalProduct value)? normal,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EmptyProductCopyWith<$Res> {
  factory _$$EmptyProductCopyWith(
          _$EmptyProduct value, $Res Function(_$EmptyProduct) then) =
      __$$EmptyProductCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmptyProductCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$EmptyProduct>
    implements _$$EmptyProductCopyWith<$Res> {
  __$$EmptyProductCopyWithImpl(
      _$EmptyProduct _value, $Res Function(_$EmptyProduct) _then)
      : super(_value, _then);
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$EmptyProduct extends EmptyProduct {
  const _$EmptyProduct({final String? $type})
      : $type = $type ?? 'empty',
        super._();

  factory _$EmptyProduct.fromJson(Map<String, dynamic> json) =>
      _$$EmptyProductFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Product.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EmptyProduct);
  }

  @JsonKey(ignore: true)
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
            String category,
            @JsonKey(name: 'image_path') String imagePath,
            @JsonKey(name: 'units_sold') int unitsSold,
            @JsonKey(name: 'advertisement_id') String advertisementId,
            int discount,
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
            String id,
            String title,
            double price,
            String description,
            String category,
            @JsonKey(name: 'image_path') String imagePath,
            @JsonKey(name: 'units_sold') int unitsSold,
            @JsonKey(name: 'advertisement_id') String advertisementId,
            int discount,
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
            String id,
            String title,
            double price,
            String description,
            String category,
            @JsonKey(name: 'image_path') String imagePath,
            @JsonKey(name: 'units_sold') int unitsSold,
            @JsonKey(name: 'advertisement_id') String advertisementId,
            int discount,
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
    required TResult Function(EmptyProduct value) empty,
    required TResult Function(NormalProduct value) normal,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyProduct value)? empty,
    TResult? Function(NormalProduct value)? normal,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyProduct value)? empty,
    TResult Function(NormalProduct value)? normal,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$EmptyProductToJson(
      this,
    );
  }
}

abstract class EmptyProduct extends Product {
  const factory EmptyProduct() = _$EmptyProduct;
  const EmptyProduct._() : super._();

  factory EmptyProduct.fromJson(Map<String, dynamic> json) =
      _$EmptyProduct.fromJson;
}

/// @nodoc
abstract class _$$NormalProductCopyWith<$Res> {
  factory _$$NormalProductCopyWith(
          _$NormalProduct value, $Res Function(_$NormalProduct) then) =
      __$$NormalProductCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String id,
      String title,
      double price,
      String description,
      String category,
      @JsonKey(name: 'image_path') String imagePath,
      @JsonKey(name: 'units_sold') int unitsSold,
      @JsonKey(name: 'advertisement_id') String advertisementId,
      int discount,
      @DateTimeTimestampConverter()
      @JsonKey(name: 'created_at')
      DateTime? createdAt,
      @DateTimeTimestampConverter()
      @JsonKey(name: 'modified_at')
      DateTime? modifiedAt});
}

/// @nodoc
class __$$NormalProductCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$NormalProduct>
    implements _$$NormalProductCopyWith<$Res> {
  __$$NormalProductCopyWithImpl(
      _$NormalProduct _value, $Res Function(_$NormalProduct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? price = null,
    Object? description = null,
    Object? category = null,
    Object? imagePath = null,
    Object? unitsSold = null,
    Object? advertisementId = null,
    Object? discount = null,
    Object? createdAt = freezed,
    Object? modifiedAt = freezed,
  }) {
    return _then(_$NormalProduct(
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
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
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
class _$NormalProduct extends NormalProduct {
  const _$NormalProduct(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.category,
      @JsonKey(name: 'image_path') required this.imagePath,
      @JsonKey(name: 'units_sold') this.unitsSold = 0,
      @JsonKey(name: 'advertisement_id') this.advertisementId = '',
      this.discount = 0,
      @DateTimeTimestampConverter() @JsonKey(name: 'created_at') this.createdAt,
      @DateTimeTimestampConverter()
      @JsonKey(name: 'modified_at')
      this.modifiedAt,
      final String? $type})
      : assert(price >= 0.0, 'price cannot be negative'),
        assert(id != "", 'id cannot be empty'),
        assert(title != "", 'title cannot be empty'),
        assert(description != "", 'description cannot be empty'),
        assert(category != "", 'category cannot be empty'),
        assert(imagePath != "", 'imagePath cannot be empty'),
        $type = $type ?? 'normal',
        super._();

  factory _$NormalProduct.fromJson(Map<String, dynamic> json) =>
      _$$NormalProductFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final double price;
  @override
  final String description;
  @override
  final String category;
  @override
  @JsonKey(name: 'image_path')
  final String imagePath;
  @override
  @JsonKey(name: 'units_sold')
  final int unitsSold;
  @override
  @JsonKey(name: 'advertisement_id')
  final String advertisementId;
  @override
  @JsonKey()
  final int discount;
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
    return 'Product.normal(id: $id, title: $title, price: $price, description: $description, category: $category, imagePath: $imagePath, unitsSold: $unitsSold, advertisementId: $advertisementId, discount: $discount, createdAt: $createdAt, modifiedAt: $modifiedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NormalProduct &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.unitsSold, unitsSold) ||
                other.unitsSold == unitsSold) &&
            (identical(other.advertisementId, advertisementId) ||
                other.advertisementId == advertisementId) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.modifiedAt, modifiedAt) ||
                other.modifiedAt == modifiedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      price,
      description,
      category,
      imagePath,
      unitsSold,
      advertisementId,
      discount,
      createdAt,
      modifiedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NormalProductCopyWith<_$NormalProduct> get copyWith =>
      __$$NormalProductCopyWithImpl<_$NormalProduct>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(
            String id,
            String title,
            double price,
            String description,
            String category,
            @JsonKey(name: 'image_path') String imagePath,
            @JsonKey(name: 'units_sold') int unitsSold,
            @JsonKey(name: 'advertisement_id') String advertisementId,
            int discount,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'modified_at')
            DateTime? modifiedAt)
        normal,
  }) {
    return normal(id, title, price, description, category, imagePath, unitsSold,
        advertisementId, discount, createdAt, modifiedAt);
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
            String category,
            @JsonKey(name: 'image_path') String imagePath,
            @JsonKey(name: 'units_sold') int unitsSold,
            @JsonKey(name: 'advertisement_id') String advertisementId,
            int discount,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'created_at')
            DateTime? createdAt,
            @DateTimeTimestampConverter()
            @JsonKey(name: 'modified_at')
            DateTime? modifiedAt)?
        normal,
  }) {
    return normal?.call(id, title, price, description, category, imagePath,
        unitsSold, advertisementId, discount, createdAt, modifiedAt);
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
            String category,
            @JsonKey(name: 'image_path') String imagePath,
            @JsonKey(name: 'units_sold') int unitsSold,
            @JsonKey(name: 'advertisement_id') String advertisementId,
            int discount,
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
      return normal(id, title, price, description, category, imagePath,
          unitsSold, advertisementId, discount, createdAt, modifiedAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmptyProduct value) empty,
    required TResult Function(NormalProduct value) normal,
  }) {
    return normal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(EmptyProduct value)? empty,
    TResult? Function(NormalProduct value)? normal,
  }) {
    return normal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmptyProduct value)? empty,
    TResult Function(NormalProduct value)? normal,
    required TResult orElse(),
  }) {
    if (normal != null) {
      return normal(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NormalProductToJson(
      this,
    );
  }
}

abstract class NormalProduct extends Product {
  const factory NormalProduct(
      {required final String id,
      required final String title,
      required final double price,
      required final String description,
      required final String category,
      @JsonKey(name: 'image_path') required final String imagePath,
      @JsonKey(name: 'units_sold') final int unitsSold,
      @JsonKey(name: 'advertisement_id') final String advertisementId,
      final int discount,
      @DateTimeTimestampConverter()
      @JsonKey(name: 'created_at')
      final DateTime? createdAt,
      @DateTimeTimestampConverter()
      @JsonKey(name: 'modified_at')
      final DateTime? modifiedAt}) = _$NormalProduct;
  const NormalProduct._() : super._();

  factory NormalProduct.fromJson(Map<String, dynamic> json) =
      _$NormalProduct.fromJson;

  String get id;
  String get title;
  double get price;
  String get description;
  String get category;
  @JsonKey(name: 'image_path')
  String get imagePath;
  @JsonKey(name: 'units_sold')
  int get unitsSold;
  @JsonKey(name: 'advertisement_id')
  String get advertisementId;
  int get discount;
  @DateTimeTimestampConverter()
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @DateTimeTimestampConverter()
  @JsonKey(name: 'modified_at')
  DateTime? get modifiedAt;
  @JsonKey(ignore: true)
  _$$NormalProductCopyWith<_$NormalProduct> get copyWith =>
      throw _privateConstructorUsedError;
}
