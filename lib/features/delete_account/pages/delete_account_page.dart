import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/url_constants.dart';
import '../../../core/services/contact_form_service.dart';
import '../../../core/services/landing_actions.dart';
import '../../../core/services/seo_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/buttons/primary_button.dart';
import '../../../shared/layout/legal_page_layout.dart';
import '../../../shared/widgets/email_link.dart';
import '../../../shared/widgets/legal_internal_links.dart';

class DeleteAccountPage extends StatefulWidget {
  const DeleteAccountPage({super.key});

  @override
  State<DeleteAccountPage> createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccountPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _submitted = false;
  bool _submitting = false;

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

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _submitting = true);

    final sent = await ContactFormService.sendDeleteAccountRequest(
      email: _emailController.text.trim(),
    );

    if (!mounted) return;

    setState(() => _submitting = false);

    if (sent) {
      setState(() => _submitted = true);
    } else {
      LandingActions.showSnackBar(
        context,
        'No se pudo abrir el cliente de correo. Escribe a ${AppConstants.supportEmail} con tu solicitud.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final brand = AppConstants.brandName;

    return LegalPageLayout(
      title: 'Eliminar Cuenta',
      onBack: () => context.go('/'),
      children: [
        LegalSection(
          heading: 'Cómo eliminar tu cuenta',
          body:
              'Puedes solicitar la eliminación de tu cuenta de $brand de las siguientes formas:\n\n'
              '1. Desde la aplicación: Configuración > Cuenta > Eliminar cuenta.\n'
              '2. Completando el formulario en esta página.\n'
              '3. Enviando un correo a ${AppConstants.supportEmail} con el asunto "Eliminación de cuenta".',
        ),
        const LegalSection(
          heading: 'Qué datos se eliminan',
          body:
              'Al completar el proceso de eliminación, se suprimirán de forma permanente o se anonimizarán:\n\n'
              '• Perfil y datos de identificación (nombre, foto, teléfono).\n'
              '• Preferencias, favoritos e historial visible en la app.\n'
              '• Datos de membresía y configuraciones personalizadas.\n'
              '• Mensajes del chat asociados a tu cuenta.\n'
              '• Tokens de notificaciones push del dispositivo.\n'
              '• Información de wallet y Tarjeta Ciervo vinculada a la cuenta (salvo retenciones legales).',
        ),
        const LegalSection(
          heading: 'Qué datos deben conservarse por obligación legal',
          body:
              'Por obligaciones fiscales, contables, de prevención de fraude, lavado de activos y defensa ante reclamaciones, '
              'podemos conservar durante los plazos exigidos por la legislación colombiana:\n\n'
              '• Registros de transacciones y comprobantes de pago.\n'
              '• Facturas electrónicas y documentos tributarios.\n'
              '• Logs de seguridad, auditoría y acceso.\n'
              '• Información requerida por autoridades competentes.\n\n'
              'Estos datos se mantienen bloqueados y no se utilizan con fines comerciales una vez eliminada la cuenta.',
        ),
        const LegalSection(
          heading: 'Tiempo estimado de eliminación',
          body:
              'Las solicitudes de eliminación se procesan en un plazo máximo de 30 días hábiles desde la confirmación de la solicitud. '
              'Durante este período, tu cuenta puede quedar desactivada de inmediato para evitar nuevos accesos.',
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.check_circle_outline, color: AppColors.success),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Solicitud registrada. Hemos preparado tu correo de eliminación. '
                  'Procesaremos tu solicitud en un plazo máximo de 30 días hábiles y te enviaremos confirmación a ${_emailController.text.trim()}.',
                  style: AppTypography.body(context),
                ),
              ],
            ),
          )
        else
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Formulario de solicitud',
                  style: AppTypography.subtitle(context),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Indica el correo asociado a tu cuenta. Se abrirá tu cliente de correo con la solicitud dirigida a soporte.',
                  style: AppTypography.bodySmall(context),
                ),
                const SizedBox(height: AppSpacing.md),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Correo de tu cuenta',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Requerido';
                    if (!v.contains('@')) return 'Correo inválido';
                    return null;
                  },
                ),
                const SizedBox(height: AppSpacing.lg),
                PrimaryButton(
                  label: 'Solicitar eliminación',
                  onPressed: _submitting ? null : _submit,
                  isLoading: _submitting,
                  isExpanded: true,
                ),
              ],
            ),
          ),
        const SizedBox(height: AppSpacing.xl),
        Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Canales de contacto',
                style: AppTypography.subtitle(context).copyWith(fontSize: 20),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                'También puedes escribir directamente a:',
                style: AppTypography.bodySmall(context),
              ),
              const SizedBox(height: AppSpacing.sm),
              EmailLink(email: AppConstants.supportEmail),
              const SizedBox(height: AppSpacing.sm),
              TextButton(
                onPressed: () => context.go(UrlConstants.support),
                child: const Text('Ir a la página de Soporte'),
              ),
              TextButton(
                onPressed: () => context.go(UrlConstants.privacy),
                child: const Text('Ver Política de Privacidad'),
              ),
            ],
          ),
        ),
        const LegalInternalLinks(),
      ],
    );
  }
}
