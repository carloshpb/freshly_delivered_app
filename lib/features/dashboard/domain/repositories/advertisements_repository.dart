import 'dart:async';

import '../models/advertisement.dart';

abstract class AdvertisementsRepository {
  FutureOr<Advertisement> findAdvertisementById(String id);
  FutureOr<List<Advertisement>> findAdvertisementsWithLimit(int limit);
  FutureOr<List<Advertisement>> findAllAdvertisements();
  FutureOr<List<Advertisement>> findSpecialAdvertisements();
  Future<void> saveAdvertisements(List<Advertisement> advertisements);
}
