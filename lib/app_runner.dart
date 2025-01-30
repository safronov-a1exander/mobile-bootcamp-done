import 'dart:async';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_done/app/app.dart';
import 'package:mobile_bootcamp_done/common/api_client/api_client.dart';
import 'package:mobile_bootcamp_done/common/api_client/weather_api_interceptor.dart';
import 'package:mobile_bootcamp_done/env/env.dart';

void runWeatherApp() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    final Dio dio = Dio();
    dio.interceptors.add(WeatherApiInterceptor());
    final ApiClient apiClient = ApiClient(dio, baseUrl: Env.baseurl);
    runApp(WeatherApp(
      apiClient: apiClient,
    ));
  }, (exception, stackTrace) async {
    log(exception.toString() + stackTrace.toString());
  });
}
