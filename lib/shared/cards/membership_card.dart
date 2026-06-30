import 'package:flutter/material.dart';

import '../../core/constants/content_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../widgets/ciervo_bullet_icon.dart';
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
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.md,
          AppSpacing.md,
          AppSpacing.md,
          AppSpacing.sm,
        ),
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _CardHeader(
              name: widget.name,
              description: widget.description,
            ),
            const SizedBox(height: AppSpacing.sm),
            ...widget.benefits.map(_BenefitRow.new),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: AppSpacing.sm),
              child: Divider(height: 1, color: AppColors.divider),
            ),
            PrimaryButton(
              label: ContentConstants.learnPlan,
              onPressed: widget.onLearnMore,
              isExpanded: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _CardHeader extends StatelessWidget {
  const _CardHeader({
    required this.name,
    required this.description,
  });

  final String name;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerLeft,
          child: Text(
            name,
            maxLines: 1,
            style: AppTypography.subtitle(context).copyWith(
              color: AppColors.gold,
              letterSpacing: 0.5,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          description,
          maxLines: 3,
          style: AppTypography.bodySmall(context).copyWith(
            height: 1.45,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}

class _BenefitRow extends StatelessWidget {
  const _BenefitRow(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CiervoBulletIcon(size: 22),
          const SizedBox(width: AppSpacing.xs),
          Expanded(
            child: Text(
              label,
              style: AppTypography.bodySmall(context).copyWith(height: 1.35),
            ),
          ),
        ],
      ),
    );
  }
}
