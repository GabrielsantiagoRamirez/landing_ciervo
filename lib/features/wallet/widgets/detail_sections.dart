import 'package:flutter/material.dart';

import '../../../core/constants/content_constants.dart';
import '../../../core/theme/app_breakpoints.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/layout/animated_section.dart';
import '../../../shared/layout/responsive_container.dart';
import '../../../shared/widgets/phone_mockup.dart';
import '../../../shared/widgets/section_title.dart';

class FeatureDetailSection extends StatelessWidget {
  const FeatureDetailSection({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    this.reversed = false,
    this.sectionKey,
  });

  final String title;
  final String description;
  final IconData icon;
  final bool reversed;
  final String? sectionKey;

  @override
  Widget build(BuildContext context) {
    final isMobile = AppBreakpoints.isMobile(context);

    final content = Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.gold, size: 40),
        const SizedBox(height: AppSpacing.md),
        Text(
          title,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: AppTypography.sectionTitle(context).copyWith(fontSize: 32),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          description,
          textAlign: isMobile ? TextAlign.center : TextAlign.start,
          style: AppTypography.body(context),
        ),
      ],
    );

    final mockup = const PhoneMockup();

    return ResponsiveContainer(
      child: AnimatedSection(
        child: isMobile
            ? Column(
                children: [
                  content,
                  const SizedBox(height: AppSpacing.xxl),
                  mockup,
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: reversed
                    ? [Expanded(child: mockup), const SizedBox(width: AppSpacing.xxxl), Expanded(child: content)]
                    : [Expanded(child: content), const SizedBox(width: AppSpacing.xxxl), Expanded(child: mockup)],
              ),
      ),
    );
  }
}

class WalletSection extends StatelessWidget {
  const WalletSection({super.key});
  @override
  Widget build(BuildContext context) => FeatureDetailSection(
        title: ContentConstants.walletTitle,
        description: ContentConstants.walletDescription,
        icon: Icons.account_balance_wallet_outlined,
      );
}

class DeliverySection extends StatelessWidget {
  const DeliverySection({super.key});
  @override
  Widget build(BuildContext context) => FeatureDetailSection(
        title: ContentConstants.deliveryTitle,
        description: ContentConstants.deliveryDescription,
        icon: Icons.delivery_dining_outlined,
        reversed: true,
      );
}

class EventsSection extends StatelessWidget {
  const EventsSection({super.key});
  @override
  Widget build(BuildContext context) => FeatureDetailSection(
        title: ContentConstants.eventsTitle,
        description: ContentConstants.eventsDescription,
        icon: Icons.event_outlined,
      );
}

class ReservationsSection extends StatelessWidget {
  const ReservationsSection({super.key});
  @override
  Widget build(BuildContext context) => FeatureDetailSection(
        title: ContentConstants.reservationsTitle,
        description: ContentConstants.reservationsDescription,
        icon: Icons.calendar_month_outlined,
        reversed: true,
      );
}

class PromotionsSection extends StatelessWidget {
  const PromotionsSection({super.key});
  @override
  Widget build(BuildContext context) => FeatureDetailSection(
        title: ContentConstants.promotionsTitle,
        description: ContentConstants.promotionsDescription,
        icon: Icons.local_offer_outlined,
      );
}

class FamilySection extends StatelessWidget {
  const FamilySection({super.key});
  @override
  Widget build(BuildContext context) => FeatureDetailSection(
        title: ContentConstants.familyTitle,
        description: ContentConstants.familyDescription,
        icon: Icons.family_restroom_outlined,
        reversed: true,
      );
}

class KidsSection extends StatelessWidget {
  const KidsSection({super.key});
  @override
  Widget build(BuildContext context) => FeatureDetailSection(
        title: ContentConstants.kidsTitle,
        description: ContentConstants.kidsDescription,
        icon: Icons.child_care_outlined,
      );
}

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppBreakpoints.isMobile(context);

    return ResponsiveContainer(
      child: AnimatedSection(
        child: Column(
          children: [
            SectionTitle(
              title: ContentConstants.howItWorksTitle,
              alignment: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xxl),
            ...ContentConstants.howItWorksSteps.asMap().entries.map((entry) {
              final index = entry.key;
              final step = entry.value;
              return Column(
                children: [
                  Container(
                    width: isMobile ? double.infinity : 400,
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    decoration: BoxDecoration(
                      color: AppColors.carbonBlack,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: AppColors.divider),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.gold.withValues(alpha: 0.15),
                          child: Text(
                            '${index + 1}',
                            style: AppTypography.subtitle(context).copyWith(
                              color: AppColors.gold,
                            ),
                          ),
                        ),
                        const SizedBox(width: AppSpacing.md),
                        Expanded(
                          child: Text(step, style: AppTypography.body(context)),
                        ),
                      ],
                    ),
                  ),
                  if (index < ContentConstants.howItWorksSteps.length - 1)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                      child: Icon(
                        Icons.arrow_downward,
                        color: AppColors.gold.withValues(alpha: 0.5),
                      ),
                    ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

class SecuritySection extends StatelessWidget {
  const SecuritySection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = AppBreakpoints.isMobile(context);

    return ResponsiveContainer(
      child: AnimatedSection(
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.xxl),
          decoration: BoxDecoration(
            color: AppColors.carbonBlack,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppColors.divider),
          ),
          child: Column(
            children: [
              Icon(Icons.shield_outlined, color: AppColors.gold, size: 48),
              const SizedBox(height: AppSpacing.md),
              SectionTitle(
                title: ContentConstants.securityTitle,
                alignment: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.md),
              Text(
                ContentConstants.securityDescription,
                textAlign: TextAlign.center,
                style: AppTypography.body(context).copyWith(
                  fontSize: isMobile ? 16 : 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
