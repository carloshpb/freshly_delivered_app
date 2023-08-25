import 'package:freezed_annotation/freezed_annotation.dart';

/// DateTime is UTC
class DateTimeStringConverter implements JsonConverter<DateTime?, String> {
  const DateTimeStringConverter();

  /// Instead of using tryParse, which could return a DateTime?, we're agoing to use parse() due to the reason that the DateTime.parse should always work, as all time stored should be in UTC format or Timestamp, which is the one used in Firestore.
  @override
  DateTime? fromJson(String json) {
    return (json.isEmpty) ? null : DateTime.parse(json);
  }

  @override
  String toJson(DateTime? data) => (data == null) ? '' : data.toIso8601String();
}
