import 'package:mobile_bootcamp_done/features/weather/data/entities/astro_dto.dart';
import 'package:mobile_bootcamp_done/features/weather/domain/entities/astro_model.dart';

extension AstroDTOToModelMapper on AstroDTO {
  AstroModel toModel() {
    return AstroModel(
      sunrise: sunrise,
      sunset: sunset,
      moonrise: moonrise,
      moonset: moonset,
    );
  }
}
