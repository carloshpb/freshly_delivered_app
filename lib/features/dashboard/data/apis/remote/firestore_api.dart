abstract class FirestoreApi {
  Future<List<dynamic>> findAllWithLimit(String collection, int limit);
  Future<List<dynamic>> findAll(String collection);
  Future<dynamic> findById(String collection, String id);
  Future<void> save(String collection, dynamic entity);
}
