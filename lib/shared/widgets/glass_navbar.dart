import 'package:flutter/material.dart';
import 'dart:ui';

import '../../core/constants/content_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_shadows.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';
import '../buttons/primary_button.dart';
import 'ciervo_logo.dart';

class GlassNavbar extends StatefulWidget {
  const GlassNavbar({
    super.key,
    required this.onNavTap,
    required this.onDownloadTap,
    this.scrolled = false,
  });

  final void Function(String sectionKey) onNavTap;
  final VoidCallback onDownloadTap;
  final bool scrolled;

  @override
  State<GlassNavbar> createState() => _GlassNavbarState();
}

class _GlassNavbarState extends State<GlassNavbar> {
  bool _menuOpen = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width <= 767;

    return Column(
      children: [
        ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 80,
              decoration: BoxDecoration(
                color: widget.scrolled
                    ? AppColors.glassBackground
                    : AppColors.primaryBlack.withValues(alpha: 0.7),
                border: const Border(
                  bottom: BorderSide(color: AppColors.divider, width: 0.5),
                ),
                boxShadow: widget.scrolled ? AppShadows.navbar : null,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? AppSpacing.sm : AppSpacing.xxl,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CiervoLogo(
                      size: CiervoLogoSize.compact,
                      onTap: () => widget.onNavTap('hero'),
                      tooltip: 'Ir al inicio',
                    ),
                    const Spacer(),
                    if (!isMobile) ...[
                      ...ContentConstants.navItems.map(
                        (item) => _NavLink(
                          label: item.label,
                          onTap: () => widget.onNavTap(item.sectionKey),
                        ),
                      ),
                      const SizedBox(width: AppSpacing.md),
                      PrimaryButton(
                        label: ContentConstants.navDownload,
                        onPressed: widget.onDownloadTap,
                      ),
                    ] else
                      IconButton(
                        icon: Icon(
                          _menuOpen ? Icons.close : Icons.menu,
                          color: AppColors.textPrimary,
                        ),
                        onPressed: () => setState(() => _menuOpen = !_menuOpen),
                        tooltip: _menuOpen ? 'Cerrar menú' : 'Abrir menú',
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (isMobile && _menuOpen)
          MobileNavDrawer(
            onNavTap: widget.onNavTap,
            onDownloadTap: widget.onDownloadTap,
            onClose: () => setState(() => _menuOpen = false),
          ),
      ],
    );
  }
}

class _NavLink extends StatefulWidget {
  const _NavLink({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  State<_NavLink> createState() => _NavLinkState();
}

class _NavLinkState extends State<_NavLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
        child: TextButton(
          onPressed: widget.onTap,
          style: TextButton.styleFrom(
            foregroundColor:
                _hovered ? AppColors.gold : AppColors.textSecondary,
          ),
          child: Text(widget.label, style: AppTypography.bodySmall(context)),
        ),
      ),
    );
  }
}

class MobileNavDrawer extends StatelessWidget {
  const MobileNavDrawer({
    super.key,
    required this.onNavTap,
    required this.onDownloadTap,
    required this.onClose,
  });

  final void Function(String sectionKey) onNavTap;
  final VoidCallback onDownloadTap;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.carbonBlack,
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ...ContentConstants.navItems.map(
            (item) => TextButton(
              onPressed: () {
                onClose();
                onNavTap(item.sectionKey);
              },
              child: Text(
                item.label,
                style: AppTypography.subtitle(context),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          PrimaryButton(
            label: ContentConstants.navDownload,
            onPressed: () {
              onClose();
              onDownloadTap();
            },
            isExpanded: true,
          ),
        ],
      ),
    );
  }
}
