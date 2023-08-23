import 'dart:async';

abstract class SQLiteApi {
  Future<List<Map<String, Object?>>> findAllWithLimit(
    String table,
    int limit,
    int offset,
  );
  Future<List<Map<String, Object?>>> findAll(String table);
  Future<Map<String, Object?>> findById(String table, String id);
  Future<List<Map<String, Object?>>> findByAttributeDesc(
    String table,
    dynamic attribute,
    String attributeName,
    int limit,
    int offset,
  );
  Future<Map<String, Object?>> findByIdWithJoinId(
    String table,
    String id,
    String innerChildId,
  );
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
}
