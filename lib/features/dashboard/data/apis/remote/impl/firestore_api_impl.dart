import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../../constants/strings.dart';
import '../../../../../../exceptions/app_firestore_exception.dart';
import '../../../../../../exceptions/app_sqlite_exception.dart';
import '../firestore_api.dart';

final firestoreApiProvider = Provider<FirestoreApi>(
  (_) => FirestoreApiImpl(
    FirebaseFirestore.instance,
  ),
);

class FirestoreApiImpl implements FirestoreApi {
  final FirebaseFirestore _firestore;

  FirestoreApiImpl(FirebaseFirestore firestore) : _firestore = firestore;

  @override
  Future<List<dynamic>> findAll(String collection) async {
    var collectionRef = _firestore.collection(collection);
    // Unnecessary try/catch, but I use it just as a reminder ;)

    try {
      var productsJsonList = [];
      var querySnapshot = await collectionRef.get();
      // if (querySnapshot.docs.isEmpty) {
      //   throw DataNotFoundInDbException(
      //     '',
      //     collection,
      //     Strings.firestore,
      //   );
      // }
      for (var docSnapshot in querySnapshot.docs) {
        var map = docSnapshot.data();
        map["id"] = docSnapshot.id;
        productsJsonList.add(map);
      }
      return productsJsonList;
    } on FirebaseException catch (e) {
      throw AppFirestoreException.fromFirebaseException(e);
    }
  }

  @override
  Future<List<dynamic>> findAllWithLimit(
    String collection,
    int limit,
    Object? lastObject,
  ) async {
    var collectionRef = _firestore.collection(collection);
    try {
      var productsJsonList = [];
      var querySnapshot = await collectionRef
          .startAfter((lastObject == null) ? [] : [lastObject])
          .limit(limit)
          .get();
      // if (querySnapshot.docs.isEmpty) {
      //   throw NotFoundException("Data of ($collection) not found");
      // }
      for (var docSnapshot in querySnapshot.docs) {
        var map = docSnapshot.data();
        map["id"] = docSnapshot.id;
        productsJsonList.add(map);
      }
      return productsJsonList;
    } on FirebaseException catch (e) {
      throw AppFirestoreException.fromFirebaseException(e);
    }
  }

  @override
  Future<dynamic> findById(String collection, String id) async {
    var collectionRef = _firestore.collection(collection);
    try {
      var docSnapshot = await collectionRef.doc(id).get();
      var productMap = docSnapshot.data();
      if (productMap == null || productMap.isEmpty) {
        throw NotFoundException("Data of id $id not found");
      }
      productMap["id"] = docSnapshot.id;
      return productMap;
    } on FirebaseException catch (e) {
      throw AppFirestoreException.fromFirebaseException(e);
    }
  }

  @override
  Future<dynamic> add(String collection, dynamic entity) async {
    var collectionRef = _firestore.collection(collection);
    try {
      if (entity is List) {
        for (int index = 0; index < entity.length; index++) {
          var newDoc = {...entity[index] as Map<String, Object?>};
          newDoc["created_at"] = FieldValue.serverTimestamp();
          newDoc["modified_at"] = newDoc["created_at"];
          var docRef = await collectionRef.add(newDoc);
          newDoc["id"] = docRef.id;
          entity[index] = newDoc;
        }
        return entity;
      } else {
        var newDoc = {...entity as Map<String, Object?>};
        newDoc["created_at"] = FieldValue.serverTimestamp();
        newDoc["modified_at"] = newDoc["created_at"];
        var docRef = await collectionRef.add(newDoc);
        newDoc["id"] = docRef.id;
        return newDoc;
      }
    } on FirebaseException catch (e) {
      throw AppFirestoreException.fromFirebaseException(e);
    }
  }

  // TEMP - run only once then remove it
  @override
  Future<void> addMockDataToFirestore() async {
    // TODO - run this one then delete it, just to fill Firestore with the foods.json
    var fakeFoodsJson =
        await rootBundle.loadString("assets/fakeData/foods.json");
    var decodedFoods = json.decode(fakeFoodsJson);
  }

  @override
  Future<List<Map<String, Object?>>> findByAttributeDesc(
    String collection,
    dynamic attribute,
    String attributeName,
    int limit,
    String orderBy,
    Object? lastObject, {
    bool descending = false,
  }) async {
    var collectionRef = _firestore.collection(collection);
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot;
      if (orderBy.isNotEmpty) {
        querySnapshot = await collectionRef
            .where(attributeName, isEqualTo: attribute)
            .startAfter((lastObject == null) ? [] : [lastObject])
            .orderBy(orderBy, descending: descending)
            .limit(limit)
            .get();
      } else {
        querySnapshot = await collectionRef
            .where(attributeName, isEqualTo: attribute)
            .startAfter((lastObject == null) ? [] : [lastObject])
            .limit(limit)
            .get();
      }
      var mapList = <Map<String, Object?>>[];
      for (var docSnapshot in querySnapshot.docs) {
        var map = docSnapshot.data();
        map["id"] = docSnapshot.id;
        mapList.add(map);
      }
      return mapList;
    } on FirebaseException catch (e) {
      throw AppFirestoreException.fromFirebaseException(e);
    }
  }

  @override
  void fetchListByAttributeDesc(
    String collection,
    dynamic attribute,
    String attributeName,
    String descAttributeName,
    BehaviorSubject<List<Map<String, Object?>>> streamSubject,
  ) {
    late Query<Map<String, dynamic>> collectionRef;

    try {
      if (collection.isEmpty) {
        throw FirebaseException(
          plugin: "firebase_firestore",
          code: "not-found",
          message: "It's not allowed to query for an empty collection name",
        );
      } else if ((attribute == null || attributeName.isEmpty) &&
          descAttributeName.isEmpty) {
        collectionRef = _firestore.collection(collection);
      } else if ((attribute == null || attributeName.isEmpty) &&
          descAttributeName.isNotEmpty) {
        collectionRef = _firestore
            .collection(collection)
            .orderBy(descAttributeName, descending: true);
      } else if ((attribute != null && attributeName.isNotEmpty) &&
          descAttributeName.isEmpty) {
        collectionRef = _firestore
            .collection(collection)
            .where(attributeName, isEqualTo: attribute);
      } else {
        collectionRef = _firestore
            .collection(collection)
            .orderBy(descAttributeName, descending: true)
            .where(attributeName, isEqualTo: attribute);
      }

      collectionRef.snapshots().listen(
        (event) {
          var docList = event.docs.map((e) => e.data()).toList();
          for (var change in event.docChanges) {
            switch (change.type) {
              case DocumentChangeType.removed:
                docList.removeWhere((doc) => doc == change.doc.data());
                break;
              default:
                break;
            }
          }
          streamSubject.sink.add(docList);
        },
      );
    } on FirebaseException catch (e) {
      throw AppFirestoreException.fromFirebaseException(e);
    }
  }
  // await for (final query in collectionRef.snapshots()) {
  //   var mapList = <Map<String, Object?>>[];
  //   for (var docSnapshot in query.docs) {
  //     var map = docSnapshot.data();
  //     map["id"] = docSnapshot.id;
  //     mapList.add(map);
  //   }
  //   yield mapList;
  // }
  //}

  @override
  Future<void> update(
      String collection, String docId, Map<String, Object> entity) async {
    var collectionRef = _firestore.collection(collection);
    try {
      entity["modified_at"] = FieldValue.serverTimestamp();
      await collectionRef.doc(docId).update(entity);
      return;
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> remove(String collection, String docId) {
    // TODO: remove doesnt remove subcollections. Handle it in the future (https://firebase.google.com/docs/firestore/manage-data/delete-data#delete_documents)
    try {
      return _firestore.collection(collection).doc(docId).delete();
    } on FirebaseException catch (e) {
      throw AppFirestoreException.fromFirebaseException(e);
    }
  }

  @override
  Future<void> setSubcollection(
    String parentCollection,
    String parentId,
    String childCollection,
    dynamic entity,
  ) async {
    var ref = _firestore
        .collection(parentCollection)
        .doc(parentId)
        .collection(childCollection);
    try {
      if (entity is List) {
        for (int index = 0; index < entity.length; index++) {
          var newDoc = {...entity[index] as Map<String, Object?>};
          newDoc["created_at"] = FieldValue.serverTimestamp();
          newDoc["modified_at"] = newDoc["created_at"];
          await ref.doc(entity[index]["id"]).set(newDoc);
        }
      } else {
        var newDoc = {...entity as Map<String, Object?>};
        newDoc["created_at"] = FieldValue.serverTimestamp();
        newDoc["modified_at"] = newDoc["created_at"];
        await ref.doc(newDoc["id"] as String?).set(newDoc);
      }
    } on FirebaseException catch (e) {
      throw AppFirestoreException.fromFirebaseException(e);
    }
  }

  @override
  Future<void> set(String collection, dynamic entity) async {
    try {
      if (entity is List) {
        for (int index = 0; index < entity.length; index++) {
          var docRef =
              _firestore.collection(collection).doc(entity[index]["id"]);
          (entity[index] as Map).remove("id");
          entity[index]["created_at"] = FieldValue.serverTimestamp();
          entity[index]["modified_at"] = entity[index]["created_at"];
          await docRef.set((entity[index] as Map<String, Object?>));
        }
      } else {
        var docRef = _firestore.collection(collection).doc(entity["id"]);
        (entity as Map).remove("id");
        entity["created_at"] = FieldValue.serverTimestamp();
        entity["modified_at"] = entity["created_at"];
        await docRef.set((entity as Map<String, Object?>));
      }
    } on FirebaseException catch (e) {
      throw AppFirestoreException.fromFirebaseException(e);
    }
  }

  @override
  void fetchSubCollection(
    String parentCollection,
    String parentId,
    String childCollection,
    BehaviorSubject<Map<String, Object?>> streamSubject,
  ) {
    late CollectionReference<Map<String, dynamic>> collectionRef;

    try {
      if (parentCollection.isEmpty || childCollection.isEmpty) {
        throw FirebaseException(
          plugin: "firebase_firestore",
          code: "not-found",
          message: "It's not allowed to query for an empty collection name",
        );
      } else {
        collectionRef = _firestore
            .collection(parentCollection)
            .doc(parentId)
            .collection(childCollection);
      }

      collectionRef.snapshots().listen(
        (event) {
          for (var change in event.docChanges) {
            var doc = change.doc.data();
            if (doc != null) {
              doc["documentChangeType"] = change.type;
              streamSubject.add(doc);
            }

            // switch (change.type) {
            //   case DocumentChangeType.removed:
            //     print("Removed City: ${change.doc.data()}");
            //     return change.doc.data();
            //     break;
            //   default:
            //     return change.doc.data();
            // }
          }
        },
      );
    } on FirebaseException catch (e) {
      throw AppFirestoreException.fromFirebaseException(e);
    }

    // await for (final query in collectionRef.snapshots()) {
    //   var mapList = <Map<String, Object?>>[];
    //   for (var docSnapshot in query.docs) {
    //     var map = docSnapshot.data();
    //     map["id"] = docSnapshot.id;
    //     mapList.add(map);
    //   }
    //   yield mapList;
    // }
  }

  @override
  Future<void> removeFromSubcollection(
    String parentCollection,
    String parentId,
    String childCollection,
    dynamic entity,
  ) {
    var ref = _firestore
        .collection(parentCollection)
        .doc(parentId)
        .collection(childCollection);

    try {
      return ref.doc(entity["id"]).delete();
    } on FirebaseException catch (e) {
      throw AppFirestoreException.fromFirebaseException(e);
    }
  }

  // @override
  // Future<void> addOrUpdateDoc(String collection, Map<String, Object> entity) {
  //   var docRef = _firestore.collection(collection).doc(entity["id"] as String);
  //   docRef.get().then(
  //         (docSnapshot) {
  //           if (docSnapshot.exists) {
  //           docRef.update(data);
  //   } else {
  //     usersRef.set({...}) // create the document
  //   }
  //         },
  //       );
  // }
}
