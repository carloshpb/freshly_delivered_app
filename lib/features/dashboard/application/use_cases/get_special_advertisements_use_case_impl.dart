import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshly_delivered_app/features/dashboard/application/dtos/advertisement_dto.dart';
import 'package:logger/logger.dart';

import '../../../../exceptions/app_firestore_exception.dart';
import '../../../../exceptions/app_sqlite_exception.dart';
import '../../data/repositories/advertisements_local_repository_impl.dart';
import '../../data/repositories/advertisements_remote_repository_impl.dart';
import '../../domain/models/advertisement.dart';
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
    List<Advertisement> advertisements;

    try {
      advertisements =
          await _localAdvertisementsRepository.findSpecialAdvertisements(
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
          await _remoteAdvertisementsRepository.findSpecialAdvertisements(
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
