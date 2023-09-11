import 'dart:async';

import '../models/advertisement.dart';

abstract class AdvertisementsRepository {
  FutureOr<Advertisement> findAdvertisementById(String id);
  FutureOr<List<Advertisement>> findAdvertisementsWithLimit({
    required ({
      Advertisement? advertisementObject,
      int position,
    }) lastAdvertisement,
    int expirationLimitMinutes = 10,
  });
  FutureOr<List<Advertisement>> findAllAdvertisements();
  FutureOr<List<Advertisement>> findSpecialAdvertisements({
    required ({
      Advertisement? advertisementObject,
      int position,
    }) lastAdvertisement,
    int expirationLimitMinutes = 10,
  });
  Future<void> saveAdvertisements(List<Advertisement> advertisements);
  Future<void> insertOrReplaceAdvertisements(
      List<Advertisement> advertisements);
  void fetchLastAdvertisements();
  Stream<List<Advertisement>> get advertisementsStream;
}
