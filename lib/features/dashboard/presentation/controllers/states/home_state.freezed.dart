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
  List<ProductDto> get firstPopularProducts =>
      throw _privateConstructorUsedError;
  List<ProductDto> get secondPopularProducts =>
      throw _privateConstructorUsedError;
  AdvertisementDto get specialOffer => throw _privateConstructorUsedError;

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
      List<ProductDto> firstPopularProducts,
      List<ProductDto> secondPopularProducts,
      AdvertisementDto specialOffer});

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
    Object? firstPopularProducts = null,
    Object? secondPopularProducts = null,
    Object? specialOffer = null,
  }) {
    return _then(_value.copyWith(
      advertisements: null == advertisements
          ? _value.advertisements
          : advertisements // ignore: cast_nullable_to_non_nullable
              as List<AdvertisementDto>,
      firstPopularProducts: null == firstPopularProducts
          ? _value.firstPopularProducts
          : firstPopularProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductDto>,
      secondPopularProducts: null == secondPopularProducts
          ? _value.secondPopularProducts
          : secondPopularProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductDto>,
      specialOffer: null == specialOffer
          ? _value.specialOffer
          : specialOffer // ignore: cast_nullable_to_non_nullable
              as AdvertisementDto,
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
      List<ProductDto> firstPopularProducts,
      List<ProductDto> secondPopularProducts,
      AdvertisementDto specialOffer});

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
    Object? firstPopularProducts = null,
    Object? secondPopularProducts = null,
    Object? specialOffer = null,
  }) {
    return _then(_$_HomeState(
      advertisements: null == advertisements
          ? _value._advertisements
          : advertisements // ignore: cast_nullable_to_non_nullable
              as List<AdvertisementDto>,
      firstPopularProducts: null == firstPopularProducts
          ? _value._firstPopularProducts
          : firstPopularProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductDto>,
      secondPopularProducts: null == secondPopularProducts
          ? _value._secondPopularProducts
          : secondPopularProducts // ignore: cast_nullable_to_non_nullable
              as List<ProductDto>,
      specialOffer: null == specialOffer
          ? _value.specialOffer
          : specialOffer // ignore: cast_nullable_to_non_nullable
              as AdvertisementDto,
    ));
  }
}

/// @nodoc

class _$_HomeState implements _HomeState {
  const _$_HomeState(
      {required final List<AdvertisementDto> advertisements,
      required final List<ProductDto> firstPopularProducts,
      required final List<ProductDto> secondPopularProducts,
      required this.specialOffer})
      : _advertisements = advertisements,
        _firstPopularProducts = firstPopularProducts,
        _secondPopularProducts = secondPopularProducts;

  final List<AdvertisementDto> _advertisements;
  @override
  List<AdvertisementDto> get advertisements {
    if (_advertisements is EqualUnmodifiableListView) return _advertisements;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_advertisements);
  }

  final List<ProductDto> _firstPopularProducts;
  @override
  List<ProductDto> get firstPopularProducts {
    if (_firstPopularProducts is EqualUnmodifiableListView)
      return _firstPopularProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_firstPopularProducts);
  }

  final List<ProductDto> _secondPopularProducts;
  @override
  List<ProductDto> get secondPopularProducts {
    if (_secondPopularProducts is EqualUnmodifiableListView)
      return _secondPopularProducts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_secondPopularProducts);
  }

  @override
  final AdvertisementDto specialOffer;

  @override
  String toString() {
    return 'HomeState(advertisements: $advertisements, firstPopularProducts: $firstPopularProducts, secondPopularProducts: $secondPopularProducts, specialOffer: $specialOffer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_HomeState &&
            const DeepCollectionEquality()
                .equals(other._advertisements, _advertisements) &&
            const DeepCollectionEquality()
                .equals(other._firstPopularProducts, _firstPopularProducts) &&
            const DeepCollectionEquality()
                .equals(other._secondPopularProducts, _secondPopularProducts) &&
            (identical(other.specialOffer, specialOffer) ||
                other.specialOffer == specialOffer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_advertisements),
      const DeepCollectionEquality().hash(_firstPopularProducts),
      const DeepCollectionEquality().hash(_secondPopularProducts),
      specialOffer);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      __$$_HomeStateCopyWithImpl<_$_HomeState>(this, _$identity);
}

abstract class _HomeState implements HomeState {
  const factory _HomeState(
      {required final List<AdvertisementDto> advertisements,
      required final List<ProductDto> firstPopularProducts,
      required final List<ProductDto> secondPopularProducts,
      required final AdvertisementDto specialOffer}) = _$_HomeState;

  @override
  List<AdvertisementDto> get advertisements;
  @override
  List<ProductDto> get firstPopularProducts;
  @override
  List<ProductDto> get secondPopularProducts;
  @override
  AdvertisementDto get specialOffer;
  @override
  @JsonKey(ignore: true)
  _$$_HomeStateCopyWith<_$_HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}
