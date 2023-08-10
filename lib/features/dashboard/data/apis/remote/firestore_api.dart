abstract class FirestoreApi {
  Future<List<dynamic>> findAllWithLimit(
    String collection,
    int limit,
    Object? lastObject,
  );
  Future<List<dynamic>> findAll(String collection);
  Future<dynamic> findById(String collection, String id);
  Future<List<Map<String, Object?>>> findByAttributeDesc(
    String collection,
    dynamic attribute,
    String attributeName,
    int limit,
    Object? lastObject,
  );
  Future<void> save(String collection, dynamic entity);
}
