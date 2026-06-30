import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/content_constants.dart';
import '../../../core/constants/url_constants.dart';
import '../../../core/services/contact_form_service.dart';
import '../../../core/services/landing_actions.dart';
import '../../../core/services/seo_service.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/buttons/primary_button.dart';
import '../../../shared/buttons/social_button.dart';
import '../../../shared/layout/legal_page_layout.dart';
import '../../../shared/widgets/email_link.dart';
import '../../../shared/widgets/faq_item.dart';
import '../../../shared/widgets/legal_internal_links.dart';

class SupportPage extends StatefulWidget {
  const SupportPage({super.key});

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _sent = false;
  bool _sending = false;

  @override
  void initState() {
    super.initState();
    SeoService.updateSupport();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _sending = true);

    final sent = await ContactFormService.sendSupportRequest(
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      message: _messageController.text.trim(),
    );

    if (!mounted) return;

    setState(() => _sending = false);

    if (sent) {
      setState(() => _sent = true);
    } else {
      LandingActions.showSnackBar(
        context,
        'No se pudo abrir el cliente de correo. Escribe directamente a ${AppConstants.supportEmail}.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final brand = AppConstants.brandName;

    return LegalPageLayout(
      title: 'Soporte',
      onBack: () => context.go('/'),
      children: [
        LegalSection(
          heading: '¿Necesitas ayuda?',
          body:
              'Nuestro equipo de soporte está disponible para ayudarte con cualquier consulta sobre $brand: cuenta, pagos, reservas, delivery, wallet, Tarjeta Ciervo y más.',
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Correo de soporte',
                style: AppTypography.subtitle(context).copyWith(fontSize: 20),
              ),
              const SizedBox(height: AppSpacing.sm),
              EmailLink(
                email: AppConstants.supportEmail,
                style: AppTypography.bodySmall(context).copyWith(
                  color: AppColors.gold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        const LegalSection(
          heading: 'Tiempo estimado de respuesta',
          body:
              'Respondemos las consultas en un plazo de 24 a 48 horas hábiles. Las solicitudes de eliminación de cuenta pueden tardar hasta 30 días hábiles.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Semantics(
          header: true,
          child: Text(
            'Preguntas frecuentes',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        ...ContentConstants.faqItems.map(
          (item) => FAQItem(
            question: item.question,
            answer: item.answer,
          ),
        ),
        const SizedBox(height: AppSpacing.xl),
        Semantics(
          header: true,
          child: Text(
            'Formulario de contacto',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Completa el formulario y se abrirá tu cliente de correo con el mensaje preparado para ${AppConstants.supportEmail}.',
          style: AppTypography.bodySmall(context),
        ),
        const SizedBox(height: AppSpacing.md),
        if (_sent)
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
                  'Mensaje preparado correctamente. Si tu cliente de correo no se abrió, escribe directamente a ${AppConstants.supportEmail}.',
                  style: AppTypography.body(context),
                ),
              ],
            ),
          )
        else
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                  textInputAction: TextInputAction.next,
                  validator: (v) => v == null || v.isEmpty ? 'Requerido' : null,
                ),
                const SizedBox(height: AppSpacing.md),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Correo'),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Requerido';
                    if (!v.contains('@')) return 'Correo inválido';
                    return null;
                  },
                ),
                const SizedBox(height: AppSpacing.md),
                TextFormField(
                  controller: _messageController,
                  decoration: const InputDecoration(labelText: 'Mensaje'),
                  maxLines: 4,
                  validator: (v) => v == null || v.isEmpty ? 'Requerido' : null,
                ),
                const SizedBox(height: AppSpacing.lg),
                PrimaryButton(
                  label: 'Enviar solicitud',
                  onPressed: _sending ? null : _submit,
                  isLoading: _sending,
                  isExpanded: true,
                ),
              ],
            ),
          ),
        const SizedBox(height: AppSpacing.xl),
        Semantics(
          header: true,
          child: Text(
            'Redes sociales',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Wrap(
          spacing: AppSpacing.sm,
          children: [
            SocialButton(
              icon: FontAwesomeIcons.instagram,
              url: UrlConstants.instagram,
              tooltip: 'Instagram de Ciervo Club',
            ),
            SocialButton(
              icon: FontAwesomeIcons.facebook,
              url: UrlConstants.facebook,
              tooltip: 'Facebook de Ciervo Club',
            ),
            SocialButton(
              icon: FontAwesomeIcons.xTwitter,
              url: UrlConstants.twitter,
              tooltip: 'X de Ciervo Club',
            ),
            SocialButton(
              icon: FontAwesomeIcons.linkedin,
              url: UrlConstants.linkedin,
              tooltip: 'LinkedIn de Ciervo Club',
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        LegalSection(
          heading: 'Eliminar cuenta',
          body:
              'Para solicitar la eliminación de tu cuenta, visita ${AppConstants.siteUrl}/delete-account.',
        ),
        TextButton(
          onPressed: () => context.go(UrlConstants.deleteAccount),
          child: const Text('Ir a Eliminar Cuenta'),
        ),
        const LegalInternalLinks(),
      ],
    );
  }
}
