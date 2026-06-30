import 'package:flutter/material.dart';

import '../../core/constants/app_constants.dart';

/// Icono pequeño de CIERVO (logo con fondo transparente) para listas y viñetas.
class CiervoBulletIcon extends StatelessWidget {
  const CiervoBulletIcon({
    super.key,
    this.size = 18,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AppConstants.logoPath,
      width: size,
      height: size,
      fit: BoxFit.contain,
      filterQuality: FilterQuality.high,
      semanticLabel: AppConstants.logoName,
      errorBuilder: (context, error, stackTrace) => Icon(
        Icons.pets,
        size: size,
        color: const Color(0xFFD4AF37),
      ),
    );
  }
}
