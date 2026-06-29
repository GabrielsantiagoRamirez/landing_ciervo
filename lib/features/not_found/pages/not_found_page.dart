import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/services/seo_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/buttons/primary_button.dart';
import '../../../shared/widgets/ciervo_logo.dart';

class NotFoundPage extends StatefulWidget {
  const NotFoundPage({super.key});

  @override
  State<NotFoundPage> createState() => _NotFoundPageState();
}

class _NotFoundPageState extends State<NotFoundPage> {
  @override
  void initState() {
    super.initState();
    SeoService.updateNotFound();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlack,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CiervoLogo(
                size: CiervoLogoSize.standard,
                onTap: () => context.go('/'),
                tooltip: 'Ir al inicio',
              ),
              const SizedBox(height: AppSpacing.xl),
              Text(
                '404',
                style: AppTypography.hero(
                  context,
                  isMobile: true,
                  isTablet: false,
                ).copyWith(color: AppColors.gold),
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                'Página no encontrada',
                style: AppTypography.sectionTitle(context),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'La página que buscas no existe o fue movida.',
                textAlign: TextAlign.center,
                style: AppTypography.body(context),
              ),
              const SizedBox(height: AppSpacing.xl),
              PrimaryButton(
                label: 'Volver al inicio',
                onPressed: () => context.go('/'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
