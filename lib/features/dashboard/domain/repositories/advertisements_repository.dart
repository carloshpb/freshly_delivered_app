import 'dart:async';

import '../models/advertisement.dart';

abstract class AdvertisementsRepository {
  FutureOr<Advertisement> findAdvertisementById(String id);
  FutureOr<List<NormalAdvertisement>> findAdvertisementsWithLimit(
      int limit,
      ({
        NormalAdvertisement? advertisementObject,
        int position
      }) lastAdvertisement);
  FutureOr<List<NormalAdvertisement>> findAllAdvertisements();
  FutureOr<List<NormalAdvertisement>> findSpecialAdvertisements(
      int limit,
      ({
        NormalAdvertisement? advertisementObject,
        int position
      }) lastAdvertisement);
  Future<void> saveAdvertisements(List<NormalAdvertisement> advertisements);
  void fetchLastAdvertisements();
  Stream<List<NormalAdvertisement>> get advertisementsStream;
}
