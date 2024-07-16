import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_weather_app/theme/app_text_styles.dart';

class DegreeWidget extends StatelessWidget {
  const DegreeWidget({
    required this.iconPath,
    required this.degree,
    required this.degreeStatus,
    super.key,
  });

  final String iconPath;
  final String degree;
  final String degreeStatus;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 2,
          child: SvgPicture.asset(iconPath, height: 230),
        ),
        Expanded(
          child: Column(
            children: [
              Badge(
                smallSize: 30,
                largeSize: 30,
                label: SvgPicture.asset(
                  'assets/icons/degree.svg',
                  width: 30,
                ),
                padding: const EdgeInsets.only(left: 30),
                backgroundColor: Colors.transparent,
                child: FittedBox(
                  child: Text(
                    degree,
                    style: AppTextStyles.size86w700,
                  ),
                ),
              ),
              FittedBox(
                child: Text(
                  degreeStatus,
                  style: AppTextStyles.size28w400,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 46),
      ],
    );
  }
}