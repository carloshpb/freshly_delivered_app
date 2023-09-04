import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/dtos/advertisement_dto.dart';
import '../../../application/use_cases/get_last_advertisements_use_case_impl.dart';

final homeAdvertisementsControllerProvider =
    AsyncNotifierProvider<HomeAdvertisementsController, List<AdvertisementDto>>(
  () => HomeAdvertisementsController(),
  name: r'homeAdvertisementsControllerProvider',
);

class HomeAdvertisementsController
    extends AsyncNotifier<List<AdvertisementDto>> {
  @override
  FutureOr<List<AdvertisementDto>> build() async {
    var advertisements = await ref
        .watch(getLastAdvertisementsUseCaseProvider)
        .execute((object: null, position: 0));

    return advertisements;
  }

  Future<void> updateAdvertisements() async {
    var currentAdvertisements = state.value;

    state = const AsyncValue.loading();

    var lastAdv =
        (currentAdvertisements == null || currentAdvertisements.isEmpty)
            ? (object: null, position: 0)
            : (
                object: currentAdvertisements[currentAdvertisements.length - 1],
                position: currentAdvertisements.length - 1,
              );

    var newAdvertisements =
        await ref.watch(getLastAdvertisementsUseCaseProvider).execute(lastAdv);

    state = AsyncValue.data([...?currentAdvertisements, ...newAdvertisements]);
  }
}
