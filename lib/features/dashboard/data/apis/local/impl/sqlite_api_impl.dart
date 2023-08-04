import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../sqlite_api.dart';

final sqliteApiProvider = Provider<SQLiteApi>(
  (_) => SQLiteApiImpl(),
);

class SQLiteApiImpl implements SQLiteApi {
  @override
  Future<List> findAll() {
    // TODO: implement findAll
    throw UnimplementedError();
  }

  @override
  Future<List> findAllWithLimit(int limit) {
    // TODO: implement findAllWithLimit
    throw UnimplementedError();
  }

  @override
  Future findById(int id) {
    // TODO: implement findById
    throw UnimplementedError();
  }
}
