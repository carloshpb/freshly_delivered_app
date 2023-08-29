import 'dart:async';

import '../../../use_case.dart';
import '../../application/dtos/product_dto.dart';

abstract class GetProductsByNameUseCase
    implements
        UseCase<
            ({
              String productName,
              int position,
              NormalProductDto? productObject
            }),
            List<NormalProductDto>> {
  @override
  FutureOr<List<NormalProductDto>> execute(
      ({
        String productName,
        int position,
        NormalProductDto? productObject
      }) request);
}
