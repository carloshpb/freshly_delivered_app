import 'dart:async';

import '../../../use_case.dart';
import '../../application/dtos/advertisement_dto.dart';

abstract class GetSpecialAdvertisementsUseCase
    implements
        UseCase<({AdvertisementDto? object, int position}),
            List<AdvertisementDto>> {
  @override
  FutureOr<List<AdvertisementDto>> execute(
      ({AdvertisementDto? object, int position}) request);
}
