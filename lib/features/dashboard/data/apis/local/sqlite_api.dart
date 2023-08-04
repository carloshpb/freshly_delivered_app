abstract class SQLiteApi {
  Future<List<dynamic>> findAllWithLimit(int limit);
  Future<List<dynamic>> findAll();
  Future<dynamic> findById(int id);
}
