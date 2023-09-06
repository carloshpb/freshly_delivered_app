import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/discount.dart';

part 'discount_dto.freezed.dart';

@freezed
sealed class DiscountDto with _$DiscountDto {
  const DiscountDto._();

  @Assert('id != ""', 'id cannot be empty')
  @Assert('discountPercent >= 0 && discountPercent <= 100',
      'price cannot be negative or bigger than 100')
  const factory DiscountDto({
    required String id,
    @Default(0) int discountPercent,
    DateTime? expiresAt,
  }) = _DiscountDto;

  factory DiscountDto.blank() => const DiscountDto(id: "-1");

  factory DiscountDto.fromDomain(Discount domain) => (domain.id == "-1")
      ? DiscountDto.blank()
      : DiscountDto(
          id: domain.id,
          discountPercent: domain.discountPercent,
          expiresAt: domain.expiresAt,
        );

  Discount toDomain() => (id == "-1")
      ? Discount.blank()
      : Discount(
          id: id,
          discountPercent: discountPercent,
          expiresAt: expiresAt,
        );
}
