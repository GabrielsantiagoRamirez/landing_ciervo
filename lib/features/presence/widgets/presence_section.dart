import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../core/constants/content_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/layout/animated_section.dart';
import '../../../shared/layout/responsive_container.dart';
import '../../../shared/widgets/section_title.dart';

class PresenceSection extends StatelessWidget {
  const PresenceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveContainer(
      child: AnimatedSection(
        child: Column(
          children: [
            SectionTitle(
              title: ContentConstants.presenceTitle,
              alignment: TextAlign.center,
            ),
            SectionSubtitle(
              subtitle: ContentConstants.presenceSubtitle,
              alignment: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xxl),
            Wrap(
              spacing: AppSpacing.xl,
              runSpacing: AppSpacing.lg,
              alignment: WrapAlignment.center,
              children: ContentConstants.presenceCountries
                  .map((country) => _CountryCard(country: country))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class _CountryCard extends StatelessWidget {
  const _CountryCard({required this.country});

  final CountryPresence country;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CountryFlag(code: country.code, width: 72, height: 48),
        const SizedBox(height: AppSpacing.sm),
        Text(
          country.name,
          style: AppTypography.subtitle(context).copyWith(fontSize: 20),
        ),
      ],
    );
  }
}

class CountryFlag extends StatelessWidget {
  const CountryFlag({
    super.key,
    required this.code,
    this.width = 72,
    this.height = 48,
  });

  final String code;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final normalizedCode = code.toLowerCase();

    return Semantics(
      label: 'Bandera de ${_countryName(code)}',
      child: SizedBox(
        width: width,
        height: height,
        child: Image.asset(
          'assets/flags/$normalizedCode.png',
          width: width,
          height: height,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return ColoredBox(
              color: Colors.transparent,
              child: const Center(
                child: Icon(Icons.flag_outlined),
              ),
            );
          },
        ),
      ),
    );
  }

  static String _countryName(String code) => switch (code.toUpperCase()) {
        'CL' => 'Chile',
        'CO' => 'Colombia',
        _ => code,
      };
}