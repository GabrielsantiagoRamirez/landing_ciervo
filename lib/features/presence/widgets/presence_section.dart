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
    return Semantics(
      label: 'Bandera de ${_countryName(code)}',
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.divider),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryBlack.withValues(alpha: 0.35),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: switch (code.toUpperCase()) {
          'CL' => const _ChileFlag(),
          'CO' => const _ColombiaFlag(),
          _ => ColoredBox(color: AppColors.surface),
        },
      ),
    );
  }

  static String _countryName(String code) => switch (code.toUpperCase()) {
        'CL' => 'Chile',
        'CO' => 'Colombia',
        _ => code,
      };
}

class _ChileFlag extends StatelessWidget {
  const _ChileFlag();

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const Column(
          children: [
            Expanded(child: ColoredBox(color: Colors.white)),
            Expanded(child: ColoredBox(color: Color(0xFFD52B1E))),
          ],
        ),
        Align(
          alignment: Alignment.topLeft,
          child: FractionallySizedBox(
            widthFactor: 1 / 3,
            heightFactor: 0.5,
            child: ColoredBox(
              color: const Color(0xFF0039A6),
              child: Center(
                child: CustomPaint(
                  size: const Size(14, 14),
                  painter: _StarPainter(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _ColombiaFlag extends StatelessWidget {
  const _ColombiaFlag();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(flex: 2, child: ColoredBox(color: Color(0xFFFCD116))),
        Expanded(child: ColoredBox(color: Color(0xFF003893))),
        Expanded(child: ColoredBox(color: Color(0xFFCE1126))),
      ],
    );
  }
}

class _StarPainter extends CustomPainter {
  _StarPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path();
    final cx = size.width / 2;
    final cy = size.height / 2;
    final outer = size.width / 2;
    final inner = outer * 0.4;

    for (var i = 0; i < 10; i++) {
      final radius = i.isEven ? outer : inner;
      final angle = -math.pi / 2 + (i * math.pi / 5);
      final x = cx + radius * math.cos(angle);
      final y = cy + radius * math.sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _StarPainter oldDelegate) =>
      oldDelegate.color != color;
}
