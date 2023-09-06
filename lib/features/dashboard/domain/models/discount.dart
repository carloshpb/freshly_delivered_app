// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../utils/converters/datetime_timestamp_converter.dart';

part 'discount.freezed.dart';
part 'discount.g.dart';

@freezed
sealed class Discount with _$Discount {
  @JsonSerializable(explicitToJson: true)
  @Assert('id != ""', 'id cannot be empty')
  @Assert('discountPercent >= 0 && discountPercent <= 100',
      'price cannot be negative or bigger than 100')
  const factory Discount({
    required String id,
    @Default(0) int discountPercent,
    @DateTimeTimestampConverter()
    @JsonKey(name: 'expires_at')
    DateTime? expiresAt,
    @DateTimeTimestampConverter()
    @JsonKey(name: 'created_at')
    DateTime? createdAt,
    @DateTimeTimestampConverter()
    @JsonKey(name: 'modified_at')
    DateTime? modifiedAt,
  }) = _Discount;

  factory Discount.blank() => const Discount(id: "-1");

  factory Discount.fromJson(Map<String, Object?> json) =>
      _$DiscountFromJson(json);
}
