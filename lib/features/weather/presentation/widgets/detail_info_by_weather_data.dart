import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_done/features/weather/presentation/widgets/small_info_widget.dart';

class DetailInfoByWeatherData extends StatelessWidget {
  const DetailInfoByWeatherData({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: hourlyWeatherData.length,
      itemBuilder: (context, index) {
        final data = hourlyWeatherData[index];
        return SmallInfoWidget(
          label: data['time'],
          icon: data['icon'],
          subtitle1: data['humidity'],
          subtitle2: data['temp'],
        );
      },
    );
  }
}

// Example Data
final List<Map<String, dynamic>> hourlyWeatherData = [
  {
    'time': '00:00',
    'icon': Icons.nights_stay,
    'humidity': '76%',
    'temp': '9°',
  },
  {
    'time': '01:00',
    'icon': Icons.cloud,
    'humidity': '78%',
    'temp': '8°',
  },
  {
    'time': '02:00',
    'icon': Icons.nights_stay,
    'humidity': '80%',
    'temp': '8°',
  },
  {
    'time': '03:00',
    'icon': Icons.cloud,
    'humidity': '82%',
    'temp': '8°',
  },
  {
    'time': '04:00',
    'icon': Icons.nights_stay,
    'humidity': '80%',
    'temp': '8°',
  },
  {
    'time': '05:00',
    'icon': Icons.nights_stay,
    'humidity': '80%',
    'temp': '8°',
  },
  {
    'time': '06:00',
    'icon': Icons.nights_stay,
    'humidity': '80%',
    'temp': '8°',
  },
  {
    'time': '07:00',
    'icon': Icons.nights_stay,
    'humidity': '80%',
    'temp': '8°',
  },
];
