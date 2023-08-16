import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshly_delivered_app/features/dashboard/application/dtos/advertisement_dto.dart';

import '../../data/repositories/advertisements_local_repository_impl.dart';
import '../../data/repositories/advertisements_remote_repository_impl.dart';
import '../../domain/repositories/advertisements_repository.dart';
import '../../domain/use_cases/get_special_advertisements_use_case.dart';

final getSpecialAdvertisementsUseCaseProvider =
    Provider<GetSpecialAdvertisementsUseCase>(
  (ref) => GetSpecialAdvertisementsUseCaseImpl(
    ref.watch(advertisementsLocalRepositoryProvider),
    ref.watch(advertisementsRemoteRepositoryProvider),
  ),
);

class GetSpecialAdvertisementsUseCaseImpl
    implements GetSpecialAdvertisementsUseCase {
  final AdvertisementsRepository _localAdvertisementsRepository;
  final AdvertisementsRepository _remoteAdvertisementsRepository;

  GetSpecialAdvertisementsUseCaseImpl(
    AdvertisementsRepository localAdvertisementsRepository,
    AdvertisementsRepository remoteAdvertisementsRepository,
  )   : _localAdvertisementsRepository = localAdvertisementsRepository,
        _remoteAdvertisementsRepository = remoteAdvertisementsRepository;

  @override
  FutureOr<List<AdvertisementDto>> execute(
      ({AdvertisementDto? object, int position}) request) async {
    var advertisements =
        await _localAdvertisementsRepository.findSpecialAdvertisements(
      10,
      (
        advertisementObject:
            (request.object != null) ? request.object!.toModel() : null,
        position: request.position,
      ),
    );

    if (advertisements.isEmpty) {
      advertisements =
          await _remoteAdvertisementsRepository.findSpecialAdvertisements(
        10,
        (
          advertisementObject:
              (request.object != null) ? request.object!.toModel() : null,
          position: request.position,
        ),
      );
      if (advertisements.isNotEmpty) {
        // TODO : Treat when couldnt be saved locally
        _localAdvertisementsRepository.saveAdvertisements(advertisements);
      }
    }

    return (advertisements.isNotEmpty)
        ? advertisements.map((adv) => adv.toDto()).toList()
        : [];
  }
}
