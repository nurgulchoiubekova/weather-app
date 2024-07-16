import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_weather_app/theme/app_colors.dart';
import 'package:flutter_weather_app/theme/app_text_styles.dart';

class WeatherTab extends StatelessWidget {
  const WeatherTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 1,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TabBar(
              labelStyle: AppTextStyles.size16w700,
              unselectedLabelStyle: AppTextStyles.size16w400,
              indicatorColor: AppColors.primaryText,
              tabs: const [
                Tab(text: 'Today'),
                Tab(text: 'Tomorrow'),
                Tab(text: 'Next 7 Days'),
              ],
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: 24,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 110,
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    color: AppColors.white.withOpacity(0.76),
                    surfaceTintColor: AppColors.white.withOpacity(0.5),
                    shadowColor: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '13:00',
                              style: AppTextStyles.size14w400,
                            ),
                            const SizedBox(height: 3),
                            SvgPicture.asset(
                              'assets/weather/rainy.svg',
                              height: 40,
                            ),
                            Text(
                              '19 °',
                              style: AppTextStyles.size14w700,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}