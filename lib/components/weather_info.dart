import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_weather_app/theme/app_colors.dart';
import 'package:flutter_weather_app/theme/app_text_styles.dart';

class WeatherInfo extends StatelessWidget {
  const WeatherInfo({
    required this.iconPath,
    required this.title,
    required this.value,
    super.key,
  });

  final String iconPath;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsetsDirectional.symmetric(horizontal: 16, vertical: 5),
      color: AppColors.white.withOpacity(0.36),
      surfaceTintColor: AppColors.white.withOpacity(0.5),
      shadowColor: Colors.transparent,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 11, horizontal: 20),
        leading: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: SvgPicture.asset(
            iconPath,
            width: 31,
          ),
        ),
        title: Text(
          title,
          style: AppTextStyles.size15w400,
        ),
        trailing: Text(
          value,
          style: AppTextStyles.size15w400,
        ),
      ),
    );
  }
}