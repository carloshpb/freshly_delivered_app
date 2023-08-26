import 'package:rxdart/rxdart.dart';

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
  Future<void> set(String collection, dynamic entity);
  Future<void> setSubcollection(
    String parentCollection,
    String parentId,
    String childCollection,
    dynamic entity,
  );
  // Future<void> update(
  //     String collection, String docId, Map<String, Object> entity);
  Future<void> remove(String collection, String docId);
  Future<void> removeFromSubcollection(
    String parentCollection,
    String parentId,
    String childCollection,
    dynamic entity,
  );
  void fetchByAttributeDesc(
    String collection,
    dynamic attribute,
    String attributeName,
    String descAttributeName,
    BehaviorSubject<Map<String, Object?>> streamSubject,
  );
  void fetchSubCollection(
    String parentCollection,
    String parentId,
    String childCollection,
    BehaviorSubject<Map<String, Object?>> streamSubject,
  );
}
