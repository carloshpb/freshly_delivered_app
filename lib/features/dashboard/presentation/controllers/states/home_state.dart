import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../application/dtos/advertisement_dto.dart';
import '../../../application/dtos/product_dto.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required List<AdvertisementDto> advertisements,
    required List<ProductDto> popularProducts,
    required AdvertisementDto specialOffer,
    required List<ProductDto> specialOfferProducts,
    required String searchProductName,
    required List<ProductDto> searchProductsResult,
  }) = _HomeState;

  factory HomeState.blank() => HomeState(
        advertisements: [],
        specialOffer: AdvertisementDto.empty(),
        searchProductName: '',
        searchProductsResult: [],
        popularProducts: [],
        specialOfferProducts: [],
      );
}
