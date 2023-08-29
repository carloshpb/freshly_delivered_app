import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/advertisement.dart';

part 'advertisement_dto.freezed.dart';

@freezed
class AdvertisementDto with _$AdvertisementDto {
  const AdvertisementDto._();

  const factory AdvertisementDto.empty() = EmptyAdvertisementDto;

  const factory AdvertisementDto.normal({
    @Default('') String id,
    @Default('') String description,
    @Default('') String imagePath,
    @Default(false) bool isSpecial,
    @Default(0) int discount,
  }) = NormalAdvertisementDto;

  factory AdvertisementDto.fromDomain(Advertisement domain) => switch (domain) {
        NormalAdvertisement() => NormalAdvertisementDto(
            id: domain.id,
            description: domain.description,
            discount: domain.discount,
            imagePath: domain.imagePath,
            isSpecial: domain.isSpecial,
          ),
        _ => const EmptyAdvertisementDto(),
      };

  Advertisement toDomain() {
    return switch (this) {
      NormalAdvertisementDto() => NormalAdvertisement(
          id: (this as NormalAdvertisementDto).id,
          description: (this as NormalAdvertisementDto).description,
          discount: (this as NormalAdvertisementDto).discount,
          imagePath: (this as NormalAdvertisementDto).imagePath,
          isSpecial: (this as NormalAdvertisementDto).isSpecial,
        ),
      _ => const EmptyAdvertisement(),
    };
  }
}
