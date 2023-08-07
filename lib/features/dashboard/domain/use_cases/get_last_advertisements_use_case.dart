import 'dart:async';

import '../../../use_case.dart';
import '../../application/dtos/advertisement_dto.dart';

abstract class GetLastAdvertisementsUseCase
    implements UseCase<void, List<AdvertisementDto>> {
  @override
  FutureOr<List<AdvertisementDto>> execute([void request]);
}
