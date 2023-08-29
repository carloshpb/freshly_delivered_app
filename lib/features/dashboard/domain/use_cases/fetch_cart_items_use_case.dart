import 'dart:async';

import '../../../use_case.dart';
import '../../application/dtos/product_dto.dart';

abstract class FetchCartItemsUseCase
    implements UseCase<void, Stream<List<NormalProductDto>>> {
  @override
  Stream<List<NormalProductDto>> execute([void request]);
}
