// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../utils/converters/datetime_timestamp_converter.dart';
import 'discount.dart';

part 'advertisement.freezed.dart';
part 'advertisement.g.dart';

@freezed
class Advertisement with _$Advertisement {
  // const Advertisement._();

  // @JsonSerializable(explicitToJson: true)
  // const factory Advertisement.empty() = EmptyAdvertisement;

  @JsonSerializable(explicitToJson: true)
  @Assert('id != ""', 'id cannot be empty')
  @Assert('description != ""', 'description cannot be empty')
  @Assert('imagePath != ""', 'imagePath cannot be empty')
  factory Advertisement({
    required String id,
    required String description,
    @JsonKey(name: 'image_path') required String imagePath,
    @JsonKey(name: 'is_special') @Default(false) bool isSpecial,
    @Default(Discount(id: '-1')) Discount discount,
    @DateTimeTimestampConverter()
    @JsonKey(name: 'created_at')
    DateTime? createdAt,
    @DateTimeTimestampConverter()
    @JsonKey(name: 'modified_at')
    DateTime? modifiedAt,
  }) = _Advertisement;

  factory Advertisement.fromJson(Map<String, Object?> json) =>
      _$AdvertisementFromJson(json);

  // factory Advertisement.fromSqliteJson(Map<String, Object?> json) {
  //   var datetimeConverter = const DateTimeToMillisecondsSinceEpochConverter();

  //   switch (json['runtimeType']) {
  //     case 'empty':
  //       return EmptyAdvertisement.fromJson(json);
  //     case 'normal':
  //       return NormalAdvertisement(
  //         id: json['id'] as String,
  //         description: json['description'] as String,
  //         imagePath: json['image_path'] as String,
  //         isSpecial: json['is_special'] as bool,
  //         discount: json['discount'] as int,
  //         createdAt: datetimeConverter.fromJson(json['created_at'] as int),
  //         modifiedAt: datetimeConverter.fromJson(json['modified_at'] as int),
  //       );

  //     default:
  //       throw CheckedFromJsonException(json, 'runtimeType', 'Advertisement',
  //           'Invalid union type "${json['runtimeType']}"!');
  //   }
  // }

  // Map<String, dynamic> toSqliteJson() {
  //   var datetimeConverter = const DateTimeToMillisecondsSinceEpochConverter();

  //   switch (this) {
  //     case EmptyAdvertisement():
  //       return toJson();
  //     case NormalAdvertisement():
  //       return <String, dynamic>{
  //         'id': (this as NormalAdvertisement).id,
  //         'description': (this as NormalAdvertisement).description,
  //         'image_path': (this as NormalAdvertisement).imagePath,
  //         'is_special': (this as NormalAdvertisement).isSpecial,
  //         'discount': (this as NormalAdvertisement).discount,
  //         'created_at':
  //             datetimeConverter.toJson((this as NormalAdvertisement).createdAt),
  //         'modified_at': datetimeConverter
  //             .toJson((this as NormalAdvertisement).modifiedAt),
  //         'runtimeType': "normal",
  //       };
  //     default:
  //       var thisJson = toJson();
  //       throw CheckedToJsonException(thisJson, 'runtimeType', 'Advertisement',
  //           'Invalid union type "${thisJson['runtimeType']}"!');
  //   }
  // }
}
