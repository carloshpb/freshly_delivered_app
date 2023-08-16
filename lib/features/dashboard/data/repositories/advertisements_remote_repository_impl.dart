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
  FutureOr<List<Advertisement>> findAdvertisementsWithLimit(
      int limit,
      ({
        Advertisement? advertisementObject,
        int position
      }) lastAdvertisement) async {
    var resultListMap = await _firestoreApi.findAllWithLimit(
      "advertisements",
      limit,
      lastAdvertisement.advertisementObject,
    );
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
  FutureOr<List<Advertisement>> findSpecialAdvertisements(
      int limit,
      ({
        Advertisement? advertisementObject,
        int position
      }) lastAdvertisement) async {
    var resultListMap = await _firestoreApi.findByAttributeDesc(
      "advertisements",
      true,
      "is_special",
      limit,
      lastAdvertisement.advertisementObject,
    );
    return resultListMap
        .map(
          (advMap) => Advertisement.fromJson(advMap),
        )
        .toList();
  }

  @override
  Stream<List<Advertisement>> fetchLastAdvertisements() async* {
    var resultListMap = _firestoreApi.fetchByAttributeDesc(
      "advertisements",
      null,
      "",
      "created_at",
    );

    yield* resultListMap.map<List<Advertisement>>(
      (listMapJson) => listMapJson
          .map(
            (mapJson) => Advertisement.fromJson(mapJson),
          )
          .toList(),
    );

    // await for (final listMap in resultListMap) {
    //   var mapList = <Map<String, Object?>>[];
    //   for (var docSnapshot in query.docs) {
    //     var map = docSnapshot.data();
    //     map["id"] = docSnapshot.id;
    //     mapList.add(map);
    //   }
    //   yield mapList;
    // }
  }
}
