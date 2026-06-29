import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/url_constants.dart';
import '../../../core/services/seo_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/buttons/primary_button.dart';
import '../../../shared/layout/legal_page_layout.dart';

class DeleteAccountPage extends StatefulWidget {
  const DeleteAccountPage({super.key});

  @override
  State<DeleteAccountPage> createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccountPage> {
  final _emailController = TextEditingController();
  bool _submitted = false;

  @override
  void initState() {
    super.initState();
    SeoService.updateDeleteAccount();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LegalPageLayout(
      title: 'Eliminar Cuenta',
      onBack: () => context.go('/'),
      children: [
        const LegalSection(
          heading: 'Cómo eliminar tu cuenta',
          body:
              'Puedes solicitar la eliminación de tu cuenta de CIERVO completando el formulario a continuación o enviando un correo a soporte. También puedes eliminar tu cuenta directamente desde la aplicación en Configuración > Cuenta > Eliminar cuenta.',
        ),
        const LegalSection(
          heading: 'Qué datos se eliminan',
          body:
              'Al eliminar tu cuenta, se eliminarán tu perfil, historial de transacciones visible, preferencias, datos de membresía y cualquier información personal asociada a tu cuenta.',
        ),
        const LegalSection(
          heading: 'Datos que pueden conservarse',
          body:
              'Por obligaciones legales, fiscales o de prevención de fraude, podemos conservar ciertos registros de transacciones, facturas y logs de seguridad durante el período requerido por la legislación aplicable.',
        ),
        const LegalSection(
          heading: 'Tiempo estimado del proceso',
          body:
              'Las solicitudes de eliminación se procesan en un plazo de 30 días hábiles. Recibirás una confirmación por correo electrónico una vez completado el proceso.',
        ),
        const SizedBox(height: AppSpacing.lg),
        if (_submitted)
          Container(
            padding: const EdgeInsets.all(AppSpacing.lg),
            decoration: BoxDecoration(
              color: AppColors.carbonBlack,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.success.withValues(alpha: 0.3)),
            ),
            child: Text(
              'Solicitud recibida. Procesaremos tu eliminación en un plazo de 30 días hábiles.',
              style: AppTypography.body(context),
            ),
          )
        else
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Correo de tu cuenta',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: AppSpacing.lg),
              PrimaryButton(
                label: 'Solicitar eliminación',
                onPressed: () {
                  if (_emailController.text.contains('@')) {
                    setState(() => _submitted = true);
                  }
                },
                isExpanded: true,
              ),
            ],
          ),
        const SizedBox(height: AppSpacing.xl),
        LegalSection(
          heading: 'Canales de contacto',
          body:
              'También puedes contactar directamente a ${AppConstants.supportEmail} o visitar nuestra página de ${UrlConstants.support}.',
        ),
      ],
    );
  }
}
