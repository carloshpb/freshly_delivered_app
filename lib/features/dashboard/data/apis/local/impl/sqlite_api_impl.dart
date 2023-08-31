import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sqflite/sqflite.dart';

import '../../../../../../constants/strings.dart';
import '../../../../../../exceptions/app_sqlite_exception.dart';
import '../sqlite_api.dart';

Future<void> sqliteOnCreate(Database db, int version) async {
  var batch = db.batch();
  // When creating the db, create the table
  batch.execute('''
        CREATE TABLE ${Strings.productsLocalTable} (
          id TEXT PRIMARY KEY,
          title TEXT NOT NULL, 
          price REAL NOT NULL, 
          description TEXT NOT NULL, 
          category TEXT NOT NULL,
          image_path TEXT NOT NULL, 
          units_sold INTEGER NOT NULL,
          advertisement_id TEXT NOT NULL,
          discount INTEGER NOT NULL,
          created_at INTEGER NOT NULL,
          modified_at INTEGER NOT NULL
        )
        ''');

  batch.execute('''
        CREATE TABLE ${Strings.advertisementsLocalTable} (
          id TEXT PRIMARY KEY,
          description TEXT NOT NULL, 
          image_path TEXT NOT NULL, 
          is_special INTEGER NOT NULL,
          created_at INTEGER NOT NULL,
          modified_at INTEGER NOT NULL
        )
        ''');

  batch.execute('''
      CREATE TABLE ${Strings.appUserLocalTable} (
          id TEXT PRIMARY KEY,
          email TEXT NOT NULL, 
          fullname TEXT NOT NULL, 
          password TEXT NOT NULL,
          phoneNumber TEXT NOT NULL
        )
      ''');

  batch.execute('''
      CREATE TABLE ${Strings.userCartLocalTable} (
          id TEXT PRIMARY KEY,
          amount INTEGER NOT NULL
          created_at INTEGER NOT NULL,
          modified_at INTEGER NOT NULL
        )
      ''');

  await batch.commit();
}

final sqliteApiProvider = Provider<SQLiteApi>(
  (_) {
    // Always override in main to dispose the DB
    throw UnimplementedError();
  },
);

class SQLiteApiImpl implements SQLiteApi {
  final Database _database;

  SQLiteApiImpl(Database database) : _database = database;

  @override
  Future<List<Map<String, Object?>>> findAll(String table) async {
    var result = await _database.rawQuery(
      '''
      SELECT * FROM $table
      ''',
    );

    if (result.isEmpty) {
      throw DataNotFoundInDbException(
        '',
        table,
        Strings.sqlite,
      );
    }

    return result.map((e) {
      _millisecondsSinceEpochToTimestamp(e);
      return e;
    }).toList();
  }

  @override
  Future<List<Map<String, Object?>>> findAllWithLimit(
      String table, int limit, int offset) async {
    var query = "SELECT * FROM $table ORDER BY modified_at DESC";

    if (limit != 0) {
      query = "$query OFFSET $limit";
    }
    if (offset != 0) {
      query = "$query LIMIT $offset";
    }

    var result = await _database.rawQuery(query);

    if (result.isEmpty) {
      throw DataNotFoundInDbException(
        '',
        table,
        Strings.sqlite,
      );
    }

    return result.map((e) {
      _millisecondsSinceEpochToTimestamp(e);
      return e;
    }).toList();
  }

  @override
  Future<Map<String, Object?>> findById(String table, String id) async {
    var result = await _database.rawQuery(
      '''
      SELECT * FROM $table
      WHERE id = $id
      ''',
    );

    if (result.isEmpty) {
      throw IdNotFoundException(id, table, Strings.sqlite);
    }

    _millisecondsSinceEpochToTimestamp(result[0]);

    return result[0];
  }

  /// May throw TypeError
  /// returns 0 if value was not saved
  @override
  Future<int> save(String table, dynamic entity, List<String> columns) async {
    var insert = "INSERT INTO $table(${columns.join(", ")}) VALUES";

    if (entity is List) {
      var batch = _database.batch();
      for (var index = 0; index < entity.length; index++) {
        _timestampToMillisecondsSinceEpoch(entity[index]);
        batch.rawInsert(
            "$insert (${(entity[index] as Map<String, Object?>).entries.join(",")})");
      }
      var resultList = await batch.commit();
      if (resultList.length != entity.length) {
        var notAddedIds = entity
            .where((element) => !resultList.contains(element["id"]))
            .map((e) => e["id"])
            .toList();
        throw DataNotInsertedInDbException(
          notAddedIds,
          table,
          Strings.sqlite,
        );
      }
      return (resultList.length == entity.length) ? resultList.length : 0;
    } else {
      _timestampToMillisecondsSinceEpoch(entity);
      var result = await _database.rawInsert(
          "$insert (${(entity as Map<String, Object?>).entries.join(",")})");

      if (result == 0) {
        throw DataNotInsertedInDbException(
          entity["id"],
          table,
          Strings.sqlite,
        );
      }

      return result;
    }
  }

  @override
  Future<List<Map<String, Object?>>> findByAttributeDesc(
    String table,
    dynamic attribute,
    String attributeName,
    int limit,
    String orderBy,
    int offset, {
    bool descending = false,
  }) async {
    var query = "SELECT * FROM $table";

    if (attribute != null && attributeName.isNotEmpty) {
      query = "$query WHERE $attributeName = $attribute";
    }

    if (orderBy.isEmpty) {
      orderBy = "modified_at";
    }

    String ascOrDesc = (descending) ? "DESC" : "ASC";

    query = "$query ORDER BY $orderBy $ascOrDesc";

    if (limit != 0) {
      query = "$query LIMIT $limit";
    }

    if (offset != 0) {
      query = "$query OFFSET $offset";
    }

    var result = await _database.rawQuery(query);

    if (result.isEmpty) {
      throw DataNotFoundInDbException(
        attribute,
        table,
        Strings.sqlite,
      );
    }

    return result.map((e) {
      _millisecondsSinceEpochToTimestamp(e);
      return e;
    }).toList();
  }

  // @override
  // StreamController<Map<String, Object?>> fetchByAttribute(
  //     String table, attribute, String attributeName) {
  //   // TODO - finish this
  //   final streamController = StreamController<Map<String, Object?>>(
  //     onListen: () => print('Listens'),
  //   );

  //   // _database.ra

  //   // streamController.
  // }

  @override
  Future<void> clearDatabase() async {
    await _database.transaction(
      (txn) async {
        var batch = txn.batch();
        batch.delete(Strings.appUserLocalTable);
        batch.delete(Strings.productsLocalTable);
        batch.delete(Strings.advertisementsLocalTable);
        batch.delete(Strings.userCartLocalTable);
        await batch.commit();
      },
    );
  }

  /// May throw TypeError
  /// returns 0 if value was not updated
  @override
  Future<int> update(
    String table,
    List<({String attributeName, dynamic value})> setAttributes,
    ({String attributeName, dynamic equalValue}) whereSingleCondition,
  ) async {
    var query = "UPDATE $table SET";
    for (int index = 0; index < setAttributes.length; index++) {
      query =
          "$query ${setAttributes[index].attributeName} = ${setAttributes[index].value},";
    }
    query = "$query modified_at = ${DateTime.now().millisecondsSinceEpoch}";
    // query = query.substring(0, query.length - 1);
    query =
        "$query WHERE ${whereSingleCondition.attributeName} == ${whereSingleCondition.equalValue};";

    var result = await _database.rawUpdate(query);

    if (result == 0) {
      throw DataNotUpdatedInDbException(
        setAttributes,
        table,
        Strings.sqlite,
      );
    }

    return _database.rawUpdate(query);
  }

  /// Should be treated at repository
  @override
  Future<List<Map<String, Object?>>> customQuery(String query) {
    return _database.rawQuery(query);
  }

  /// returns 0 if no changes were made. Otherwise, returns the number of changes
  @override
  Future<int> deleteById(String table, String id) {
    return _database.rawDelete('''
      DELETE FROM $table
      WHERE id == $id;
    ''');
  }

  /// Freezed lib still doesn't contain a way to have multiple different converters, so the simplest and less-code way is this one
  /// store Timestamp as int because its smaller
  void _timestampToMillisecondsSinceEpoch(Map<String, Object?> map) {
    if (map.containsKey("created_at")) {
      map["created_at"] =
          (map["created_at"] as Timestamp?)?.millisecondsSinceEpoch;
    }
    if (map.containsKey("modified_at")) {
      map["modified_at"] =
          (map["modified_at"] as Timestamp?)?.millisecondsSinceEpoch;
    }
  }

  void _millisecondsSinceEpochToTimestamp(Map<String, Object?> map) {
    if (map.containsKey("created_at")) {
      map["created_at"] = ((map["created_at"] as int?) == null)
          ? null
          : Timestamp.fromMillisecondsSinceEpoch(map["created_at"] as int);
    }
    if (map.containsKey("modified_at")) {
      map["modified_at"] = ((map["modified_at"] as int?) == null)
          ? null
          : Timestamp.fromMillisecondsSinceEpoch(map["modified_at"] as int);
    }
  }
}
