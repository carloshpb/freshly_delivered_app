import '../../../use_case.dart';
import '../../application/dtos/advertisement_dto.dart';

abstract class GetLastAdvertisementsUseCase
    implements UseCase<void, List<AdvertisementDto>> {
  @override
  List<AdvertisementDto> execute([void request]);
}
