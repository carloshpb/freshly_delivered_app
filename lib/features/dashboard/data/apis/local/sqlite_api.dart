import 'dart:async';

abstract class SQLiteApi {
  Future<List<Map<String, Object?>>> findAllWithLimit(
    String table,
    int expirationLimit, {
    int limit = -1,
    int offset = 0,
  });
  Future<List<Map<String, Object?>>> findAll(
    String table,
    int expirationLimit,
  );
  Future<Map<String, Object?>> findById(
    String table,
    String id,
    int expirationLimit,
  );
  Future<List<Map<String, Object?>>> findByAttributeDesc(
    String table,
    dynamic attribute,
    String attributeName,
    String orderBy,
    int expirationLimit, {
    int limit = -1,
    int offset = 0,
    bool descending = false,
  });
  Future<void> save(String table, dynamic entity);
  // StreamController<Map<String, Object?>> fetchByAttribute(
  //   String table,
  //   dynamic attribute,
  //   String attributeName,
  // );
  Future<void> insertOrReplace(String table, dynamic entity);
  Future<void> update(
    String table,
    List<({String attributeName, dynamic value})> setAttributes,
    ({String attributeName, dynamic equalValue}) whereSingleCondition,
  );
  Future<void> clearDatabase();
  Future<List<Map<String, Object?>>> customQuery(
    String query,
    int expirationLimit,
  );
  Future<int> deleteById(String table, String id);
}
