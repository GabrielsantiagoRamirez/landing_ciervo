import 'package:flutter/material.dart';

import '../../core/services/landing_actions.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

class EmailLink extends StatelessWidget {
  const EmailLink({
    super.key,
    required this.email,
    this.style,
    this.semanticLabel,
  });

  final String email;
  final TextStyle? style;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final textStyle = style ??
        AppTypography.bodySmall(context).copyWith(
          color: AppColors.gold,
          decoration: TextDecoration.underline,
          decorationColor: AppColors.gold.withValues(alpha: 0.6),
        );

    return Semantics(
      label: semanticLabel ?? 'Enviar correo a $email',
      button: true,
      link: true,
      child: InkWell(
        onTap: () => LandingActions.openEmail(email: email),
        child: Text(email, style: textStyle),
      ),
    );
  }
}
