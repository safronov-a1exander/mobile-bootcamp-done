import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_done/features/weather/presentation/widgets/additional_info_widget.dart';
import 'package:mobile_bootcamp_done/features/weather/presentation/widgets/current_weather_widget.dart';
import 'package:mobile_bootcamp_done/features/weather/presentation/widgets/sun_and_moon_widget.dart';
import 'package:mobile_bootcamp_done/features/weather/presentation/widgets/weather_by_days_widget.dart';
import 'package:mobile_bootcamp_done/features/weather/presentation/widgets/weather_by_time_widget.dart';
import 'package:mobile_bootcamp_done/uikit/theme/app_colors.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.blue,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              spacing: 20,
              children: [
                CurrentWeatherWidget(),
                WeatherByTimeWidget(),
                WeatherByDaysWidget(),
                AdditionalInfoWidget(),
                SunAndMoonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
