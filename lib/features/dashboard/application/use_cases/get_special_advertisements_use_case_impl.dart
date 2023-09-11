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
      lastAdvertisement: (
        advertisementObject:
            (request.object != null) ? request.object!.toDomain() : null,
        position: request.position,
      ),
    );

    if (advertisements.isEmpty) {
      advertisements =
          await _remoteAdvertisementsRepository.findSpecialAdvertisements(
        lastAdvertisement: (
          advertisementObject:
              (request.object != null) ? request.object!.toDomain() : null,
          position: request.position,
        ),
      );
      if (advertisements.isNotEmpty) {
        _localAdvertisementsRepository
            .insertOrReplaceAdvertisements(advertisements);
        return advertisements
            .map((adv) => AdvertisementDto.fromDomain(adv))
            .toList();
      }
    }

    return [];
  }
}
