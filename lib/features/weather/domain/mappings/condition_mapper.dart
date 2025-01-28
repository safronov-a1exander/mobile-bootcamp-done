import 'package:mobile_bootcamp_done/features/weather/data/entities/condition_dto.dart';
import 'package:mobile_bootcamp_done/features/weather/domain/entities/condition_model.dart';

extension ConditionDTOToModelMapper on ConditionDTO {
  ConditionModel toModel() {
    return ConditionModel(
      text: text,
      icon: icon,
    );
  }
}
