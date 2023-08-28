import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_sqflite_exception.freezed.dart';

@freezed
sealed class AppSqfliteException
    with _$AppSqfliteException
    implements Exception {
  const AppSqfliteException._();

  const factory AppSqfliteException.failInsert() = FailInsertSQLException;
  const factory AppSqfliteException.objectNotDeleted() =
      ObjectNotDeletedException;
}
