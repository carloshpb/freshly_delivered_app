import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/advertisement.dart';

part 'advertisement_dto.freezed.dart';

@freezed
class AdvertisementDto with _$AdvertisementDto {
  const AdvertisementDto._();

  const factory AdvertisementDto({
    required int id,
    required String description,
    required String image,
  }) = _AdvertisementDto;

  Advertisement toModel() {
    return Advertisement(
      id: id,
      description: description,
      image: image,
    );
  }
}
