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

enum DataRequestType {
  copy('Copia de datos personales'),
  correction('Corrección de información'),
  partialDeletion('Eliminación parcial de datos'),
  fullDeletion('Eliminación completa de la cuenta');

  const DataRequestType(this.label);

  final String label;
}

class DataRequestPage extends StatefulWidget {
  const DataRequestPage({super.key});

  @override
  State<DataRequestPage> createState() => _DataRequestPageState();
}

class _DataRequestPageState extends State<DataRequestPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _ciervoIdController = TextEditingController();
  final _detailsController = TextEditingController();
  DataRequestType _requestType = DataRequestType.copy;
  bool _submitted = false;
  bool _submitting = false;

  @override
  void initState() {
    super.initState();
    SeoService.updateDataRequest();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _ciervoIdController.dispose();
    _detailsController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _submitting = true);

    final sent = await ContactFormService.sendDataRequest(
      name: _nameController.text.trim(),
      email: _emailController.text.trim(),
      requestType: _requestType.label,
      ciervoId: _ciervoIdController.text.trim(),
      details: _detailsController.text.trim(),
    );

    if (!mounted) return;

    setState(() => _submitting = false);

    if (sent) {
      setState(() => _submitted = true);
    } else {
      LandingActions.showSnackBar(
        context,
        'No se pudo abrir el cliente de correo. Escribe a ${AppConstants.dataSafetyEmail} con tu solicitud.',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final brand = AppConstants.brandName;

    return LegalPageLayout(
      title: 'Solicitud de datos personales',
      onBack: () => context.go('/'),
      children: [
        LegalSection(
          heading: 'Introducción',
          body:
              'En $brand respetamos tu privacidad y tus derechos sobre tus datos personales.\n\n'
              'Desde esta página puedes ejercer tus derechos de acceso, rectificación, supresión parcial o eliminación completa de tu cuenta, conforme a nuestra Política de Privacidad.',
        ),
        const LegalSection(
          heading: 'Tipos de solicitud disponibles',
          body:
              'Puedes solicitar:\n\n'
              '• Copia de tus datos personales.\n'
              '• Corrección de información incorrecta o desactualizada.\n'
              '• Eliminación parcial de datos (por ejemplo, historial, preferencias o contenido permitido).\n'
              '• Eliminación completa de la cuenta.\n\n'
              'Para eliminación completa de cuenta, también puedes visitar la página dedicada de eliminación de cuenta.',
        ),
        const LegalSection(
          heading: 'Tiempo de procesamiento',
          body:
              'Las solicitudes serán procesadas en un plazo máximo de 30 días calendario. '
              'Normalmente respondemos en pocos días cuando no se requiere verificación adicional de identidad.',
        ),
        const SizedBox(height: AppSpacing.lg),
        if (_submitted)
          Semantics(
            liveRegion: true,
            child: Container(
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
                    'Solicitud recibida.',
                    style: AppTypography.subtitle(context).copyWith(fontSize: 20),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    'Nuestro equipo procesará tu solicitud dentro del plazo establecido y podrá contactarte si requiere verificar tu identidad.',
                    style: AppTypography.body(context),
                  ),
                ],
              ),
            ),
          )
        else
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Semantics(
                  header: true,
                  child: Text(
                    'Formulario de solicitud',
                    style: AppTypography.subtitle(context),
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Selecciona el tipo de solicitud y completa tus datos.',
                  style: AppTypography.bodySmall(context),
                ),
                const SizedBox(height: AppSpacing.md),
                DropdownButtonFormField<DataRequestType>(
                  value: _requestType,
                  decoration: const InputDecoration(
                    labelText: 'Tipo de solicitud',
                  ),
                  items: DataRequestType.values
                      .map(
                        (type) => DropdownMenuItem(
                          value: type,
                          child: Text(type.label),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _requestType = value);
                    }
                  },
                ),
                const SizedBox(height: AppSpacing.md),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                  textInputAction: TextInputAction.next,
                  validator: (v) => v == null || v.isEmpty ? 'Requerido' : null,
                ),
                const SizedBox(height: AppSpacing.md),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Correo electrónico',
                  ),
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
                  controller: _ciervoIdController,
                  decoration: const InputDecoration(
                    labelText: 'ID Ciervo (opcional)',
                  ),
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: AppSpacing.md),
                TextFormField(
                  controller: _detailsController,
                  decoration: InputDecoration(
                    labelText: _requestType == DataRequestType.partialDeletion
                        ? 'Datos a eliminar (opcional)'
                        : 'Detalles adicionales (opcional)',
                  ),
                  maxLines: 4,
                ),
                const SizedBox(height: AppSpacing.lg),
                PrimaryButton(
                  label: 'Enviar solicitud',
                  onPressed: _submitting ? null : _submit,
                  isLoading: _submitting,
                  isExpanded: true,
                ),
                const SizedBox(height: AppSpacing.sm),
                if (_requestType == DataRequestType.fullDeletion)
                  TextButton(
                    onPressed: () => context.go(UrlConstants.deleteAccount),
                    child: const Text('Ir a la página de eliminación de cuenta'),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
