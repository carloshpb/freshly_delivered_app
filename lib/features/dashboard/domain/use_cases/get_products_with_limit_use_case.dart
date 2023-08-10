import 'dart:async';

import '../../../use_case.dart';
import '../../application/dtos/product_dto.dart';

abstract class GetProductsWithLimitUseCase
    implements UseCase<({ProductDto? object, int position}), List<ProductDto>> {
  @override
  FutureOr<List<ProductDto>> execute(
      ({ProductDto? object, int position}) request);
}
