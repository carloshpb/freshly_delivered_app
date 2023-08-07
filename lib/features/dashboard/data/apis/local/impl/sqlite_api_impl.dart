import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';

import '../sqlite_api.dart';

final sqliteApiProvider = FutureProvider<SQLiteApi>(
  (_) {
    // override main
    throw UnimplementedError();
  },
);

class SQLiteApiImpl implements SQLiteApi {
  final Database _database;

  SQLiteApiImpl(Database database) : _database = database;

  @override
  Future<List<Map<String, Object?>>> findAll(String table) {
    return _database.rawQuery(
      '''
      SELECT * FROM ?
      ''',
      [table],
    );
  }

  @override
  Future<List<Map<String, Object?>>> findAllWithLimit(String table, int limit) {
    return _database.rawQuery(
      '''
      SELECT * FROM ?
      ORDER BY modified_at DESC
      LIMIT ?
      OFFSET 0
      ''',
      [table, limit],
    );
  }

  @override
  Future<Map<String, Object?>> findById(String table, String id) async {
    var result = await _database.rawQuery(
      '''
      SELECT * FROM ? WHERE id = ?
      ''',
      [table, id],
    );

    return result[0];
  }
}
