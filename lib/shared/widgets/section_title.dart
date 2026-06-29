import 'package:flutter/material.dart';

import '../../core/theme/app_breakpoints.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.title, this.alignment});

  final String title;
  final TextAlign? alignment;

  @override
  Widget build(BuildContext context) {
    final isMobile = AppBreakpoints.isMobile(context);
    return Text(
      title,
      textAlign: alignment ?? (isMobile ? TextAlign.center : TextAlign.start),
      style: AppTypography.sectionTitle(context).copyWith(
        fontSize: isMobile ? 28 : 40,
      ),
    );
  }
}

class SectionSubtitle extends StatelessWidget {
  const SectionSubtitle({
    super.key,
    required this.subtitle,
    this.alignment,
  });

  final String subtitle;
  final TextAlign? alignment;

  @override
  Widget build(BuildContext context) {
    final isMobile = AppBreakpoints.isMobile(context);
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.sm),
      child: Text(
        subtitle,
        textAlign: alignment ?? (isMobile ? TextAlign.center : TextAlign.start),
        style: AppTypography.body(context).copyWith(
          fontSize: isMobile ? 16 : 18,
        ),
      ),
    );
  }
}
