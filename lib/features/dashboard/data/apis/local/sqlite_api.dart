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
  Future<int> save(String table, dynamic entity, List<String> columns);
}
