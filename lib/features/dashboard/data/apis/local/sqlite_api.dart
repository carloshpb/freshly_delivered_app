import 'dart:async';

abstract class SQLiteApi {
  Future<List<Map<String, Object?>>> findAllWithLimit(
    String table,
    int limit,
    int offset,
    int expirationLimit,
  );
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
    int limit,
    String orderBy,
    int offset,
    int expirationLimit, {
    bool descending = false,
  });
  Future<int> save(String table, dynamic entity, List<String> columns);
  // StreamController<Map<String, Object?>> fetchByAttribute(
  //   String table,
  //   dynamic attribute,
  //   String attributeName,
  // );
  Future<int> update(
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
