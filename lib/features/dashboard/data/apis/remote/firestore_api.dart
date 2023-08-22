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
  Future<void> add(String collection, dynamic entity);
  Future<void> set(String collection, String docId, dynamic entity);
  Future<void> setSubcollection(
    String parentCollection,
    String parentId,
    String childCollection,
    String childId,
    dynamic entity,
  );
  // Future<void> update(
  //     String collection, String docId, Map<String, Object> entity);
  Future<void> remove(String collection, String docId);
  Stream<List<Map<String, Object?>>> fetchByAttributeDesc(
    String collection,
    dynamic attribute,
    String attributeName,
    String descAttributeName,
  );
  Stream<List<Map<String, Object?>>> fetchSubCollection(
    String parentCollection,
    String parentId,
    String childCollection,
  );
}
