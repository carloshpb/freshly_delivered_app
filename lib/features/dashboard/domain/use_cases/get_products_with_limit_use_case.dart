import '../../../use_case.dart';
import '../../application/dtos/product_dto.dart';

abstract class GetProductsWithLimitUseCase
    implements UseCase<int, List<ProductDto>> {
  @override
  List<ProductDto> execute(int request);
}
