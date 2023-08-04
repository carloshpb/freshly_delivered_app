import 'dart:async';

import 'package:freshly_delivered_app/features/dashboard/domain/models/advertisement.dart';

import '../../domain/repositories/advertisements_repository.dart';

class AdvertisementsRepositoryImpl implements AdvertisementsRepository {
  @override
  FutureOr<List<Advertisement>> getLastAdvertisements() {
    // TODO: implement getLastAdvertisements
    throw UnimplementedError();
  }
}
