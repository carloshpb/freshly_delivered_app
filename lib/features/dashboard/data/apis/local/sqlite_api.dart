abstract class SQLiteApi {
  Future<List<Map<String, Object?>>> findAllWithLimit(String table, int limit);
  Future<List<Map<String, Object?>>> findAll(String table);
  Future<Map<String, Object?>> findById(String table, String id);
  Future<int> save(String table, dynamic entity, List<String> columns);
}
