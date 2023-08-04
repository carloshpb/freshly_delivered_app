import 'dart:async';

import '../models/advertisement.dart';

abstract class AdvertisementsRepository {
  FutureOr<List<Advertisement>> getLastAdvertisements();
}
