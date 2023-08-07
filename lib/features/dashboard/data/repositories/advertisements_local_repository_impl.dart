import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshly_delivered_app/features/dashboard/domain/models/advertisement.dart';

import '../../domain/repositories/advertisements_repository.dart';
import '../apis/local/impl/sqlite_api_impl.dart';
import '../apis/local/sqlite_api.dart';

final advertisementsLocalRepositoryProvider =
    Provider<AdvertisementsRepository>(
  (ref) => AdvertisementsLocalRepositoryImpl(ref.watch(sqliteApiProvider)),
);

class AdvertisementsLocalRepositoryImpl implements AdvertisementsRepository {
  final _advertisementStringProperties = [
    'id',
    'description',
    'imagePath',
    'createdAt',
    'modifiedAt',
  ];

  final SQLiteApi _sqliteApi;

  AdvertisementsLocalRepositoryImpl(SQLiteApi sqliteApi)
      : _sqliteApi = sqliteApi;

  @override
  FutureOr<Advertisement> findAdvertisementById(String id) async {
    var resultMap = await _sqliteApi.findById("advertisements", id);
    return (resultMap.isEmpty)
        ? Advertisement(
            createdAt: DateTime.parse('0000-00-00'),
            modifiedAt: DateTime.parse('0000-00-00'),
          )
        : Advertisement.fromJson(resultMap);
  }

  @override
  FutureOr<List<Advertisement>> findAdvertisementsWithLimit(int limit) async {
    var resultListMap =
        await _sqliteApi.findAllWithLimit("advertisements", limit);
    return resultListMap
        .map(
          (advMap) => Advertisement.fromJson(advMap),
        )
        .toList();
  }

  @override
  FutureOr<List<Advertisement>> findAllAdvertisements() async {
    var resultListMap = await _sqliteApi.findAll("advertisements");
    return resultListMap
        .map(
          (prodMap) => Advertisement.fromJson(prodMap),
        )
        .toList();
  }

  @override
  Future<void> saveAdvertisements(List<Advertisement> advertisements) async {
    var mapAdvertisements = advertisements.map((prod) => prod.toJson());
    await _sqliteApi.save(
      "advertisements",
      mapAdvertisements,
      _advertisementStringProperties,
    );
  }

  @override
  FutureOr<List<Advertisement>> findSpecialAdvertisements() async {
    var resultListMap = await _sqliteApi.findByAttributeDesc(
      "advertisements",
      true,
      "isSpecial",
      10,
    );
    return resultListMap
        .map(
          (advMap) => Advertisement.fromJson(advMap),
        )
        .toList();
  }
}
