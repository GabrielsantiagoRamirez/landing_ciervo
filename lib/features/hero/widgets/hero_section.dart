import 'package:flutter/material.dart';

import '../../../core/constants/content_constants.dart';
import '../../../core/theme/app_breakpoints.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/buttons/primary_button.dart';
import '../../../shared/buttons/secondary_button.dart';
import '../../../shared/layout/animated_section.dart';
import '../../../shared/layout/hero_background.dart';
import '../../../shared/layout/responsive_container.dart';
import '../../../shared/widgets/phone_mockup.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.onDownload,
    required this.onExplore,
  });

  final VoidCallback onDownload;
  final VoidCallback onExplore;

  @override
  Widget build(BuildContext context) {
    final isMobile = AppBreakpoints.isMobile(context);
    final isTablet = AppBreakpoints.isTablet(context);

    return HeroBackground(
      child: ResponsiveContainer(
        verticalPadding: isMobile ? 100 : 120,
        child: isMobile || isTablet
            ? Column(
                children: [
                  _buildContent(context, isMobile, isTablet),
                  const SizedBox(height: AppSpacing.xxl),
                  const PhoneMockup(),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(child: _buildContent(context, isMobile, isTablet)),
                  const SizedBox(width: AppSpacing.xxxl),
                  const PhoneMockup(),
                ],
              ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, bool isMobile, bool isTablet) {
    return AnimatedSection(
      child: Column(
        crossAxisAlignment:
            isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Text(
            ContentConstants.heroTitle,
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
            style: AppTypography.hero(
              context,
              isMobile: isMobile,
              isTablet: isTablet,
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            ContentConstants.heroSubtitle,
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
            style: AppTypography.body(context).copyWith(
              fontSize: isMobile ? 16 : 18,
            ),
          ),
          const SizedBox(height: AppSpacing.xl),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
            children: [
              PrimaryButton(
                label: ContentConstants.heroPrimaryCta,
                onPressed: onDownload,
              ),
              SecondaryButton(
                label: ContentConstants.heroSecondaryCta,
                onPressed: onExplore,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
