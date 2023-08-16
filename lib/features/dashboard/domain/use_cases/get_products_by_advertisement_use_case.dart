import 'dart:async';

import '../../../use_case.dart';
import '../../application/dtos/advertisement_dto.dart';
import '../../application/dtos/product_dto.dart';

abstract class GetProductsByAdvertisementUseCase
    implements
        UseCase<
            ({
              AdvertisementDto advertisement,
              int lastProductPosition,
              ProductDto? lastProductObject
            }),
            List<ProductDto>> {
  @override
  FutureOr<List<ProductDto>> execute(
      ({
        AdvertisementDto advertisement,
        int lastProductPosition,
        ProductDto? lastProductObject
      }) request);
}
