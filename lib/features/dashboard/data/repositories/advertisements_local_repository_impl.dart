import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshly_delivered_app/features/dashboard/domain/models/advertisement.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../constants/strings.dart';
import '../../domain/repositories/advertisements_repository.dart';
import '../apis/local/impl/sqlite_api_impl.dart';
import '../apis/local/sqlite_api.dart';

final advertisementsLocalRepositoryProvider =
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

    return AdvertisementsLocalRepositoryImpl(
      ref.watch(sqliteApiProvider),
      subject,
      transformer,
    );
  },
);

class AdvertisementsLocalRepositoryImpl implements AdvertisementsRepository {
  final SQLiteApi _sqliteApi;
  final BehaviorSubject<List<Map<String, Object?>>> _advertisementStream;
  final StreamTransformer<List<Map<String, Object?>>, List<Advertisement>>
      _streamAdvertisementTransformer;

  AdvertisementsLocalRepositoryImpl(
    SQLiteApi sqliteApi,
    BehaviorSubject<List<Map<String, Object?>>> advertisementStream,
    StreamTransformer<List<Map<String, Object?>>, List<Advertisement>>
        streamAdvertisementTransformer,
  )   : _sqliteApi = sqliteApi,
        _advertisementStream = advertisementStream,
        _streamAdvertisementTransformer = streamAdvertisementTransformer;

  @override
  FutureOr<Advertisement> findAdvertisementById(String id) async {
    var resultMap =
        await _sqliteApi.findById(Strings.advertisementsLocalTable, id, 5);
    return Advertisement.fromJson(resultMap);
  }

  @override
  FutureOr<List<Advertisement>> findAdvertisementsWithLimit({
    required ({
      Advertisement? advertisementObject,
      int position,
    }) lastAdvertisement,
    int expirationLimitMinutes = 5,
  }) async {
    var resultListMap = await _sqliteApi.findAllWithLimit(
      Strings.advertisementsLocalTable,
      expirationLimitMinutes,
      limit: 5,
      offset: lastAdvertisement.position,
    );
    return resultListMap
        .map(
          (advMap) => Advertisement.fromJson(advMap),
        )
        .toList();
  }

  @override
  FutureOr<List<Advertisement>> findAllAdvertisements() async {
    var resultListMap =
        await _sqliteApi.findAll(Strings.advertisementsLocalTable, 5);
    return resultListMap
        .map(
          (prodMap) => Advertisement.fromJson(prodMap),
        )
        .toList();
  }

  @override
  Future<void> saveAdvertisements(List<Advertisement> advertisements) async {
    var mapAdvertisements =
        advertisements.map((prod) => prod.toJson()).toList();
    await _sqliteApi.save(Strings.advertisementsLocalTable, mapAdvertisements);
  }

  @override
  FutureOr<List<Advertisement>> findSpecialAdvertisements({
    required ({
      Advertisement? advertisementObject,
      int position,
    }) lastAdvertisement,
    int expirationLimitMinutes = 5,
  }) async {
    var resultListMap = await _sqliteApi.findByAttributeDesc(
      Strings.advertisementsLocalTable,
      true,
      "is_special",
      "created_at",
      expirationLimitMinutes,
      limit: 5,
      offset: lastAdvertisement.position,
      descending: true,
    );
    return resultListMap
        .map(
          (advMap) => Advertisement.fromJson(advMap),
        )
        .toList();
  }

  // TODO : Handle to send better errors if any problem in sqlite
  @override
  void fetchLastAdvertisements() {
    _sqliteApi
        .findByAttributeDesc(
          Strings.advertisementsLocalTable,
          null,
          "",
          "created_at",
          0,
          limit: 5,
          descending: true,
        )
        .then((result) => _advertisementStream.add(result));
  }

  @override
  Stream<List<Advertisement>> get advertisementsStream =>
      _advertisementStream.transform(_streamAdvertisementTransformer);

  @override
  Future<void> insertOrReplaceAdvertisements(
      List<Advertisement> advertisements) {
    var mapAdvertisements = advertisements.map((adv) => adv.toJson());
    return _sqliteApi.insertOrReplace(
        Strings.advertisementsLocalTable, mapAdvertisements);
  }
}
