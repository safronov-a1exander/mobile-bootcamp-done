import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_done/uikit/submit_form.dart';
import 'package:mobile_bootcamp_done/resources/app_images.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.chooseCity),
        centerTitle: true,
        leading: Icon(Icons.location_city_rounded),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(children: [
              Spacer(),
              Image.asset(AppImages.weatherIcon),
              SizedBox(
                height: 30,
              ),
              SubmitForm(),
              Spacer(),
            ]),
          ),
        ),
      ),
    );
  }
}
