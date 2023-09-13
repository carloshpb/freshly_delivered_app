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
        CREATE TABLE ${Strings.discountLocalTable} (
          id TEXT PRIMARY KEY UNIQUE,
          discount_percent INTEGER NOT NULL,
          expires_at INTEGER NOT NULL,
          created_at INTEGER NOT NULL,
          modified_at INTEGER NOT NULL,
          expiration INTEGER NOT NULL
        )
        ''');
  batch.execute('''
        CREATE TABLE ${Strings.productsLocalTable} (
          id TEXT PRIMARY KEY UNIQUE,
          title TEXT NOT NULL, 
          price REAL NOT NULL, 
          description TEXT NOT NULL, 
          category TEXT NOT NULL,
          image_path TEXT NOT NULL, 
          units_sold INTEGER NOT NULL,
          discount_id TEXT NOT NULL,
          created_at INTEGER NOT NULL,
          modified_at INTEGER NOT NULL,
          expiration INTEGER NOT NULL,
          FOREIGN KEY(discount_id) REFERENCES discounts(id)
        )
        ''');

  batch.execute('''
        CREATE TABLE ${Strings.advertisementsLocalTable} (
          id TEXT PRIMARY KEY,
          description TEXT NOT NULL, 
          image_path TEXT NOT NULL, 
          is_special INTEGER NOT NULL,
          discount_id TEXT NOT NULL,
          created_at INTEGER NOT NULL,
          modified_at INTEGER NOT NULL,
          expiration INTEGER NOT NULL,
          FOREIGN KEY(discount_id) REFERENCES discounts(id)
        )
        ''');

  batch.execute('''
      CREATE TABLE ${Strings.appUserLocalTable} (
          id TEXT PRIMARY KEY,
          email TEXT NOT NULL, 
          fullname TEXT NOT NULL,
          phone_number TEXT NOT NULL,
          created_at INTEGER NOT NULL,
          modified_at INTEGER NOT NULL,
          runtimeType TEXT NOT NULL,
          expiration INTEGER NOT NULL
        )
      ''');

  batch.execute('''
      CREATE TABLE ${Strings.userCartLocalTable} (
          id TEXT PRIMARY KEY,
          amount INTEGER NOT NULL,
          created_at INTEGER NOT NULL,
          modified_at INTEGER NOT NULL,
          expiration INTEGER NOT NULL
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
  Future<List<Map<String, Object?>>> findAll(
    String table,
    int expirationLimitMinutes,
  ) async {
    var result = await _database.rawQuery(
      '''
      SELECT * FROM $table
      ''',
    );

    result = _verifyExpirationTime(result, expirationLimitMinutes);

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
    String table,
    int expirationLimitMinutes, {
    int limit = -1,
    int offset = 0,
  }) async {
    var query = "SELECT * FROM $table ORDER BY modified_at DESC";

    query = "$query LIMIT $offset";
    query = "$query OFFSET $limit";

    var result = await _database.rawQuery(query);

    result = _verifyExpirationTime(result, expirationLimitMinutes);

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
  Future<Map<String, Object?>> findById(
    String table,
    String id,
    int expirationLimitMinutes,
  ) async {
    var result = await _database.rawQuery(
      '''
      SELECT * FROM $table
      WHERE id = ${_convertValueToSqliteTypeValue(id)}
      ''',
    );

    result =
        _verifyExpirationTime(result, DateTime.now().millisecondsSinceEpoch);

    if (result.isEmpty || (result[0]["id"] as String).contains("expired")) {
      throw IdNotFoundException(id, table, Strings.sqlite);
    }

    _millisecondsSinceEpochToTimestamp(result[0]);

    return result[0];
  }

  /// May throw TypeError
  /// returns 0 if value was not saved
  @override
  Future<int> save(String table, dynamic entity, List<String> columns) async {
    columns.add('expiration');
    var insert = "INSERT INTO $table(${columns.join(", ")}) VALUES";

    if (entity is List) {
      var batch = _database.batch();
      for (var index = 0; index < entity.length; index++) {
        _timestampToMillisecondsSinceEpoch(entity[index]);
        entity[index]['expiration'] = DateTime.now().millisecondsSinceEpoch;
        var dataFields = (entity[index] as Map<String, Object?>).entries
          ..forEach((element) => _convertValueToSqliteTypeValue(element));
        batch.rawInsert("$insert (${dataFields.join(",")})");
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
      entity['expiration'] = DateTime.now().millisecondsSinceEpoch;
      var dataFields = (entity as Map<String, Object?>).entries
        ..forEach((element) => _convertValueToSqliteTypeValue(element));

      // var dataToInsertString = "";

      // for (var i = 0; i < columns.length; i++) {
      //   if (i != 0) {
      //     dataToInsertString = "$dataToInsertString, ";
      //   }
      //   dataToInsertString =
      //       "$dataToInsertString${_convertValueToSqliteTypeValue(entity[columns[i]])}";
      // }

      // var result = await _database.rawInsert("$insert ($dataToInsertString)");

      var result =
          await _database.rawInsert("$insert (${dataFields.join(",")})");

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
    String orderBy,
    int expirationLimitMinutes, {
    int limit = -1,
    int offset = 0,
    bool descending = false,
  }) async {
    var query = "SELECT * FROM $table";

    if (attribute != null && attributeName.isNotEmpty) {
      query =
          "$query WHERE $attributeName = ${_convertValueToSqliteTypeValue(attribute)}";
    }

    if (orderBy.isEmpty) {
      orderBy = "modified_at";
    }

    String ascOrDesc = (descending) ? "DESC" : "ASC";

    query = "$query ORDER BY $orderBy $ascOrDesc";

    query = "$query LIMIT $limit";

    query = "$query OFFSET $offset";

    var result = await _database.rawQuery(query);

    result = _verifyExpirationTime(result, expirationLimitMinutes);

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
          "$query ${setAttributes[index].attributeName} = ${_convertValueToSqliteTypeValue(setAttributes[index].value)},";
    }
    // query = "$query modified_at = ${DateTime.now().millisecondsSinceEpoch}";
    query = "$query expiration = ${DateTime.now().millisecondsSinceEpoch}";
    // query = query.substring(0, query.length - 1);
    query =
        "$query WHERE ${whereSingleCondition.attributeName} == ${_convertValueToSqliteTypeValue(whereSingleCondition.equalValue)};";

    var result = await _database.rawUpdate(query);

    if (result == 0) {
      throw DataNotUpdatedInDbException(
        setAttributes,
        table,
        Strings.sqlite,
      );
    }

    return result;
  }

  /// Should be treated at repository
  @override
  Future<List<Map<String, Object?>>> customQuery(
      String query, int expirationLimitMinutes) async {
    var result = await _database.rawQuery(query);

    result = _verifyExpirationTime(result, expirationLimitMinutes);

    return result;
  }

  /// returns 0 if no changes were made. Otherwise, returns the number of changes
  @override
  Future<int> deleteById(String table, String id) async {
    var result = await _database.rawDelete('''
      DELETE FROM $table
      WHERE id == ${_convertValueToSqliteTypeValue(id)};
    ''');

    if (result == 0) {
      throw AppSqliteException.dataNotDeleted(
        id,
        table,
        Strings.sqlite,
      );
    }

    return result;
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

  String _convertValueToSqliteTypeValue(dynamic value) {
    if (value is String) {
      return "'$value'";
    } else if (value is num) {
      return value.toString();
    } else if (value is bool) {
      return (value == true) ? '1' : '0';
    } else {
      return "$value";
    }
  }

  // cache expiration time : Return exception if it has expired, so we can get new one from server
  List<Map<String, Object?>> _verifyExpirationTime(
      List<Map<String, Object?>> result, int expirationLimitMinutes) {
    if (expirationLimitMinutes != 0) {
      result = result.map((element) {
        var currentDateTime = DateTime.now();
        var expirationDateTimeProduct =
            DateTime.fromMillisecondsSinceEpoch(element['expiration'] as int);
        if (currentDateTime.difference(expirationDateTimeProduct).inMinutes >
            expirationLimitMinutes.abs()) {
          element["id"] = "${element["id"]}expired";
        }
        return element;
      }).toList();
    }
    return result;
  }

  @override
  Future<int> insertOrReplace(
      String table, entity, List<String> columns) async {
    columns.add('expiration');
    var insert = "INSERT OR REPLACE INTO $table(${columns.join(", ")}) VALUES";

    if (entity is List) {
      var batch = _database.batch();
      for (var index = 0; index < entity.length; index++) {
        _timestampToMillisecondsSinceEpoch(entity[index]);
        entity[index]['expiration'] = DateTime.now().millisecondsSinceEpoch;
        var dataFields = (entity[index] as Map<String, Object?>).entries
          ..forEach((element) => _convertValueToSqliteTypeValue(element));
        batch.rawInsert("$insert (${dataFields.join(",")})");
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
      entity['expiration'] = DateTime.now().millisecondsSinceEpoch;
      var dataFields = (entity as Map<String, Object?>).entries
        ..forEach((element) => _convertValueToSqliteTypeValue(element));
      var result =
          await _database.rawInsert("$insert (${dataFields.join(",")})");

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
}
