import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeTimestampConverter
    implements JsonConverter<DateTime?, Timestamp?> {
  const DateTimeTimestampConverter();

  @override
  DateTime? fromJson(Timestamp? json) {
    return json?.toDate();
  }

  @override
  Timestamp? toJson(DateTime? data) =>
      data != null ? Timestamp.fromDate(data) : null;
}
