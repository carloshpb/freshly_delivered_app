// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../utils/converters/datetime_timestamp_converter.dart';
import 'discount.dart';

part 'advertisement.freezed.dart';
part 'advertisement.g.dart';

@freezed
class Advertisement with _$Advertisement {
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
}
