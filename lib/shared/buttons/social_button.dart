import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/services/landing_actions.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';

class SocialButton extends StatefulWidget {
  const SocialButton({
    super.key,
    required this.icon,
    required this.url,
    required this.tooltip,
  });

  final IconData icon;
  final String url;
  final String tooltip;

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final hasUrl = widget.url.isNotEmpty;

    return Tooltip(
      message: hasUrl ? widget.tooltip : '${widget.tooltip} — Próximamente',
      child: MouseRegion(
        onEnter: (_) => setState(() => _hovered = true),
        onExit: (_) => setState(() => _hovered = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () => LandingActions.openSocial(
            context,
            widget.url,
            widget.tooltip,
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: _hovered
                  ? AppColors.gold.withValues(alpha: 0.15)
                  : AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadius.button),
              border: Border.all(
                color: _hovered && hasUrl
                    ? AppColors.gold
                    : AppColors.divider,
              ),
            ),
            child: Center(
              child: FaIcon(
                widget.icon,
                size: 18,
                color: hasUrl
                    ? (_hovered ? AppColors.gold : AppColors.textSecondary)
                    : AppColors.textDisabled,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
