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
  FutureOr<Advertisement> findAdvertisementById(String id) async {
    var resultListMap = await _firestoreApi.findById("advertisements", id);
    return Advertisement.fromJson(resultListMap);
  }

  @override
  FutureOr<List<Advertisement>> findAdvertisementsWithLimit(int limit) async {
    var resultListMap =
        await _firestoreApi.findAllWithLimit("advertisements", limit);
    return resultListMap
        .map(
          (advMap) => Advertisement.fromJson(advMap),
        )
        .toList();
  }

  @override
  FutureOr<List<Advertisement>> findAllAdvertisements() async {
    var resultListMap = await _firestoreApi.findAll("advertisements");
    return resultListMap
        .map(
          (prodMap) => Advertisement.fromJson(prodMap),
        )
        .toList();
  }

  @override
  Future<void> saveAdvertisements(List<Advertisement> advertisements) async {
    var mapAdvertisements = advertisements.map((prod) => prod.toJson());
    await _firestoreApi.save("advertisements", mapAdvertisements);
  }

  @override
  FutureOr<List<Advertisement>> findSpecialAdvertisements() async {
    var resultListMap = await _firestoreApi.findByAttributeDesc(
      "advertisements",
      true,
      "is_special",
      10,
    );
    return resultListMap
        .map(
          (advMap) => Advertisement.fromJson(advMap),
        )
        .toList();
  }
}
