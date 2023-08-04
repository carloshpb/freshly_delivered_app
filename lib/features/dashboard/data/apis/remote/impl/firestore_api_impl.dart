import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../firestore_api.dart';

final firestoreApiProvider = FutureProvider<FirestoreApi>(
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
  Future<List<dynamic>> findAllWithLimit(String collection, int limit) async {
    var collectionRef = _firestore.collection(collection);
    try {
      var productsJsonList = [];
      var querySnapshot = await collectionRef.limit(limit).get();
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
  Future<List<dynamic>> addProducts(
      String collection, List<Map<String, dynamic>> products) async {
    var collectionRef = _firestore.collection(collection);
    try {
      for (int index = 0; index < products.length; index++) {
        var docSnapshot = await collectionRef.add(products[index]);
        products[index]["id"] = docSnapshot.id;
      }
      return products;
    } on Exception {
      rethrow;
    }
  }
}
