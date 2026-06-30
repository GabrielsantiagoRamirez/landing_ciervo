import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';
import '../../core/theme/app_colors.dart';

/// Viñeta con la cabeza del ciervo (recorte del logo transparente).
class CiervoBulletIcon extends StatelessWidget {
  const CiervoBulletIcon({
    super.key,
    this.size = 24,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: AppConstants.logoName,
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.gold.withValues(alpha: 0.14),
          borderRadius: BorderRadius.circular(size * 0.22),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(size * 0.18),
          child: SizedBox(
            width: size * 0.72,
            height: size * 0.72,
            child: OverflowBox(
              alignment: Alignment.topCenter,
              maxHeight: size * 2.4,
              child: Image.asset(
                AppConstants.logoPath,
                width: size * 1.8,
                height: size * 1.8,
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
                filterQuality: FilterQuality.high,
                semanticLabel: AppConstants.logoName,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.pets,
                  size: size * 0.55,
                  color: AppColors.gold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
