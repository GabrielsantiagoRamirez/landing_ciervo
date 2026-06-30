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
    return Container(
      decoration: BoxDecoration(
        boxShadow: AppShadows.phone,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Container(
        width: 280,
        height: 560,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: AppColors.divider, width: 2),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: imagePath != null
              ? Image.asset(
                  imagePath!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => _placeholder(context),
                )
              : _placeholder(context),
        ),
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
