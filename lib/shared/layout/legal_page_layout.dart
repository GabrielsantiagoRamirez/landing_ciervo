import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/constants/app_constants.dart';
import '../../core/constants/url_constants.dart';
import '../../core/services/landing_actions.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../../features/footer/widgets/footer_section.dart';
import '../widgets/glass_navbar.dart';

class LegalPageLayout extends StatefulWidget {
  const LegalPageLayout({
    super.key,
    required this.title,
    required this.children,
    this.onBack,
  });

  final String title;
  final List<Widget> children;
  final VoidCallback? onBack;

  @override
  State<LegalPageLayout> createState() => _LegalPageLayoutState();
}

class _LegalPageLayoutState extends State<LegalPageLayout> {
  final _scrollController = ScrollController();
  bool _scrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final scrolled = _scrollController.offset > 50;
    if (scrolled != _scrolled) {
      setState(() => _scrolled = scrolled);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _goHome() => context.go(UrlConstants.home);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlack,
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              const SliverToBoxAdapter(child: SizedBox(height: 80)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                    vertical: AppSpacing.xxxl,
                  ),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 800),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (widget.onBack != null)
                            TextButton.icon(
                              onPressed: widget.onBack,
                              icon: const Icon(
                                Icons.arrow_back,
                                color: AppColors.gold,
                              ),
                              label: Text(
                                'Volver al inicio',
                                style: AppTypography.bodySmall(context).copyWith(
                                  color: AppColors.gold,
                                ),
                              ),
                            ),
                          if (widget.onBack != null)
                            const SizedBox(height: AppSpacing.lg),
                          Semantics(
                            header: true,
                            child: Text(
                              widget.title,
                              style: AppTypography.sectionTitle(context),
                            ),
                          ),
                          const SizedBox(height: AppSpacing.xl),
                          ...widget.children,
                          const LegalPageFooterLinks(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: FooterSection(onNavTap: (_) => _goHome()),
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: GlassNavbar(
              scrolled: _scrolled,
              onNavTap: (_) => _goHome(),
              onDownloadTap: () => LandingActions.showComingSoonApp(context),
            ),
          ),
        ],
      ),
    );
  }
}

class LegalSection extends StatelessWidget {
  const LegalSection({
    super.key,
    required this.heading,
    required this.body,
  });

  final String heading;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Semantics(
            header: true,
            child: Text(
              heading,
              style: AppTypography.subtitle(context).copyWith(fontSize: 20),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(body, style: AppTypography.bodySmall(context)),
        ],
      ),
    );
  }
}

class LegalPageFooterLinks extends StatelessWidget {
  const LegalPageFooterLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.lg, bottom: AppSpacing.xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Semantics(
            header: true,
            child: Text(
              'Enlaces legales',
              style: AppTypography.subtitle(context).copyWith(fontSize: 20),
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.md,
            runSpacing: AppSpacing.sm,
            children: [
              _LegalFooterLink(
                label: 'Política de Privacidad',
                path: UrlConstants.privacy,
              ),
              _LegalFooterLink(
                label: 'Términos y Condiciones',
                path: UrlConstants.terms,
              ),
              _LegalFooterLink(
                label: 'Contacto',
                path: UrlConstants.home,
              ),
              _LegalFooterLink(
                label: 'Soporte',
                path: UrlConstants.support,
              ),
              _LegalFooterLink(
                label: 'Solicitud de datos',
                path: UrlConstants.dataRequest,
              ),
              _LegalFooterLink(
                label: 'Eliminar cuenta',
                path: UrlConstants.deleteAccount,
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            '${AppConstants.brandName} — ${AppConstants.siteUrl}',
            style: AppTypography.caption(context).copyWith(
              color: AppColors.textDisabled,
            ),
          ),
        ],
      ),
    );
  }
}

class _LegalFooterLink extends StatelessWidget {
  const _LegalFooterLink({
    required this.label,
    required this.path,
  });

  final String label;
  final String path;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: label,
      button: true,
      link: true,
      child: TextButton(
        onPressed: () => context.go(path),
        style: TextButton.styleFrom(
          foregroundColor: AppColors.gold,
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          label,
          style: AppTypography.bodySmall(context).copyWith(
            color: AppColors.gold,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.gold.withValues(alpha: 0.6),
          ),
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  const StatCard({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.carbonBlack,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.divider),
      ),
      child: Center(child: child),
    );
  }
}
