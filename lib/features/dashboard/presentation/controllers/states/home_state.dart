import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../application/dtos/advertisement_dto.dart';
import '../../../application/dtos/product_dto.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required List<AdvertisementDto> advertisements,
    required List<ProductDto> firstPopularProducts,
    required List<ProductDto> secondPopularProducts,
    required AdvertisementDto specialOffer,
  }) = _HomeState;
}
