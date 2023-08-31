import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../../../constants/strings.dart';
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
      if (querySnapshot.docs.isEmpty) {
        throw DataNotFoundInDbException(
          '',
          collection,
          Strings.firestore,
        );
      }
      for (var docSnapshot in querySnapshot.docs) {
        var map = docSnapshot.data();
        map["id"] = docSnapshot.id;
        productsJsonList.add(map);
      }
      return productsJsonList;
    } on FirebaseException {
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
      if (querySnapshot.docs.isEmpty) {
        throw DataNotFoundInDbException(
          '',
          collection,
          Strings.firestore,
        );
      }
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
        throw IdNotFoundException(id, collection, Strings.firestore);
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

    if (entity is List) {
      for (int index = 0; index < entity.length; index++) {
        var docRef = await collectionRef.add(
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
        entity[index]["id"] = docRef.id;
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
    } on Exception {
      rethrow;
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
    dynamic entity,
  ) async {
    var ref = _firestore
        .collection(parentCollection)
        .doc(parentId)
        .collection(childCollection);
    try {
      if (entity is List) {
        for (int index = 0; index < entity.length; index++) {
          await ref.doc(entity[index]["id"]).set(
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
        }
      } else {
        await ref.doc(entity["id"]).set(
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
      }
    } on Exception {
      rethrow;
    }
  }

  @override
  Future<void> set(String collection, dynamic entity) async {
    var docRef = _firestore.collection(collection).doc(entity["id"]);
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
        }
      } else {
        await docRef.set(
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
      }
    } on Exception {
      rethrow;
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

    return ref.doc(entity["id"]).delete();
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
