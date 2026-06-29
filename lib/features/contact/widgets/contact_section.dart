import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/constants/content_constants.dart';
import '../../../core/constants/url_constants.dart';
import '../../../core/models/contact_intent.dart';
import '../../../core/services/landing_actions.dart';
import '../../../core/theme/app_breakpoints.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../shared/buttons/primary_button.dart';
import '../../../shared/buttons/social_button.dart';
import '../../../shared/layout/animated_section.dart';
import '../../../shared/layout/responsive_container.dart';
import '../../../shared/widgets/section_title.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({
    super.key,
    this.intent,
  });

  final ContactIntent? intent;

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _sent = false;

  @override
  void initState() {
    super.initState();
    _applyIntent(widget.intent);
  }

  @override
  void didUpdateWidget(ContactSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.intent != null && widget.intent != oldWidget.intent) {
      _applyIntent(widget.intent);
    }
  }

  void _applyIntent(ContactIntent? intent) {
    if (intent == null) return;
    _messageController.text = intent.message;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() => _sent = true);
      LandingActions.showSnackBar(
        context,
        ContentConstants.contactSuccess,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = AppBreakpoints.isMobile(context);
    final intentBanner = widget.intent?.highlightText;

    return ResponsiveContainer(
      child: AnimatedSection(
        child: Column(
          children: [
            SectionTitle(
              title: ContentConstants.contactTitle,
              alignment: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.sm),
            SectionSubtitle(
              subtitle: intentBanner ?? ContentConstants.contactSubtitle,
              alignment: TextAlign.center,
            ),
            if (intentBanner != null) ...[
              const SizedBox(height: AppSpacing.sm),
              Text(
                widget.intent?.type == ContactIntentType.enterprise
                    ? ContentConstants.enterpriseConsultationCta
                    : intentBanner,
                textAlign: TextAlign.center,
                style: AppTypography.bodySmall(context).copyWith(
                  color: AppColors.gold,
                ),
              ),
            ],
            const SizedBox(height: AppSpacing.xxl),
            isMobile
                ? Column(
                    children: [
                      _buildForm(context),
                      const SizedBox(height: AppSpacing.xxl),
                      _buildInfo(context),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 3, child: _buildForm(context)),
                      const SizedBox(width: AppSpacing.xxxl),
                      Expanded(flex: 2, child: _buildInfo(context)),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    if (_sent) {
      return Container(
        padding: const EdgeInsets.all(AppSpacing.xl),
        decoration: BoxDecoration(
          color: AppColors.carbonBlack,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.success.withValues(alpha: 0.3)),
        ),
        child: Column(
          children: [
            const Icon(Icons.check_circle_outline, color: AppColors.success, size: 48),
            const SizedBox(height: AppSpacing.md),
            Text(
              ContentConstants.contactSuccess,
              textAlign: TextAlign.center,
              style: AppTypography.body(context),
            ),
          ],
        ),
      );
    }

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: ContentConstants.contactName),
            validator: (v) => v == null || v.isEmpty ? 'Requerido' : null,
          ),
          const SizedBox(height: AppSpacing.md),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(labelText: ContentConstants.contactEmail),
            keyboardType: TextInputType.emailAddress,
            validator: (v) {
              if (v == null || v.isEmpty) return 'Requerido';
              if (!v.contains('@')) return 'Correo inválido';
              return null;
            },
          ),
          const SizedBox(height: AppSpacing.md),
          TextFormField(
            controller: _messageController,
            decoration: const InputDecoration(labelText: ContentConstants.contactMessage),
            maxLines: 5,
            validator: (v) => v == null || v.isEmpty ? 'Requerido' : null,
          ),
          const SizedBox(height: AppSpacing.lg),
          PrimaryButton(
            label: ContentConstants.contactSend,
            onPressed: _submit,
            isExpanded: true,
          ),
        ],
      ),
    );
  }

  Widget _buildInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Soporte', style: AppTypography.subtitle(context)),
        const SizedBox(height: AppSpacing.sm),
        InkWell(
          onTap: () => LandingActions.openSupportEmail(context),
          child: Text(
            AppConstants.supportEmail,
            style: AppTypography.body(context).copyWith(color: AppColors.gold),
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        TextButton(
          onPressed: () => LandingActions.openSupportPage(context),
          child: Text(
            'Ir a la página de soporte',
            style: AppTypography.bodySmall(context).copyWith(color: AppColors.gold),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('Contacto', style: AppTypography.subtitle(context)),
        const SizedBox(height: AppSpacing.sm),
        InkWell(
          onTap: () => LandingActions.openContactEmail(context),
          child: Text(
            UrlConstants.contactEmail,
            style: AppTypography.body(context).copyWith(color: AppColors.gold),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('WhatsApp', style: AppTypography.subtitle(context)),
        const SizedBox(height: AppSpacing.sm),
        InkWell(
          onTap: () => LandingActions.openWhatsapp(context),
          child: Text(
            UrlConstants.whatsappUrl.isNotEmpty
                ? 'Escríbenos por WhatsApp'
                : 'WhatsApp — Próximamente',
            style: AppTypography.body(context).copyWith(
              color: UrlConstants.whatsappUrl.isNotEmpty
                  ? AppColors.gold
                  : AppColors.textDisabled,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.lg),
        Text('Redes sociales', style: AppTypography.subtitle(context)),
        const SizedBox(height: AppSpacing.md),
        Wrap(
          spacing: AppSpacing.sm,
          children: [
            SocialButton(
              icon: FontAwesomeIcons.instagram,
              url: UrlConstants.instagram,
              tooltip: 'Instagram',
            ),
            SocialButton(
              icon: FontAwesomeIcons.facebook,
              url: UrlConstants.facebook,
              tooltip: 'Facebook',
            ),
            SocialButton(
              icon: FontAwesomeIcons.xTwitter,
              url: UrlConstants.twitter,
              tooltip: 'X',
            ),
            SocialButton(
              icon: FontAwesomeIcons.linkedin,
              url: UrlConstants.linkedin,
              tooltip: 'LinkedIn',
            ),
          ],
        ),
      ],
    );
  }
}
