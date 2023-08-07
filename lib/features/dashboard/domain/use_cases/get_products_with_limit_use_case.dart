import 'dart:async';

import '../../../use_case.dart';
import '../../application/dtos/product_dto.dart';

abstract class GetProductsWithLimitUseCase
    implements UseCase<int, List<ProductDto>> {
  @override
  FutureOr<List<ProductDto>> execute(int request);
}
