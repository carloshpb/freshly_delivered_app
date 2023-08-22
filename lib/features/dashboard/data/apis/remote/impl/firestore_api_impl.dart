import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      for (var docSnapshot in querySnapshot.docs) {
        var map = docSnapshot.data();
        map["id"] = docSnapshot.id;
        productsJsonList.add(map);
      }
      return productsJsonList;
    } on Exception {
      rethrow;
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
      for (var docSnapshot in querySnapshot.docs) {
        var map = docSnapshot.data();
        map["id"] = docSnapshot.id;
        productsJsonList.add(map);
      }
      return productsJsonList;
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<dynamic> findById(String collection, String id) async {
    var collectionRef = _firestore.collection(collection);
    try {
      var docSnapshot = await collectionRef.doc(id).get();
      var productMap = docSnapshot.data();
      if (productMap == null || productMap.isEmpty) {
        // TODO : Treat it in above call
        return {};
      }
      productMap["id"] = docSnapshot.id;
      return productMap;
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<dynamic> add(String collection, dynamic entity) async {
    var collectionRef = _firestore.collection(collection);
    try {
      if (entity is List) {
        for (int index = 0; index < entity.length; index++) {
          var docSnapshot = await collectionRef.add(
            entity[index]
              ..putIfAbsent(
                "created_at",
                () => FieldValue.serverTimestamp(),
              )
              ..putIfAbsent(
                "modified_at",
                () => entity[index]["created_at"],
              ),
          );
          entity[index]["id"] = docSnapshot.id;
        }
        return entity;
      } else {
        var docSnapshot = await collectionRef.add(
          (entity as Map<String, Object?>)
            ..putIfAbsent(
              "created_at",
              () => FieldValue.serverTimestamp(),
            )
            ..putIfAbsent(
              "modified_at",
              () => entity["created_at"],
            ),
        );
        entity["id"] = docSnapshot.id;
        return entity;
      }
    } on Exception {
      rethrow;
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
    attribute,
    String attributeName,
    int limit,
    Object? lastObject,
  ) async {
    var collectionRef = _firestore.collection(collection);
    try {
      var querySnapshot = await collectionRef
          .where(attributeName, isEqualTo: attribute)
          .startAfter((lastObject == null) ? [] : [lastObject])
          .limit(limit)
          .get();
      var mapList = <Map<String, Object?>>[];
      for (var docSnapshot in querySnapshot.docs) {
        var map = docSnapshot.data();
        map["id"] = docSnapshot.id;
        mapList.add(map);
      }
      return mapList;
    } on Exception {
      rethrow;
    }
  }

  @override
  Stream<List<Map<String, Object?>>> fetchByAttributeDesc(String collection,
      attribute, String attributeName, String descAttributeName) async* {
    late Query<Map<String, dynamic>> collectionRef;

    if (collection.isEmpty) {
      throw FirebaseException(
        plugin: "firebase_firestore",
        code: "not-found",
        message: "It's not allowed to query for an empty collection name",
      );
    } else if (attributeName.isEmpty && descAttributeName.isNotEmpty) {
      collectionRef = _firestore
          .collection(collection)
          .orderBy(descAttributeName, descending: true);
    } else if (attributeName.isNotEmpty && descAttributeName.isEmpty) {
      collectionRef = _firestore
          .collection(collection)
          .where(attributeName, isEqualTo: attribute);
    } else {
      collectionRef = _firestore
          .collection(collection)
          .orderBy(descAttributeName, descending: true)
          .where(attributeName, isEqualTo: attribute);
    }

    await for (final query in collectionRef.snapshots()) {
      var mapList = <Map<String, Object?>>[];
      for (var docSnapshot in query.docs) {
        var map = docSnapshot.data();
        map["id"] = docSnapshot.id;
        mapList.add(map);
      }
      yield mapList;
    }
  }

  // @override
  // Future<void> update(
  //     String collection, String docId, Map<String, Object> entity) async {
  //   // TODO : handle remove field if new update doesnt have an old field (https://firebase.google.com/docs/firestore/manage-data/delete-data#fields)
  //   var collectionRef = _firestore.collection(collection);
  //   try {
  //     entity["modified_at"] = FieldValue.serverTimestamp();
  //     await collectionRef.doc(docId).update(entity);
  //     return;
  //   } on Exception {
  //     rethrow;
  //   }
  // }

  @override
  Future<void> remove(String collection, String docId) {
    // TODO: remove doesnt remove subcollections. Handle it in the future (https://firebase.google.com/docs/firestore/manage-data/delete-data#delete_documents)
    return _firestore.collection(collection).doc(docId).delete();
  }

  @override
  Future<void> setSubcollection(
    String parentCollection,
    String parentId,
    String childCollection,
    String childId,
    dynamic entity,
  ) {
    // TODO: implement setSubcollection
    throw UnimplementedError();
  }

  @override
  Future<void> set(String collection, String docId, dynamic entity) async {
    var docRef = _firestore.collection(collection).doc(docId);
    try {
      if (entity is List) {
        for (int index = 0; index < entity.length; index++) {
          await docRef.set(
            entity[index]
              ..putIfAbsent(
                "created_at",
                () => FieldValue.serverTimestamp(),
              )
              ..putIfAbsent(
                "modified_at",
                () => entity[index]["created_at"],
              ),
          );
          entity[index]["id"] = docSnapshot.id;
        }
        return entity;
      } else {
        var docSnapshot = await collectionRef.add(
          (entity as Map<String, Object?>)
            ..putIfAbsent(
              "created_at",
              () => FieldValue.serverTimestamp(),
            )
            ..putIfAbsent(
              "modified_at",
              () => entity["created_at"],
            ),
        );
        entity["id"] = docSnapshot.id;
        return entity;
      }
    } on Exception {
      rethrow;
    }
  }

  @override
  Stream<List<Map<String, Object?>>> fetchSubCollection(
    String parentCollection,
    String parentId,
    String childCollection,
  ) async* {
    late CollectionReference<Map<String, dynamic>> collectionRef;

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

    await for (final query in collectionRef.snapshots()) {
      var mapList = <Map<String, Object?>>[];
      for (var docSnapshot in query.docs) {
        var map = docSnapshot.data();
        map["id"] = docSnapshot.id;
        mapList.add(map);
      }
      yield mapList;
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
