import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mobile_bootcamp_done/features/weather/presentation/bloc/weather/weather_bloc.dart';
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
    return Scaffold(
      backgroundColor: AppColors.blue,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: BlocBuilder<WeatherBloc, WeatherState>(
              buildWhen: (previous, current) => (previous is WeatherInitialState),
              builder: (context, state) {
                switch (state) {
                  case (WeatherLoadingState()):
                    return CircularProgressIndicator(
                      color: AppColors.white1,
                    );
                  case (WeatherFailureState()):
                    return Column(
                      children: [
                        Text(AppLocalizations.of(context)!.failedToFetchData),
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: Icon(
                            Icons.error_outline,
                            color: AppColors.white1,
                          ),
                        )
                      ],
                    );
                  case (WeatherSuccessState()):
                    return Column(
                      spacing: 20,
                      children: [
                        CurrentWeatherWidget(weatherModel: state.weather),
                        WeatherByTimeWidget(),
                        WeatherByDaysWidget(),
                        AdditionalInfoWidget(),
                        SunAndMoonWidget(),
                      ],
                    );
                  default:
                    return Placeholder();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
