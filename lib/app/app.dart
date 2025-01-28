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
import 'package:shared_preferences/shared_preferences.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key, required apiClient}) : _apiClient = apiClient;

  final ApiClient _apiClient;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => WeatherRepository(
              weatherDataSource: WeathertDataSource(client: _apiClient)),
        ),
        RepositoryProvider(
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
          title: 'Flutter Demo', //TODO: Change the title
          home: const Scaffold(),
        ),
      ),
    );
  }
}
