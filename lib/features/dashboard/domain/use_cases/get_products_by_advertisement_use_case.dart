import 'dart:async';

import '../../../use_case.dart';
import '../../application/dtos/advertisement_dto.dart';
import '../../application/dtos/product_dto.dart';

abstract class GetProductsByAdvertisementUseCase
    implements
        UseCase<
            ({
              NormalAdvertisementDto advertisement,
              int lastProductPosition,
              NormalProductDto? lastProductObject
            }),
            List<NormalProductDto>> {
  @override
  FutureOr<List<NormalProductDto>> execute(
      ({
        NormalAdvertisementDto advertisement,
        int lastProductPosition,
        NormalProductDto? lastProductObject
      }) request);
}
