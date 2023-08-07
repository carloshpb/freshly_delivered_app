import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshly_delivered_app/features/dashboard/domain/models/advertisement.dart';

import '../../domain/repositories/advertisements_repository.dart';
import '../apis/remote/firestore_api.dart';
import '../apis/remote/impl/firestore_api_impl.dart';

final advertisementsRemoteRepositoryProvider =
    Provider<AdvertisementsRepository>(
  (ref) => AdvertisementsRemoteRepositoryImpl(ref.watch(firestoreApiProvider)),
);

class AdvertisementsRemoteRepositoryImpl implements AdvertisementsRepository {
  final FirestoreApi _firestoreApi;

  AdvertisementsRemoteRepositoryImpl(FirestoreApi firestoreApi)
      : _firestoreApi = firestoreApi;

  @override
  FutureOr<List<Advertisement>> getLastAdvertisements() async {
    var resultListMap =
        await _firestoreApi.findAllWithLimit("advertisements", 10);
    return resultListMap
        .map(
          (advMap) => Advertisement.fromJson(advMap),
        )
        .toList();
  }
}
