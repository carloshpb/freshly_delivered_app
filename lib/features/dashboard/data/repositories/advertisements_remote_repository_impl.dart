import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshly_delivered_app/features/dashboard/domain/models/advertisement.dart';
import 'package:rxdart/rxdart.dart';

import '../../domain/repositories/advertisements_repository.dart';
import '../apis/remote/firestore_api.dart';
import '../apis/remote/impl/firestore_api_impl.dart';

final advertisementsRemoteRepositoryProvider =
    Provider<AdvertisementsRepository>(
  (ref) {
    final subject = BehaviorSubject<List<Map<String, Object?>>>();

    final transformer = StreamTransformer<List<Map<String, Object?>>,
        List<Advertisement>>.fromHandlers(
      handleData: (data, sink) async {
        var modelAdvList =
            data.map((advMap) => Advertisement.fromJson(advMap)).toList();
        sink.add(modelAdvList);
      },
    );

    return AdvertisementsRemoteRepositoryImpl(
      ref.watch(firestoreApiProvider),
      subject,
      transformer,
    );
  },
);

class AdvertisementsRemoteRepositoryImpl implements AdvertisementsRepository {
  final FirestoreApi _firestoreApi;
  final BehaviorSubject<List<Map<String, Object?>>> _advertisementStream;
  final StreamTransformer<List<Map<String, Object?>>, List<Advertisement>>
      _streamAdvertisementTransformer;

  AdvertisementsRemoteRepositoryImpl(
    FirestoreApi firestoreApi,
    BehaviorSubject<List<Map<String, Object?>>> advertisementStream,
    StreamTransformer<List<Map<String, Object?>>, List<Advertisement>>
        streamAdvertisementTransformer,
  )   : _firestoreApi = firestoreApi,
        _advertisementStream = advertisementStream,
        _streamAdvertisementTransformer = streamAdvertisementTransformer;

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
    await _firestoreApi.set("advertisements", mapAdvertisements);
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
  void fetchLastAdvertisements() {
    try {
      _firestoreApi.fetchListByAttributeDesc(
        "advertisements",
        null,
        "",
        "created_at",
        _advertisementStream,
      );
    } on Exception {
      // TODO : Handle errors
      return;
    }

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

  @override
  Stream<List<Advertisement>> get advertisementsStream =>
      _advertisementStream.transform(_streamAdvertisementTransformer);
}
