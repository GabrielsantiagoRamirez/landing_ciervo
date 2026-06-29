import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

abstract final class AppTypography {
  static TextStyle get fontFamily => GoogleFonts.plusJakartaSans();

  static TextStyle hero(BuildContext context, {required bool isMobile, required bool isTablet}) {
  final double size = isMobile ? 34 : (isTablet ? 48 : 64);
    return fontFamily.copyWith(
      fontSize: size,
      fontWeight: FontWeight.w700,
      color: AppColors.textPrimary,
      height: 1.15,
    );
  }

  static TextStyle sectionTitle(BuildContext context) => fontFamily.copyWith(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
        height: 1.2,
      );

  static TextStyle subtitle(BuildContext context) => fontFamily.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: AppColors.textPrimary,
        height: 1.3,
      );

  static TextStyle body(BuildContext context) => fontFamily.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: 1.6,
      );

  static TextStyle bodySmall(BuildContext context) => fontFamily.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.textSecondary,
        height: 1.5,
      );

  static TextStyle caption(BuildContext context) => fontFamily.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.textDisabled,
        height: 1.4,
      );

  static TextStyle button(BuildContext context) => fontFamily.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.2,
      );

  static TextStyle logo(BuildContext context) => fontFamily.copyWith(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppColors.gold,
        letterSpacing: 2,
      );
}
