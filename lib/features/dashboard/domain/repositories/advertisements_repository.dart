import 'dart:async';

import '../models/advertisement.dart';

abstract class AdvertisementsRepository {
  FutureOr<Advertisement> findAdvertisementById(String id);
  FutureOr<List<Advertisement>> findAdvertisementsWithLimit(int limit,
      ({Advertisement? advertisementObject, int position}) lastAdvertisement);
  FutureOr<List<Advertisement>> findAllAdvertisements();
  FutureOr<List<Advertisement>> findSpecialAdvertisements(int limit,
      ({Advertisement? advertisementObject, int position}) lastAdvertisement);
  Future<void> saveAdvertisements(List<Advertisement> advertisements);
  Future<void> insertOrReplaceAdvertisements(
      List<Advertisement> advertisements);
  void fetchLastAdvertisements();
  Stream<List<Advertisement>> get advertisementsStream;
}
