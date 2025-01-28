import 'package:mobile_bootcamp_done/features/weather/data/entities/location_dto.dart';
import 'package:mobile_bootcamp_done/features/weather/domain/entities/location_model.dart';

extension LocationDTOToModelMapper on LocationDTO {
  LocationModel toModel() {
    return LocationModel(
      name: name,
      region: region,
      country: country,
    );
  }
}
