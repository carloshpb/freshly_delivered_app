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
        .watch(getSpecialAdvertisementsUseCaseProvider)
        .execute((object: null, position: 0));

    return specialAdvertisement;
  }

  Future<void> updateSpecialOffer([bool isRefreshing = true]) async {
    var currentAdvertisements = state.value;
    var lastAdvertisement = (
      object: currentAdvertisements?[currentAdvertisements.length - 1],
      position: (currentAdvertisements?.length == null)
          ? 0
          : currentAdvertisements!.length - 1
    );
    state = const AsyncValue.loading();
    try {
      var specialAdvertisement = await ref
          .watch(getSpecialAdvertisementsUseCaseProvider)
          .execute(lastAdvertisement);
      currentAdvertisements = (currentAdvertisements == null)
          ? specialAdvertisement
          : currentAdvertisements
        ..addAll(specialAdvertisement);
      state = AsyncValue.data(currentAdvertisements);
    } on Exception {
      // TODO : Get to know the exceptions thrown by getSpecialAdvertisementsUseCaseProvider
    }
  }
}
