import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../exceptions/app_firestore_exception.dart';
import '../../application/dtos/advertisement_dto.dart';
import '../../data/repositories/advertisements_local_repository_impl.dart';
import '../../data/repositories/advertisements_remote_repository_impl.dart';
import '../../domain/repositories/advertisements_repository.dart';
import '../../domain/use_cases/get_last_advertisements_use_case.dart';

final getLastAdvertisementsUseCaseProvider =
    Provider<GetLastAdvertisementsUseCase>(
  (ref) => GetLastAdvertisementsUseCaseImpl(
    ref.watch(advertisementsLocalRepositoryProvider),
    ref.watch(advertisementsRemoteRepositoryProvider),
  ),
);

class GetLastAdvertisementsUseCaseImpl implements GetLastAdvertisementsUseCase {
  final AdvertisementsRepository _localAdvertisementsRepository;
  final AdvertisementsRepository _remoteAdvertisementsRepository;

  GetLastAdvertisementsUseCaseImpl(
    AdvertisementsRepository localAdvertisementsRepository,
    AdvertisementsRepository remoteAdvertisementsRepository,
  )   : _localAdvertisementsRepository = localAdvertisementsRepository,
        _remoteAdvertisementsRepository = remoteAdvertisementsRepository;

  @override
  Future<List<AdvertisementDto>> execute(
      ({AdvertisementDto? object, int position}) request) async {
    var advertisements =
        await _localAdvertisementsRepository.findAdvertisementsWithLimit(
      lastAdvertisement: (
        advertisementObject:
            (request.object != null) ? request.object!.toDomain() : null,
        position: request.position,
      ),
    );

    if (advertisements.isEmpty) {
      advertisements =
          await _remoteAdvertisementsRepository.findAdvertisementsWithLimit(
        lastAdvertisement: (
          advertisementObject:
              (request.object != null) ? request.object!.toDomain() : null,
          position: request.position,
        ),
      );

      if (advertisements.isNotEmpty) {
        // TODO : Treat when couldnt be saved locally
        _localAdvertisementsRepository.saveAdvertisements(advertisements);
      }
    } else {
      // handling expired data
      var newAdvtersiments = <AdvertisementDto>[];

      for (var i = 0; i < advertisements.length; i++) {
        if (advertisements[i].id.endsWith("expired")) {
          try {
            var updatedAdv =
                await _remoteAdvertisementsRepository.findAdvertisementById(
                    advertisements[i].id.replaceFirst(RegExp(r'expired'), ""));
            newAdvtersiments.add(AdvertisementDto.fromDomain(updatedAdv));
          } on NotFoundException {
            continue;
          }
        }
        newAdvtersiments.add(AdvertisementDto.fromDomain(advertisements[i]));
      }

      return newAdvtersiments;
    }

    return (advertisements.isNotEmpty)
        ? advertisements.map((adv) => AdvertisementDto.fromDomain(adv)).toList()
        : [];
  }
}
