import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';

class FooterColumn extends StatelessWidget {
  const FooterColumn({
    super.key,
    required this.title,
    required this.children,
  });

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.subtitle(context).copyWith(fontSize: 16),
        ),
        const SizedBox(height: AppSpacing.md),
        ...children,
      ],
    );
  }
}

class FooterLink extends StatefulWidget {
  const FooterLink({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  State<FooterLink> createState() => _FooterLinkState();
}

class _FooterLinkState extends State<FooterLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Padding(
        padding: const EdgeInsets.only(bottom: AppSpacing.xs),
        child: InkWell(
          onTap: widget.onTap,
          child: Text(
            widget.label,
            style: AppTypography.bodySmall(context).copyWith(
              color: _hovered ? AppColors.gold : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
