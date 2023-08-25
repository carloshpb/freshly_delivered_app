import 'dart:async';

import '../../../use_case.dart';
import '../../application/dtos/product_dto.dart';

abstract class FetchCartItemsUseCase
    implements UseCase<void, Stream<List<ProductDto>>> {
  @override
  Stream<List<ProductDto>> execute([void request]);
}
