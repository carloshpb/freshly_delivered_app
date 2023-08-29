// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../utils/converters/datetime_timestamp_converter.dart';
import '../../application/dtos/advertisement_dto.dart';

part 'advertisement.freezed.dart';
part 'advertisement.g.dart';

@JsonSerializable(explicitToJson: true)
@Freezed(toJson: false, fromJson: false)
class Advertisement with _$Advertisement {
  const Advertisement._();

  factory Advertisement({
    @Default('') String id,
    @Default('') String description,
    @JsonKey(name: 'image_path') @Default('') String imagePath,
    @JsonKey(name: 'is_special') @Default(false) bool isSpecial,
    @Default(0) int discount,
    @DateTimeTimestampConverter()
    @JsonKey(name: 'created_at')
    DateTime? createdAt,
    @DateTimeTimestampConverter()
    @JsonKey(name: 'modified_at')
    DateTime? modifiedAt,
  }) = _Advertisement;

  factory Advertisement.fromJson(Map<String, Object?> json) =>
      _$AdvertisementFromJson(json);

  Map<String, dynamic> toJson() => _$AdvertisementToJson(this);

  AdvertisementDto toDto() {
    return AdvertisementDto(
      id: id,
      description: description,
      imagePath: imagePath,
      isSpecial: isSpecial,
      discount: discount,
    );
  }
}
