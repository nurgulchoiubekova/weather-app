import 'package:flutter/material.dart';
import 'package:flutter_weather_app/theme/app_text_styles.dart';

class PlaceAndDateWidget extends StatelessWidget {
  const PlaceAndDateWidget({
    required this.cityName,
    required this.countryName,
    required this.date,
    super.key,
  });

  final String cityName;
  final String countryName;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 18),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '$cityName,\n$countryName',
            style: AppTextStyles.size40w500,
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            date,
            style: AppTextStyles.size18w400,
          ),
        )
      ],
    );
  }
}