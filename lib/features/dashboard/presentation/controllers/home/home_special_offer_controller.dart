import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/dtos/advertisement_dto.dart';
import '../../../application/use_cases/get_special_advertisements_use_case_impl.dart';

final homeSpecialOfferControllerProvider =
    AsyncNotifierProvider<HomeSpecialOfferController, List<AdvertisementDto>>(
  () => HomeSpecialOfferController(),
  name: r'homeSpecialOfferControllerProvider',
);

class HomeSpecialOfferController extends AsyncNotifier<List<AdvertisementDto>> {
  @override
  FutureOr<List<AdvertisementDto>> build() async {
    var specialAdvertisement = await ref
        .watch(findSpecialAdvertisementsUseCaseProvider)
        .execute((object: null, position: 0));

    return specialAdvertisement;
  }
}
