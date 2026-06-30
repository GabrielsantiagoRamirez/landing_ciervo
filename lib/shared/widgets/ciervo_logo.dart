import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';

enum CiervoLogoSize { compact, standard, large }

class CiervoLogo extends StatefulWidget {
  const CiervoLogo({
    super.key,
    this.onTap,
    this.size = CiervoLogoSize.compact,
    this.tooltip,
  });

  final VoidCallback? onTap;
  final CiervoLogoSize size;
  final String? tooltip;

  @override
  State<CiervoLogo> createState() => _CiervoLogoState();
}

class _CiervoLogoState extends State<CiervoLogo> {
  bool _hovered = false;

  double get _height => switch (widget.size) {
        CiervoLogoSize.compact => 72,
        CiervoLogoSize.standard => 112,
        CiervoLogoSize.large => 148,
      };

  @override
  Widget build(BuildContext context) {
    final image = AnimatedScale(
      scale: _hovered && widget.onTap != null ? 1.02 : 1.0,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      child: Image.asset(
        AppConstants.logoPath,
        height: _height,
        fit: BoxFit.contain,
        filterQuality: FilterQuality.high,
        semanticLabel: '${AppConstants.logoName}, logotipo de ${AppConstants.brandName}',
        errorBuilder: (context, error, stackTrace) => _fallback(context),
      ),
    );

    final child = widget.onTap == null
        ? image
        : MouseRegion(
            onEnter: (_) => setState(() => _hovered = true),
            onExit: (_) => setState(() => _hovered = false),
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: widget.onTap,
              behavior: HitTestBehavior.opaque,
              child: image,
            ),
          );

    return Tooltip(
      message: widget.tooltip ?? '${AppConstants.logoName}, ${AppConstants.brandName}',
      child: child,
    );
  }

  Widget _fallback(BuildContext context) {
    return Text(
      AppConstants.logoName,
      style: TextStyle(
        fontSize: _height * 0.35,
        fontWeight: FontWeight.w700,
        color: const Color(0xFFD4AF37),
        letterSpacing: 2,
      ),
    );
  }
}
