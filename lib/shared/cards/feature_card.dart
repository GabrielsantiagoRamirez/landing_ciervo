import 'package:flutter/material.dart';

import '../../core/constants/content_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_shadows.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../buttons/secondary_button.dart';

class FeatureCard extends StatefulWidget {
  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
    this.onLearnMore,
  });

  final IconData icon;
  final String title;
  final String description;
  final VoidCallback? onLearnMore;

  @override
  State<FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<FeatureCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, _hovered ? -4.0 : 0.0, 0),
        padding: const EdgeInsets.all(AppSpacing.lg),
        decoration: BoxDecoration(
          color: AppColors.carbonBlack,
          borderRadius: BorderRadius.circular(AppRadius.card),
          border: Border.all(
            color: _hovered ? AppColors.gold.withValues(alpha: 0.3) : AppColors.divider,
          ),
          boxShadow: _hovered ? AppShadows.card : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(AppSpacing.sm),
              decoration: BoxDecoration(
                color: AppColors.gold.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppRadius.button),
              ),
              child: Icon(widget.icon, color: AppColors.gold, size: 28),
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              widget.title,
              style: AppTypography.subtitle(context).copyWith(fontSize: 20),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              widget.description,
              style: AppTypography.bodySmall(context),
            ),
            if (widget.onLearnMore != null) ...[
              const SizedBox(height: AppSpacing.md),
              SecondaryButton(
                label: ContentConstants.learnMore,
                onPressed: widget.onLearnMore,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
