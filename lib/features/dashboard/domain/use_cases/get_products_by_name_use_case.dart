import 'dart:async';

import '../../../use_case.dart';
import '../../application/dtos/product_dto.dart';

abstract class GetProductsByNameUseCase
    implements
        UseCase<({String productName, int position, ProductDto? productObject}),
            List<ProductDto>> {
  @override
  FutureOr<List<ProductDto>> execute(
      ({String productName, int position, ProductDto? productObject}) request);
}
