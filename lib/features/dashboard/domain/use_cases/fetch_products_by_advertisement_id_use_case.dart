import 'dart:async';

import '../../../use_case.dart';
import '../../application/dtos/product_dto.dart';

abstract class FetchProductsByAdvertisementIdUseCase
    implements UseCase<String, Stream<List<NormalProductDto>>> {
  @override
  FutureOr<Stream<List<NormalProductDto>>> execute(String request);
}
