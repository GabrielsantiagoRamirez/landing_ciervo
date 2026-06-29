import 'package:flutter/material.dart';

import '../../core/constants/content_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../buttons/primary_button.dart';

class MembershipCard extends StatefulWidget {
  const MembershipCard({
    super.key,
    required this.name,
    required this.description,
    required this.benefits,
    this.onLearnMore,
    this.highlighted = false,
  });

  final String name;
  final String description;
  final List<String> benefits;
  final VoidCallback? onLearnMore;
  final bool highlighted;

  @override
  State<MembershipCard> createState() => _MembershipCardState();
}

class _MembershipCardState extends State<MembershipCard> {
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
          color: widget.highlighted ? AppColors.surface : AppColors.carbonBlack,
          borderRadius: BorderRadius.circular(AppRadius.card),
          border: Border.all(
            color: widget.highlighted || _hovered
                ? AppColors.gold.withValues(alpha: 0.5)
                : AppColors.divider,
            width: widget.highlighted ? 1.5 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.name,
              style: AppTypography.subtitle(context).copyWith(
                color: AppColors.gold,
              ),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(widget.description, style: AppTypography.bodySmall(context)),
            const SizedBox(height: AppSpacing.md),
            ...widget.benefits.map(
              (b) => Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.xs),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.check_circle_outline,
                        color: AppColors.gold, size: 18),
                    const SizedBox(width: AppSpacing.xs),
                    Expanded(
                      child: Text(b, style: AppTypography.bodySmall(context)),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            PrimaryButton(
              label: ContentConstants.learnPlan,
              onPressed: widget.onLearnMore,
            ),
          ],
        ),
      ),
    );
  }
}
