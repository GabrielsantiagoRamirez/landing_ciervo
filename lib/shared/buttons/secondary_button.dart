import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';

class SecondaryButton extends StatefulWidget {
  const SecondaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.tooltip,
    this.isExpanded = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final String? tooltip;
  final bool isExpanded;

  @override
  State<SecondaryButton> createState() => _SecondaryButtonState();
}

class _SecondaryButtonState extends State<SecondaryButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onPressed != null;
    final filled = _hovered && enabled;

    final button = MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          color: filled ? AppColors.gold : Colors.transparent,
          borderRadius: BorderRadius.circular(AppRadius.button),
          border: Border.all(
            color: enabled ? AppColors.gold : AppColors.textDisabled,
            width: 1.5,
          ),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: enabled ? widget.onPressed : null,
            borderRadius: BorderRadius.circular(AppRadius.button),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.md,
                vertical: 12,
              ),
              child: Text(
                widget.label,
                style: AppTypography.button(context).copyWith(
                  fontSize: 15,
                  letterSpacing: 0.2,
                  color: filled
                      ? AppColors.primaryBlack
                      : (enabled ? AppColors.gold : AppColors.textDisabled),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    final child = widget.isExpanded
        ? SizedBox(width: double.infinity, child: button)
        : button;

    return Tooltip(
      message: widget.tooltip ?? widget.label,
      child: child,
    );
  }
}
