import '../../../use_case.dart';
import '../../application/dtos/product_dto.dart';

abstract class GetProductByIdUseCase implements UseCase<int, ProductDto> {
  @override
  ProductDto execute(int request);
}
