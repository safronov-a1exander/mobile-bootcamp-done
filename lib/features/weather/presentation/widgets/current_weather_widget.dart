import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_done/uikit/theme/app_colors.dart';

class CurrentWeatherWidget extends StatelessWidget {
  const CurrentWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Icon(
                Icons.settings,
                color: AppColors.black2,
              ),
              Text("London", style: Theme.of(context).textTheme.headlineSmall),
              const Icon(Icons.add, color: AppColors.black2),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            "Thu, 18 February",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.wb_sunny,
                size: 50,
                color: Colors.yellow,
              ),
              Text(
                "9°",
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.w300, color: AppColors.white1),
              )
            ],
          ),
          const SizedBox(height: 4),
          Center(
            child: Text("6°/10° Feels like 5°",
                style: Theme.of(context).textTheme.bodyMedium),
          ),
          const SizedBox(height: 4),
          Center(
            child: Text("Partly cloudy",
                style: Theme.of(context).textTheme.bodyMedium),
          ),
          const SizedBox(height: 20),
          Text(
            "Updated 18/02 13:15",
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
