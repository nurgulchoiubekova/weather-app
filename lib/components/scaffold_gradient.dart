import 'package:flutter/material.dart';
import 'package:flutter_weather_app/theme/app_colors.dart';

class ScaffoldGradient extends StatelessWidget {
  const ScaffoldGradient({
    super.key,
    this.appBar,
    this.body,
  });

  final PreferredSizeWidget? appBar;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.2, 0.7],
          colors: [
            AppColors.whiteGradient,
            AppColors.orangeGradient,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBar,
        body: body,
      ),
    );
  }
}