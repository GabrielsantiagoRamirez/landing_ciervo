import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/content_constants.dart';
import '../../../core/constants/url_constants.dart';
import '../../../core/theme/app_breakpoints.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/buttons/social_button.dart';
import '../../../shared/widgets/ciervo_logo.dart';
import '../../../shared/widgets/email_link.dart';
import '../../../shared/widgets/footer_column.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({
    super.key,
    required this.onNavTap,
  });

  final void Function(String sectionKey) onNavTap;

  @override
  Widget build(BuildContext context) {
    final isMobile = AppBreakpoints.isMobile(context);

    return Semantics(
      container: true,
      label: 'Pie de página de ${AppConstants.brandName}',
      child: Container(
        color: AppColors.primaryBlack,
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? AppSpacing.lg : AppSpacing.xxxl,
          vertical: AppSpacing.xxxl,
        ),
        child: Column(
          children: [
            isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _columns(context, isMobile),
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _columns(context, isMobile)
                        .map((c) => Expanded(child: c))
                        .toList(),
                  ),
            const SizedBox(height: AppSpacing.xxxl),
            const Divider(color: AppColors.divider),
            const SizedBox(height: AppSpacing.lg),
            isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _bottomBar(context),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: _bottomBar(context),
                  ),
          ],
        ),
      ),
    );
  }

  List<Widget> _bottomBar(BuildContext context) {
    return [
      Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppConstants.copyrightText(),
              style: AppTypography.caption(context),
            ),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Operamos en ${AppConstants.operatingCountry}.',
              style: AppTypography.caption(context).copyWith(
                color: AppColors.textDisabled,
              ),
            ),
          ],
        ),
      ),
      const SizedBox(width: AppSpacing.lg, height: AppSpacing.md),
      Wrap(
        spacing: AppSpacing.sm,
        children: [
          SocialButton(
            icon: FontAwesomeIcons.instagram,
            url: UrlConstants.instagram,
            tooltip: 'Instagram de Ciervo Club',
          ),
          SocialButton(
            icon: FontAwesomeIcons.facebook,
            url: UrlConstants.facebook,
            tooltip: 'Facebook de Ciervo Club',
          ),
          SocialButton(
            icon: FontAwesomeIcons.xTwitter,
            url: UrlConstants.twitter,
            tooltip: 'X de Ciervo Club',
          ),
          SocialButton(
            icon: FontAwesomeIcons.linkedin,
            url: UrlConstants.linkedin,
            tooltip: 'LinkedIn de Ciervo Club',
          ),
        ],
      ),
    ];
  }

  List<Widget> _columns(BuildContext context, bool isMobile) {
    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CiervoLogo(
            size: isMobile ? CiervoLogoSize.large : CiervoLogoSize.standard,
            onTap: () => onNavTap('hero'),
            tooltip: 'Ir al inicio de Ciervo Club',
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            ContentConstants.footerDescription,
            style: AppTypography.bodySmall(context),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            AppConstants.brandName,
            style: AppTypography.subtitle(context).copyWith(fontSize: 14),
          ),
          const SizedBox(height: AppSpacing.lg),
        ],
      ),
      FooterColumn(
        title: 'Navegación',
        children: [
          ...ContentConstants.navItems.map(
            (item) => FooterLink(
              label: item.label,
              onTap: () => onNavTap(item.sectionKey),
            ),
          ),
          FooterLink(
            label: 'Contacto',
            onTap: () => onNavTap('contact'),
          ),
        ],
      ),
      FooterColumn(
        title: 'Legal',
        children: [
          FooterLink(
            label: 'Política de Privacidad',
            onTap: () => context.go(UrlConstants.privacy),
          ),
          FooterLink(
            label: 'Términos y Condiciones',
            onTap: () => context.go(UrlConstants.terms),
          ),
          FooterLink(
            label: 'Soporte',
            onTap: () => context.go(UrlConstants.support),
          ),
          FooterLink(
            label: 'Eliminar Cuenta',
            onTap: () => context.go(UrlConstants.deleteAccount),
          ),
        ],
      ),
      FooterColumn(
        title: 'Contacto',
        children: [
          Text('Soporte', style: AppTypography.caption(context)),
          EmailLink(email: AppConstants.supportEmail),
          const SizedBox(height: AppSpacing.sm),
          Text('General', style: AppTypography.caption(context)),
          EmailLink(email: AppConstants.contactEmail),
        ],
      ),
    ];
  }
}
