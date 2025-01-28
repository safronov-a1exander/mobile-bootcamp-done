import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_done/features/weather/presentation/widgets/detail_info_by_weather_data.dart';
import 'package:mobile_bootcamp_done/uikit/theme/app_colors.dart';

class WeatherByTimeWidget extends StatelessWidget {
  const WeatherByTimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.blueWithOpacity,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: DetailInfoByWeatherData(),
        ),
      ),
    );
  }
}
