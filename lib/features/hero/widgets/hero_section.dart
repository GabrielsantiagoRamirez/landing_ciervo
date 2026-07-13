import 'package:flutter/material.dart';

import '../../../core/constants/content_constants.dart';
import '../../../core/services/landing_actions.dart';
import '../../../core/theme/app_breakpoints.dart';
import '../../../core/theme/app_colors.dart';
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
          const SizedBox(height: AppSpacing.md),
          _MerchantLoginLink(centered: isMobile),
        ],
      ),
    );
  }
}

class _MerchantLoginLink extends StatefulWidget {
  const _MerchantLoginLink({required this.centered});

  final bool centered;

  @override
  State<_MerchantLoginLink> createState() => _MerchantLoginLinkState();
}

class _MerchantLoginLinkState extends State<_MerchantLoginLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.centered ? Alignment.center : Alignment.centerLeft,
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => LandingActions.openBusinessPanel(context),
          child: Text(
            ContentConstants.merchantLoginCta,
            textAlign: widget.centered ? TextAlign.center : TextAlign.start,
            style: AppTypography.bodySmall(context).copyWith(
              fontSize: 14,
              color: _hovered ? AppColors.gold : AppColors.textSecondary,
              decoration: TextDecoration.underline,
              decorationColor:
                  _hovered ? AppColors.gold : AppColors.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}
