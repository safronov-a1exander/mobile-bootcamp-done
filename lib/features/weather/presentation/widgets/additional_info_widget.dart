import 'package:flutter/material.dart';
import 'package:mobile_bootcamp_done/features/weather/presentation/widgets/row_info_widget.dart';
import 'package:mobile_bootcamp_done/uikit/theme/app_colors.dart';

class AdditionalInfoWidget extends StatelessWidget {
  const AdditionalInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.blueWithOpacity,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          physics: NeverScrollableScrollPhysics(),
          itemCount: 1,
          itemBuilder: (context, index) {
            return RowInfoWidget(
              title: 'Humiddity',
              iconData: Icons.abc,
              value: 'fff',
            );
          },
        ),
      ),
    );
  }
}
