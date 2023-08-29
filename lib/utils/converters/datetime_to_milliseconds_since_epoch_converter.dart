import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeToMillisecondsSinceEpochConverter
    implements JsonConverter<DateTime?, int> {
  const DateTimeToMillisecondsSinceEpochConverter();

  @override
  DateTime? fromJson(int json) {
    return (json == -1) ? null : DateTime.fromMillisecondsSinceEpoch(json);
  }

  @override
  int toJson(DateTime? data) =>
      (data != null) ? data.millisecondsSinceEpoch : -1;
}
