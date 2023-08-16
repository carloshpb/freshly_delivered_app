import 'dart:async';

import '../../../use_case.dart';
import '../../application/dtos/product_dto.dart';

abstract class FetchProductsByAdvertisementIdUseCase
    implements UseCase<String, Stream<List<ProductDto>>> {
  @override
  FutureOr<Stream<List<ProductDto>>> execute(String request);
}
