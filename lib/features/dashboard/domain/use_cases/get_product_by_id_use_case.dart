import 'dart:async';

import '../../../use_case.dart';
import '../../application/dtos/product_dto.dart';

abstract class GetProductByIdUseCase implements UseCase<String, ProductDto> {
  @override
  FutureOr<ProductDto> execute(String request);
}
