import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/advertisement.dart';
import 'discount_dto.dart';

part 'advertisement_dto.freezed.dart';

@freezed
class AdvertisementDto with _$AdvertisementDto {
  const AdvertisementDto._();

  @Assert('id != ""', 'id cannot be empty')
  @Assert('description != ""', 'description cannot be empty')
  @Assert('imagePath != ""', 'imagePath cannot be empty')
  const factory AdvertisementDto({
    @Default('') String id,
    @Default('') String description,
    @Default('') String imagePath,
    @Default(false) bool isSpecial,
    @Default(DiscountDto(id: "-1")) DiscountDto discount,
  }) = _AdvertisementDto;

  factory AdvertisementDto.fromDomain(Advertisement domain) => AdvertisementDto(
        id: domain.id,
        description: domain.description,
        discount: DiscountDto.fromDomain(domain.discount),
        imagePath: domain.imagePath,
        isSpecial: domain.isSpecial,
      );

  Advertisement toDomain() => Advertisement(
        id: id,
        description: description,
        discount: discount.toDomain(),
        imagePath: imagePath,
        isSpecial: isSpecial,
      );
}
