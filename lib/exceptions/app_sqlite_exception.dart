import 'package:freezed_annotation/freezed_annotation.dart';

import 'app_api_exception.dart';

part 'app_sqlite_exception.freezed.dart';

@freezed
sealed class AppSqliteException
    with _$AppSqliteException
    implements AppApiException {
  const AppSqliteException._();

  const factory AppSqliteException.dataNotInserted(
    dynamic object,
    String table,
    String database,
  ) = DataNotInsertedInDbException;
  const factory AppSqliteException.dataNotDeleted(
    dynamic object,
    String table,
    String database,
  ) = DataNotDeletedInDbException;
  const factory AppSqliteException.dataNotFound(
    dynamic object,
    String table,
    String database,
  ) = DataNotFoundInDbException;
  const factory AppSqliteException.dataNotUpdated(
    dynamic object,
    String table,
    String database,
  ) = DataNotUpdatedInDbException;
  const factory AppSqliteException.idNotFound(
    String id,
    String table,
    String database,
  ) = IdNotFoundException;

  @override
  String get message {
    dynamic msgObj;
    String actionType;
    String msgTable;
    switch (this) {
      case DataNotInsertedInDbException():
        msgObj = (this as DataNotInsertedInDbException).object;
        actionType = "inserted";
        break;
      case DataNotDeletedInDbException():
        msgObj = (this as DataNotDeletedInDbException).object;
        actionType = "deleted";
        break;
      case DataNotFoundInDbException():
        msgObj = (this as DataNotFoundInDbException).object;
        actionType = "found";
        break;
      case DataNotUpdatedInDbException():
        msgObj = (this as DataNotUpdatedInDbException).object;
        actionType = "updated";
        break;
      default:
        var castId = (this as IdNotFoundException).id;
        var castTable = (this as IdNotFoundException).table;
        msgObj = (castId.isEmpty) ? "(EMPTY)" : castId;
        msgTable = (castTable.isEmpty) ? "(EMPTY)" : castTable;
        return "Object id $msgObj was not found in $msgTable into the database $database";
    }

    return (msgObj == null ||
            (msgObj is String && msgObj.isEmpty) ||
            (msgObj is List && msgObj.isEmpty))
        ? "Nothing of $table was $actionType in the database $database"
        : "Object $msgObj of $table couldn't be $actionType into the database $database";
  }
}
