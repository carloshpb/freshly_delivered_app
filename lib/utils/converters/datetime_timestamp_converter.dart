import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DateTimeTimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const DateTimeTimestampConverter();

  @override
  DateTime fromJson(Timestamp json) {
    // type data was already set (e.g. because we serialized it ourselves)
    if (json['runtimeType'] != null) {
      return MyResponse.fromJson(json);
    }
    // you need to find some condition to know which type it is. e.g. check the presence of some field in the json
    if (isTypeData) {
      return MyResponseData.fromJson(json);
    } else if (isTypeSpecial) {
      return MyResponseSpecial.fromJson(json);
    } else if (isTypeError) {
      return MyResponseError.fromJson(json);
    } else {
      throw Exception(
          'Could not determine the constructor for mapping from JSON');
    }
  }

  @override
  Map<String, dynamic> toJson(MyResponse data) => data.toJson();
}
