import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/constants/app_constants.dart';
import '../../core/constants/content_constants.dart';
import '../../core/services/landing_actions.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';

enum DownloadStore { googlePlay, appStore }

class DownloadBadge extends StatelessWidget {
  const DownloadBadge({
    super.key,
    required this.store,
    this.onTap,
  });

  final DownloadStore store;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isGoogle = store == DownloadStore.googlePlay;
    final published = AppConstants.appsPublished;
    final storeLabel = isGoogle ? 'Google Play' : 'App Store';

    return Semantics(
      label: published
          ? 'Descargar en $storeLabel'
          : '$storeLabel — ${ContentConstants.comingSoon}',
      button: true,
      child: Tooltip(
        message: published ? storeLabel : ContentConstants.comingSoon,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: onTap ?? () => LandingActions.openStore(context, store),
            child: AnimatedOpacity(
              opacity: published ? 1.0 : 0.65,
              duration: const Duration(milliseconds: 200),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.md,
                  vertical: AppSpacing.sm,
                ),
                decoration: BoxDecoration(
                  color: AppColors.carbonBlack,
                  borderRadius: BorderRadius.circular(AppRadius.button),
                  border: Border.all(color: AppColors.divider),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FaIcon(
                      isGoogle
                          ? FontAwesomeIcons.googlePlay
                          : FontAwesomeIcons.appStore,
                      color: AppColors.textPrimary,
                      size: 24,
                      semanticLabel: storeLabel,
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          published
                              ? 'Disponible en'
                              : ContentConstants.comingSoon,
                          style: AppTypography.caption(context).copyWith(
                            fontSize: 10,
                            color: AppColors.textDisabled,
                          ),
                        ),
                        Text(
                          storeLabel,
                          style: AppTypography.button(context).copyWith(
                            color: AppColors.textPrimary,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
