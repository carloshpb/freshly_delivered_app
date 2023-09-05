// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HomeState {
  List<AdvertisementDto> get advertisements =>
      throw _privateConstructorUsedError;
  List<ProductDto> get popularProducts =>
      throw _privateConstructorUsedError; // required List<ProductDto> firstPopularProducts,
// required List<ProductDto> secondPopularProducts,
  AdvertisementDto get specialOffer => throw _privateConstructorUsedError;
  List<ProductDto> get specialOfferProducts =>
      throw _privateConstructorUsedError;
  String get searchProductName => throw _privateConstructorUsedError;
  List<ProductDto> get searchProductsResult =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {List<AdvertisementDto> advertisements,
      List<ProductDto> popularProducts,
      AdvertisementDto specialOffer,
      List<ProductDto> specialOfferProducts,
      String searchProductName,
      List<ProductDto> searchProductsResult});

  $AdvertisementDtoCopyWith<$Res> get specialOffer;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? advertisements = null,
    Object? popularProducts = null,
    Object? specialOffer = null,
    Object? specialOfferProducts = null,
    Object? searchProductName = null,
    Object? searchProductsResult = null,
  }) {
    return _then(_value.copyWith(
      advertisements: null == advertisements
          ? _value.advertisements
          : advertisements // ignore: cast_nullable_to_non_nullable
              as List<AdvertisementDto>,
      popularProducts: null == popularProducts
          ? _value.popularProducts
          : popularProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductDto>,
      specialOffer: null == specialOffer
          ? _value.specialOffer
          : specialOffer // ignore: cast_nullable_to_non_nullable
              as AdvertisementDto,
      specialOfferProducts: null == specialOfferProducts
          ? _value.specialOfferProducts
          : specialOfferProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductDto>,
      searchProductName: null == searchProductName
          ? _value.searchProductName
          : searchProductName // ignore: cast_nullable_to_non_nullable
              as String,
      searchProductsResult: null == searchProductsResult
          ? _value.searchProductsResult
          : searchProductsResult // ignore: cast_nullable_to_non_nullable
              as List<ProductDto>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AdvertisementDtoCopyWith<$Res> get specialOffer {
    return $AdvertisementDtoCopyWith<$Res>(_value.specialOffer, (value) {
      return _then(_value.copyWith(specialOffer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$$_HomeStateCopyWith(
          _$_HomeState value, $Res Function(_$_HomeState) then) =
      __$$_HomeStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AdvertisementDto> advertisements,
      List<ProductDto> popularProducts,
      AdvertisementDto specialOffer,
      List<ProductDto> specialOfferProducts,
      String searchProductName,
      List<ProductDto> searchProductsResult});

  @override
  $AdvertisementDtoCopyWith<$Res> get specialOffer;
}

/// @nodoc
class __$$_HomeStateCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$_HomeState>
    implements _$$_HomeStateCopyWith<$Res> {
  __$$_HomeStateCopyWithImpl(
      _$_HomeState _value, $Res Function(_$_HomeState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? advertisements = null,
    Object? popularProducts = null,
    Object? specialOffer = null,
    Object? specialOfferProducts = null,
    Object? searchProductName = null,
    Object? searchProductsResult = null,
  }) {
    return _then(_$_HomeState(
      advertisements: null == advertisements
          ? _value._advertisements
          : advertisements // ignore: cast_nullable_to_non_nullable
              as List<AdvertisementDto>,
      popularProducts: null == popularProducts
          ? _value._popularProducts
          : popularProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductDto>,
      specialOffer: null == specialOffer
          ? _value.specialOffer
          : specialOffer // ignore: cast_nullable_to_non_nullable
              as AdvertisementDto,
      specialOfferProducts: null == specialOfferProducts
          ? _value._specialOfferProducts
          : specialOfferProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductDto>,
      searchProductName: null == searchProductName
          ? _value.searchProductName
          : searchProductName // ignore: cast_nullable_to_non_nullable
              as String,
      searchProductsResult: null == searchProductsResult
          ? _value._searchProductsResult
          : searchProductsResult // ignore: cast_nullable_to_non_nullable
              as List<ProductDto>,
    ));
  }
}

/// @nodoc

class _$_HomeState implements _HomeState {
  const _$_HomeState(
      {required final List<AdvertisementDto> advertisements,
      required final List<ProductDto> popularProducts,
      required this.specialOffer,
      required final List<ProductDto> specialOfferProducts,
      required this.searchProductName,
      required final List<ProductDto> searchProductsResult})
      : _advertisements = advertisements,
        _popularProducts = popularProducts,
        _specialOfferProducts = specialOfferProducts,
        _searchProductsResult = searchProductsResult;

  final List<AdvertisementDto> _advertisements;
  @override
  List<AdvertisementDto> get advertisements {
    if (_advertisements is EqualUnmodifiableListView) return _advertisements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_advertisements);
  }

  final List<ProductDto> _popularProducts;
  @override
  List<ProductDto> get popularProducts {
    if (_popularProducts is EqualUnmodifiableListView) return _popularProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_popularProducts);
  }

// required List<ProductDto> firstPopularProducts,
// required List<ProductDto> secondPopularProducts,
  @override
  final AdvertisementDto specialOffer;
  final List<ProductDto> _specialOfferProducts;
  @override
  List<ProductDto> get specialOfferProducts {
    if (_specialOfferProducts is EqualUnmodifiableListView)
      return _specialOfferProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_specialOfferProducts);
  }

  @override
  final String searchProductName;
  final List<ProductDto> _searchProductsResult;
  @override
  List<ProductDto> get searchProductsResult {
    if (_searchProductsResult is EqualUnmodifiableListView)
      return _searchProductsResult;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchProductsResult);
  }

  @override
  String toString() {
    return 'HomeState(advertisements: $advertisements, popularProducts: $popularProducts, specialOffer: $specialOffer, specialOfferProducts: $specialOfferProducts, searchProductName: $searchProductName, searchProductsResult: $searchProductsResult)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            const DeepCollectionEquality()
                .equals(other._advertisements, _advertisements) &&
            const DeepCollectionEquality()
                .equals(other._popularProducts, _popularProducts) &&
            (identical(other.specialOffer, specialOffer) ||
                other.specialOffer == specialOffer) &&
            const DeepCollectionEquality()
                .equals(other._specialOfferProducts, _specialOfferProducts) &&
            (identical(other.searchProductName, searchProductName) ||
                other.searchProductName == searchProductName) &&
            const DeepCollectionEquality()
                .equals(other._searchProductsResult, _searchProductsResult));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_advertisements),
      const DeepCollectionEquality().hash(_popularProducts),
      specialOffer,
      const DeepCollectionEquality().hash(_specialOfferProducts),
      searchProductName,
      const DeepCollectionEquality().hash(_searchProductsResult));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {required final List<AdvertisementDto> advertisements,
      required final List<ProductDto> popularProducts,
      required final AdvertisementDto specialOffer,
      required final List<ProductDto> specialOfferProducts,
      required final String searchProductName,
      required final List<ProductDto> searchProductsResult}) = _$_HomeState;

  @override
  List<AdvertisementDto> get advertisements;
  @override
  List<ProductDto> get popularProducts;
  @override // required List<ProductDto> firstPopularProducts,
// required List<ProductDto> secondPopularProducts,
  AdvertisementDto get specialOffer;
  @override
  List<ProductDto> get specialOfferProducts;
  @override
  String get searchProductName;
  @override
  List<ProductDto> get searchProductsResult;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
