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

    return Container(
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  ContentConstants.copyright,
                  style: AppTypography.caption(context),
                ),
              ),
              Wrap(
                spacing: AppSpacing.sm,
                children: [
                  SocialButton(
                    icon: FontAwesomeIcons.instagram,
                    url: UrlConstants.instagram,
                    tooltip: 'Instagram',
                  ),
                  SocialButton(
                    icon: FontAwesomeIcons.facebook,
                    url: UrlConstants.facebook,
                    tooltip: 'Facebook',
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> _columns(BuildContext context, bool isMobile) {
    return [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CiervoLogo(
            size: isMobile ? CiervoLogoSize.large : CiervoLogoSize.standard,
            onTap: () => onNavTap('hero'),
            tooltip: 'Ir al inicio',
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            ContentConstants.footerDescription,
            style: AppTypography.bodySmall(context),
          ),
          const SizedBox(height: AppSpacing.lg),
        ],
      ),
      FooterColumn(
        title: 'Navegación',
        children: ContentConstants.navItems
            .map(
              (item) => FooterLink(
                label: item.label,
                onTap: () => onNavTap(item.sectionKey),
              ),
            )
            .toList(),
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
            label: 'Eliminar Cuenta',
            onTap: () => context.go(UrlConstants.deleteAccount),
          ),
          FooterLink(
            label: 'Soporte',
            onTap: () => context.go(UrlConstants.support),
          ),
        ],
      ),
      FooterColumn(
        title: 'Contacto',
        children: [
          Text(AppConstants.supportEmail, style: AppTypography.bodySmall(context)),
          const SizedBox(height: AppSpacing.xs),
          Text(AppConstants.contactEmail, style: AppTypography.bodySmall(context)),
        ],
      ),
    ];
  }
}
