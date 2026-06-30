import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_spacing.dart';
import '../../core/theme/app_typography.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.tooltip,
    this.isLoading = false,
    this.isExpanded = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final String? tooltip;
  final bool isLoading;
  final bool isExpanded;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final enabled = widget.onPressed != null && !widget.isLoading;
    final color = _hovered && enabled ? AppColors.goldHover : AppColors.gold;

    final button = MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedScale(
        scale: _hovered && enabled ? 1.03 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        child: Material(
          color: enabled ? color : AppColors.textDisabled,
          borderRadius: BorderRadius.circular(AppRadius.button),
          child: InkWell(
            onTap: enabled ? widget.onPressed : null,
            borderRadius: BorderRadius.circular(AppRadius.button),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg,
                vertical: AppSpacing.sm,
              ),
              alignment: Alignment.center,
              child: widget.isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.primaryBlack,
                      ),
                    )
                  : Text(
                      widget.label,
                      style: AppTypography.button(context).copyWith(
                        color: AppColors.primaryBlack,
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

    return Semantics(
      button: true,
      label: widget.label,
      enabled: enabled,
      child: Tooltip(
        message: widget.tooltip ?? widget.label,
        child: child,
      ),
    );
  }
}
