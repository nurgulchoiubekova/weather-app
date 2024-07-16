import 'package:flutter/material.dart';
import 'package:flutter_weather_app/theme/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  const AppTextStyles._();

  static final size22w500 = GoogleFonts.inter(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryText,
  );

  static final size40w500 = GoogleFonts.inter(
    fontSize: 40,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryText,
    height: 1.3,
  );

  static final size18w400 = GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.secondaryText,
  );

  static final size86w700 = GoogleFonts.inter(
    fontSize: 86,
    fontWeight: FontWeight.w700,
    color: AppColors.tertiaryText,
    height: 0.9,
  );

  static final size28w400 = GoogleFonts.inter(
    fontSize: 28,
    fontWeight: FontWeight.w400,
    color: AppColors.tertiaryText,
  );

  static final size15w400 = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: AppColors.tertiaryText,
  );

  static final size16w700 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.primaryText,
  );

  static final size16w400 = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.tertiaryText,
  );

  static final size14w400 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.tertiaryText,
  );

  static final size14w700 = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.tertiaryText,
  );
}