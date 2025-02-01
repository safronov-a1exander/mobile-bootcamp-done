import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_bootcamp_done/common/api_client/api_client.dart';
import 'package:mobile_bootcamp_done/features/weather/data/datasources/local_city_datasource.dart';
import 'package:mobile_bootcamp_done/features/weather/data/datasources/weather_datasource.dart';
import 'package:mobile_bootcamp_done/features/weather/data/repositories/city_repository_impl.dart';
import 'package:mobile_bootcamp_done/features/weather/data/repositories/weather_repository_impl.dart';
import 'package:mobile_bootcamp_done/features/weather/domain/repositories/city_repository.dart';
import 'package:mobile_bootcamp_done/features/weather/domain/repositories/weather_repository.dart';
import 'package:mobile_bootcamp_done/features/weather/presentation/bloc/city/city_bloc.dart';
import 'package:mobile_bootcamp_done/features/weather/presentation/bloc/weather/weather_bloc.dart';
import 'package:mobile_bootcamp_done/features/weather/presentation/location_screen.dart';
import 'package:mobile_bootcamp_done/features/weather/presentation/weather_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile_bootcamp_done/uikit/theme/theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key, required apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<IWeatherRepository>(
            create: (context) => WeatherRepository(
                weatherDataSource: WeathertDataSource(client: _apiClient)),
          ),
          RepositoryProvider<ICityRepository>(
            create: (context) => CityRepository(
                cityDataSource:
                    LocalCityDataSource(storage: SharedPreferencesAsync())),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  CityBloc(cityRepository: context.read<ICityRepository>()),
            ),
            BlocProvider(
              create: (context) => WeatherBloc(
                  weatherRepository: context.read<IWeatherRepository>()),
            ),
          ],
          child: MaterialApp(
            title: 'Mobile-bootcamp-weather-app',
            theme: theme,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('en'),
              Locale('ru'),
            ],
            routes: {
              '/': (context) => const LocationScreen(),
              '/weather': (context) => WeatherScreen(),
            },
          ),
        ));
  }
}
