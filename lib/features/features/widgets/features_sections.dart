import 'package:flutter/material.dart';

import '../../../core/constants/content_constants.dart';
import '../../../core/theme/app_breakpoints.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../shared/cards/feature_card.dart';
import '../../../shared/layout/animated_section.dart';
import '../../../shared/layout/responsive_container.dart';
import '../../../shared/widgets/animated_counter.dart';
import '../../../shared/widgets/section_title.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppBreakpoints.isMobile(context);
    final crossCount = isMobile ? 2 : 4;

    return ResponsiveContainer(
      child: AnimatedSection(
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossCount,
            crossAxisSpacing: AppSpacing.md,
            mainAxisSpacing: AppSpacing.md,
            childAspectRatio: isMobile ? 1.1 : 1.4,
          ),
          itemCount: ContentConstants.stats.length,
          itemBuilder: (context, index) {
            final stat = ContentConstants.stats[index];
            return Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.divider),
              ),
              child: Center(
                child: AnimatedCounter(
                  value: stat.value,
                  prefix: stat.prefix,
                  label: stat.label,
                  isText: stat.isText,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppBreakpoints.isMobile(context);

    return ResponsiveContainer(
      child: AnimatedSection(
        child: Column(
          children: [
            SectionTitle(
              title: ContentConstants.aboutTitle,
              alignment: isMobile ? TextAlign.center : TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(
              ContentConstants.aboutDescription,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

class FeaturesGridSection extends StatelessWidget {
  const FeaturesGridSection({
    super.key,
    required this.onLearnMore,
  });

  final void Function(String sectionKey) onLearnMore;

  @override
  Widget build(BuildContext context) {
    final isMobile = AppBreakpoints.isMobile(context);
    final crossCount = isMobile ? 1 : (AppBreakpoints.isTablet(context) ? 2 : 3);

    final features = [
      (Icons.account_balance_wallet_outlined, ContentConstants.walletTitle,
          ContentConstants.walletDescription, 'wallet'),
      (Icons.delivery_dining_outlined, ContentConstants.deliveryTitle,
          ContentConstants.deliveryDescription, 'delivery'),
      (Icons.event_outlined, ContentConstants.eventsTitle,
          ContentConstants.eventsDescription, 'events'),
      (Icons.calendar_month_outlined, ContentConstants.reservationsTitle,
          ContentConstants.reservationsDescription, 'reservations'),
      (Icons.local_offer_outlined, ContentConstants.promotionsTitle,
          ContentConstants.promotionsDescription, 'promotions'),
      (Icons.family_restroom_outlined, ContentConstants.familyTitle,
          ContentConstants.familyDescription, 'family'),
      (Icons.child_care_outlined, ContentConstants.kidsTitle,
          ContentConstants.kidsDescription, 'kids'),
      (Icons.storefront_outlined, ContentConstants.businessTitle,
          ContentConstants.businessDescription, 'business'),
    ];

    return ResponsiveContainer(
      child: AnimatedSection(
        child: Column(
          children: [
            SectionTitle(
              title: ContentConstants.featuresSectionTitle,
              alignment: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.sm),
            SectionSubtitle(
              subtitle: ContentConstants.featuresSectionSubtitle,
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
                childAspectRatio: isMobile ? 0.85 : 0.9,
              ),
              itemCount: features.length,
              itemBuilder: (context, index) {
                final f = features[index];
                return FeatureCard(
                  icon: f.$1,
                  title: f.$2,
                  description: f.$3,
                  onLearnMore: () => onLearnMore(f.$4),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
