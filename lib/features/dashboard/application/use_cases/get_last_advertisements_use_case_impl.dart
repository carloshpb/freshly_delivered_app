import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

import '../../../../exceptions/app_firestore_exception.dart';
import '../../../../exceptions/app_sqlite_exception.dart';
import '../../application/dtos/advertisement_dto.dart';
import '../../data/repositories/advertisements_local_repository_impl.dart';
import '../../data/repositories/advertisements_remote_repository_impl.dart';
import '../../domain/models/advertisement.dart';
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
    List<Advertisement> advertisements;

    try {
      advertisements =
          await _localAdvertisementsRepository.findAdvertisementsWithLimit(
        lastAdvertisement: (
          advertisementObject: request.object?.toDomain(),
          position: request.position,
        ),
      );

      for (var i = 0; i < advertisements.length; i++) {
        if (advertisements[i].id.endsWith("expired")) {
          try {
            var updatedAdv =
                await _remoteAdvertisementsRepository.findAdvertisementById(
                    advertisements[i].id.replaceFirst(RegExp(r'expired'), ""));

            advertisements[i] = updatedAdv;
          } on NotFoundException {
            advertisements.removeAt(i);
            continue;
          }
        }
      }
    } on DataNotFoundInDbException {
      advertisements =
          await _remoteAdvertisementsRepository.findAdvertisementsWithLimit(
        lastAdvertisement: (
          advertisementObject: request.object?.toDomain(),
          position: request.position,
        ),
      );

      if (advertisements.isNotEmpty) {
        try {
          _localAdvertisementsRepository.saveAdvertisements(advertisements);
        } on DataNotInsertedInDbException catch (e) {
          Logger().e(e.message);
        }
      }
    }

    return (advertisements.isNotEmpty)
        ? advertisements.map((adv) => AdvertisementDto.fromDomain(adv)).toList()
        : [];
  }
}
