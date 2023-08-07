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
  final SQLiteApi _sqliteApi;

  AdvertisementsLocalRepositoryImpl(SQLiteApi sqliteApi)
      : _sqliteApi = sqliteApi;

  @override
  FutureOr<List<Advertisement>> getLastAdvertisements() async {
    var resultListMap = await _sqliteApi.findAllWithLimit("advertisements", 10);
    return resultListMap
        .map(
          (advMap) => Advertisement.fromJson(advMap),
        )
        .toList();
  }
}
