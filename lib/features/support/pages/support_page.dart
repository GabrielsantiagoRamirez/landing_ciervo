import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/content_constants.dart';
import '../../../core/constants/url_constants.dart';
import '../../../core/services/seo_service.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../shared/buttons/primary_button.dart';
import '../../../shared/layout/legal_page_layout.dart';
import '../../../shared/widgets/faq_item.dart';

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

  @override
  Widget build(BuildContext context) {
    return LegalPageLayout(
      title: 'Soporte',
      onBack: () => context.go('/'),
      children: [
        const LegalSection(
          heading: '¿Necesitas ayuda?',
          body:
              'Nuestro equipo de soporte está disponible para ayudarte con cualquier consulta sobre CIERVO.',
        ),
        LegalSection(
          heading: 'Correo de soporte',
          body: AppConstants.supportEmail,
        ),
        const LegalSection(
          heading: 'Tiempo estimado de respuesta',
          body:
              'Respondemos las consultas en un plazo de 24 a 48 horas hábiles.',
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          'Preguntas frecuentes',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: AppSpacing.md),
        ...ContentConstants.faqItems.take(4).map(
              (item) => FAQItem(
                question: item.question,
                answer: item.answer,
              ),
            ),
        const SizedBox(height: AppSpacing.xl),
        Text(
          'Formulario de contacto',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: AppSpacing.md),
        if (_sent)
          const LegalSection(
            heading: 'Mensaje enviado',
            body: 'Hemos recibido tu mensaje. Te responderemos pronto.',
          )
        else
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                  validator: (v) => v == null || v.isEmpty ? 'Requerido' : null,
                ),
                const SizedBox(height: AppSpacing.md),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(labelText: 'Correo'),
                  validator: (v) => v == null || v.isEmpty ? 'Requerido' : null,
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
                  label: 'Enviar',
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      setState(() => _sent = true);
                    }
                  },
                  isExpanded: true,
                ),
              ],
            ),
          ),
        const SizedBox(height: AppSpacing.lg),
        LegalSection(
          heading: 'Eliminar cuenta',
          body:
              'Para solicitar la eliminación de tu cuenta, visita ${UrlConstants.deleteAccount}.',
        ),
      ],
    );
  }
}
