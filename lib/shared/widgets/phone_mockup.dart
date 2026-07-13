import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_shadows.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';

class PhoneMockup extends StatelessWidget {
  const PhoneMockup({
    super.key,
    this.imagePath,
    this.label = 'Ciervo Club',
  });

  final String? imagePath;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      height: 560,
      child: ClipRRect(
        child: imagePath != null
            ? Image.asset(
                imagePath!,
                fit: BoxFit.contain,
              )
            : _placeholder(context),
      ),
    );
  }

  Widget _placeholder(BuildContext context) {
    return Container(
      color: AppColors.carbonBlack,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.smartphone,
            size: 64,
            color: AppColors.gold.withValues(alpha: 0.4),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            label,
            style: AppTypography.caption(context).copyWith(
              color: AppColors.textDisabled,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            'Mockup placeholder',
            style: AppTypography.caption(context).copyWith(
              fontSize: 11,
              color: AppColors.textDisabled.withValues(alpha: 0.6),
            ),
          ),
        ],
      ),
    );
  }
}
