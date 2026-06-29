import 'package:flutter/material.dart';

import '../../../core/constants/content_constants.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../shared/layout/animated_section.dart';
import '../../../shared/layout/responsive_container.dart';
import '../../../shared/widgets/faq_item.dart';
import '../../../shared/widgets/section_title.dart';

class FaqSection extends StatelessWidget {
  const FaqSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      child: AnimatedSection(
        child: Column(
          children: [
            SectionTitle(
              title: ContentConstants.faqTitle,
              alignment: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xxl),
            ...ContentConstants.faqItems.map(
              (item) => FAQItem(
                question: item.question,
                answer: item.answer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
