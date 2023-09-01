import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/advertisement.dart';

part 'advertisement_dto.freezed.dart';

@freezed
class AdvertisementDto with _$AdvertisementDto {
  const AdvertisementDto._();

  const factory AdvertisementDto({
    @Default('') String id,
    @Default('') String description,
    @Default('') String imagePath,
    @Default(false) bool isSpecial,
    @Default(0) int discount,
  }) = _AdvertisementDto;

  factory AdvertisementDto.fromDomain(Advertisement domain) => AdvertisementDto(
        id: domain.id,
        description: domain.description,
        discount: domain.discount,
        imagePath: domain.imagePath,
        isSpecial: domain.isSpecial,
      );

  Advertisement toDomain() => Advertisement(
        id: id,
        description: description,
        discount: discount,
        imagePath: imagePath,
        isSpecial: isSpecial,
      );
}
