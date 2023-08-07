import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  Future<List<AdvertisementDto>> execute([void request]) async {
    var advertisements =
        await _localAdvertisementsRepository.findAdvertisementsWithLimit(10);

    if (advertisements.isEmpty) {
      advertisements =
          await _remoteAdvertisementsRepository.findAdvertisementsWithLimit(10);

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
