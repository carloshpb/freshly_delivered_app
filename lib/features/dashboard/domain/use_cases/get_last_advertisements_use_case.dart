import 'dart:async';

import '../../../use_case.dart';
import '../../application/dtos/advertisement_dto.dart';

abstract class GetLastAdvertisementsUseCase
    implements
        UseCase<({NormalAdvertisementDto? object, int position}),
            List<NormalAdvertisementDto>> {
  @override
  FutureOr<List<NormalAdvertisementDto>> execute(
      ({NormalAdvertisementDto? object, int position}) request);
}
