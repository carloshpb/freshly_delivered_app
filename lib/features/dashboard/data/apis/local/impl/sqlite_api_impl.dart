import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';

import '../sqlite_api.dart';

final sqliteApiProvider = Provider<SQLiteApi>(
  (_) {
    // Always override in main to dispose the DB
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
      SELECT * FROM ?
      WHERE id = ?
      ''',
      [table, id],
    );

    return result[0];
  }

  /// May throw TypeError
  @override
  Future<int> save(String table, dynamic entity, List<String> columns) async {
    var entityToString = (entity is List)
        ? entity.map(
            (map) {
              "(${(map as Map<String, Object?>).entries.join(",")})";
            },
          ).join(",")
        : "(${(entity as Map<String, Object?>).entries.join(",")})";

    var result = await _database.rawInsert(
      '''
      INSERT INTO $table(${columns.join(", ")})
      VALUES $entityToString
      ''',
    );

    return result;
  }

  @override
  Future<List<Map<String, Object?>>> findByAttributeDesc(
    String table,
    attribute,
    String attributeName,
    int limit,
  ) {
    return _database.rawQuery(
      '''
      SELECT * FROM ?
      WHERE ? = ?
      ORDER BY modified_at DESC
      LIMIT ?
      ''',
      [table, attributeName, attribute, limit],
    );
  }
}
