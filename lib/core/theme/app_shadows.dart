import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppShadows {
  static List<BoxShadow> get card => [
        BoxShadow(
          color: AppColors.primaryBlack.withValues(alpha: 0.3),
          blurRadius: 24,
          offset: const Offset(0, 8),
        ),
      ];

  static List<BoxShadow> get navbar => [
        BoxShadow(
          color: AppColors.primaryBlack.withValues(alpha: 0.2),
          blurRadius: 12,
          offset: const Offset(0, 4),
        ),
      ];

  static List<BoxShadow> get phone => [
        BoxShadow(
          color: AppColors.primaryBlack.withValues(alpha: 0.5),
          blurRadius: 40,
          offset: const Offset(0, 20),
        ),
      ];
}
