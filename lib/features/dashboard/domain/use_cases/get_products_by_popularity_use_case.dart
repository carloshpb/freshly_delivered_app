import 'dart:async';

import '../../../use_case.dart';
import '../../application/dtos/product_dto.dart';

abstract class GetProductsByPopularityUseCase
    implements
        UseCase<({int lastProductPosition, ProductDto? lastProductObject}),
            List<ProductDto>> {
  @override
  FutureOr<List<ProductDto>> execute(
      ({int lastProductPosition, ProductDto? lastProductObject}) request);
}
