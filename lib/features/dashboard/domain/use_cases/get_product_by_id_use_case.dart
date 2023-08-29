import 'dart:async';

import '../../../use_case.dart';
import '../../application/dtos/product_dto.dart';

abstract class GetProductByIdUseCase
    implements UseCase<String, NormalProductDto> {
  @override
  FutureOr<NormalProductDto> execute(String request);
}
