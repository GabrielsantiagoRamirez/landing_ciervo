import 'package:flutter/material.dart';

import '../../../core/constants/content_constants.dart';
import '../../../core/theme/app_breakpoints.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/buttons/download_badge.dart';
import '../../../shared/buttons/primary_button.dart';
import '../../../shared/cards/membership_card.dart';
import '../../../shared/layout/animated_section.dart';
import '../../../shared/layout/responsive_container.dart';
import '../../../shared/widgets/section_title.dart';

class MembershipsSection extends StatelessWidget {
  const MembershipsSection({
    super.key,
    required this.onPlanSelected,
  });

  final void Function(MembershipItem plan) onPlanSelected;

  @override
  Widget build(BuildContext context) {
    final isMobile = AppBreakpoints.isMobile(context);
    final crossCount = isMobile ? 1 : (AppBreakpoints.isTablet(context) ? 2 : 4);

    return ResponsiveContainer(
      child: AnimatedSection(
        child: Column(
          children: [
            SectionTitle(
              title: ContentConstants.membershipsTitle,
              alignment: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.sm),
            SectionSubtitle(
              subtitle: ContentConstants.membershipsSubtitle,
              alignment: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xxl),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossCount,
                crossAxisSpacing: AppSpacing.md,
                mainAxisSpacing: AppSpacing.md,
                childAspectRatio: isMobile ? 0.75 : 0.65,
              ),
              itemCount: ContentConstants.memberships.length,
              itemBuilder: (context, index) {
                final plan = ContentConstants.memberships[index];
                return MembershipCard(
                  name: plan.name,
                  description: plan.description,
                  benefits: plan.benefits,
                  highlighted: plan.name == 'GOLD',
                  onLearnMore: () => onPlanSelected(plan),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BusinessSection extends StatelessWidget {
  const BusinessSection({
    super.key,
    required this.onRegisterBusiness,
  });

  final VoidCallback onRegisterBusiness;

  @override
  Widget build(BuildContext context) {
    final isMobile = AppBreakpoints.isMobile(context);
    final crossCount = isMobile ? 2 : 4;

    return ResponsiveContainer(
      child: AnimatedSection(
        child: Column(
          children: [
            SectionTitle(
              title: ContentConstants.businessBenefitsTitle,
              alignment: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.sm),
            SectionSubtitle(
              subtitle: ContentConstants.registerBusinessSubtitle,
              alignment: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xxl),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossCount,
                crossAxisSpacing: AppSpacing.md,
                mainAxisSpacing: AppSpacing.md,
                childAspectRatio: isMobile ? 1.5 : 2.0,
              ),
              itemCount: ContentConstants.businessBenefits.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  decoration: BoxDecoration(
                    color: AppColors.carbonBlack,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppColors.divider),
                  ),
                  child: Center(
                    child: Text(
                      ContentConstants.businessBenefits[index],
                      textAlign: TextAlign.center,
                      style: AppTypography.bodySmall(context),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: AppSpacing.xl),
            Center(
              child: PrimaryButton(
                label: ContentConstants.registerBusinessButton,
                onPressed: onRegisterBusiness,
                tooltip: 'Ir a registro de negocio',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DownloadSection extends StatelessWidget {
  const DownloadSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      child: AnimatedSection(
        child: Column(
          children: [
            SectionTitle(
              title: ContentConstants.downloadTitle,
              alignment: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.sm),
            SectionSubtitle(
              subtitle: ContentConstants.downloadMembershipCta,
              alignment: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xl),
            Wrap(
              spacing: AppSpacing.md,
              runSpacing: AppSpacing.md,
              alignment: WrapAlignment.center,
              children: const [
                DownloadBadge(store: DownloadStore.googlePlay),
                DownloadBadge(store: DownloadStore.appStore),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
