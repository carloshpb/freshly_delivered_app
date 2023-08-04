abstract class FirestoreApi {
  Future<List<dynamic>> findAllWithLimit(String collection, int limit);
  Future<List<dynamic>> findAll(String collection);
  Future<dynamic> findById(String collection, String id);
  Future<void> addProducts(
      String collection, List<Map<String, dynamic>> products);
}
