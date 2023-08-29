import 'dart:async';

import '../../../use_case.dart';
import '../../application/dtos/product_dto.dart';

abstract class GetProductsByPopularityUseCase
    implements
        UseCase<
            ({int lastProductPosition, NormalProductDto? lastProductObject}),
            List<NormalProductDto>> {
  @override
  FutureOr<List<NormalProductDto>> execute(
      ({int lastProductPosition, NormalProductDto? lastProductObject}) request);
}
