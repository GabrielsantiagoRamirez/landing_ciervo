import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/url_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';

class LegalInternalLinks extends StatelessWidget {
  const LegalInternalLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Enlaces relacionados',
            style: AppTypography.subtitle(context).copyWith(fontSize: 20),
          ),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.md,
            runSpacing: AppSpacing.sm,
            children: [
              _LegalRouteLink(
                label: 'Página de Soporte',
                path: UrlConstants.support,
              ),
              _LegalRouteLink(
                label: 'Eliminar Cuenta',
                path: UrlConstants.deleteAccount,
              ),
              _LegalRouteLink(
                label: 'Términos y Condiciones',
                path: UrlConstants.terms,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _LegalRouteLink extends StatelessWidget {
  const _LegalRouteLink({
    required this.label,
    required this.path,
  });

  final String label;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: label,
      button: true,
      link: true,
      child: TextButton(
        onPressed: () => context.go(path),
        style: TextButton.styleFrom(
          foregroundColor: AppColors.gold,
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          label,
          style: AppTypography.bodySmall(context).copyWith(
            color: AppColors.gold,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.gold.withValues(alpha: 0.6),
          ),
        ),
      ),
    );
  }
}
