import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../widgets/ciervo_logo.dart';

class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.carbonBlack,
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(color: AppColors.divider),
      ),
      child: Center(child: child),
    );
  }
}

class LegalPageLayout extends StatelessWidget {
  const LegalPageLayout({
    super.key,
    required this.title,
    required this.children,
    this.onBack,
  });

  final String title;
  final List<Widget> children;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlack,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.xxxl,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CiervoLogo(
                      size: CiervoLogoSize.compact,
                      onTap: onBack,
                      tooltip: 'Ir al inicio',
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  if (onBack != null)
                    TextButton.icon(
                      onPressed: onBack,
                      icon: const Icon(Icons.arrow_back, color: AppColors.gold),
                      label: Text(
                        'Volver al inicio',
                        style: AppTypography.bodySmall(context).copyWith(
                          color: AppColors.gold,
                        ),
                      ),
                    ),
                  const SizedBox(height: AppSpacing.lg),
                  Semantics(
                    header: true,
                    child: Text(title, style: AppTypography.sectionTitle(context)),
                  ),
                  const SizedBox(height: AppSpacing.xl),
                  ...children,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LegalSection extends StatelessWidget {
  const LegalSection({
    super.key,
    required this.heading,
    required this.body,
  });

  final String heading;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            heading,
            style: AppTypography.subtitle(context).copyWith(fontSize: 20),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(body, style: AppTypography.bodySmall(context)),
        ],
      ),
    );
  }
}
