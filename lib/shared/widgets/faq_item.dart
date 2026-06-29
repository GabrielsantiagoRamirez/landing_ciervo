import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';

class FAQItem extends StatefulWidget {
  const FAQItem({
    super.key,
    required this.question,
    required this.answer,
    this.initiallyExpanded = false,
  });

  final String question;
  final String answer;
  final bool initiallyExpanded;

  @override
  State<FAQItem> createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  late bool _expanded;

  @override
  void initState() {
    super.initState();
    _expanded = widget.initiallyExpanded;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.carbonBlack,
        borderRadius: BorderRadius.circular(AppRadius.card),
        border: Border.all(color: AppColors.divider),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          initiallyExpanded: widget.initiallyExpanded,
          onExpansionChanged: (v) => setState(() => _expanded = v),
          tilePadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.lg,
            vertical: AppSpacing.xs,
          ),
          childrenPadding: const EdgeInsets.fromLTRB(
            AppSpacing.lg,
            0,
            AppSpacing.lg,
            AppSpacing.lg,
          ),
          iconColor: AppColors.gold,
          collapsedIconColor: AppColors.textSecondary,
          title: Text(
            widget.question,
            style: AppTypography.subtitle(context).copyWith(fontSize: 18),
          ),
          children: [
            AnimatedOpacity(
              opacity: _expanded ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: Text(
                widget.answer,
                style: AppTypography.bodySmall(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
