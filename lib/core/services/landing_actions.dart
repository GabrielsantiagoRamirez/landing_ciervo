import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/app_constants.dart';
import '../constants/content_constants.dart';
import '../constants/url_constants.dart';
import '../theme/app_colors.dart';
import '../theme/app_typography.dart';
import '../../shared/buttons/download_badge.dart';

abstract final class LandingActions {
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message, style: AppTypography.bodySmall(context)),
          backgroundColor: AppColors.carbonBlack,
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 3),
        ),
      );
  }

  static void showComingSoonApp(BuildContext context) {
    showSnackBar(context, ContentConstants.appComingSoonMessage);
  }

  static void showLinkUnavailable(BuildContext context, String label) {
    showSnackBar(
      context,
      '$label estará disponible próximamente.',
    );
  }

  static Future<void> openStore(
    BuildContext context,
    DownloadStore store,
  ) async {
    if (!AppConstants.appsPublished) {
      showComingSoonApp(context);
      return;
    }

    final url = store == DownloadStore.googlePlay
        ? UrlConstants.googlePlayUrl
        : UrlConstants.appStoreUrl;

    if (url.isEmpty) {
      showComingSoonApp(context);
      return;
    }

    await _launchExternalUrl(url);
  }

  static Future<void> openUrl(BuildContext context, String url) async {
    if (url.isEmpty) {
      showLinkUnavailable(context, 'Este enlace');
      return;
    }
    await _launchExternalUrl(url);
  }

  static Future<void> openSocial(BuildContext context, String url, String network) async {
    if (url.isEmpty) {
      showLinkUnavailable(context, network);
      return;
    }
    await _launchExternalUrl(url);
  }

  static Future<void> openEmail({
    required String email,
    String? subject,
    String? body,
  }) async {
    final uri = Uri(
      scheme: 'mailto',
      path: email,
      queryParameters: {
        if (subject != null && subject.isNotEmpty) 'subject': subject,
        if (body != null && body.isNotEmpty) 'body': body,
      },
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  static Future<void> openContactEmail(BuildContext context) async {
    await openEmail(email: UrlConstants.contactEmail);
  }

  static Future<void> openSupportEmail(BuildContext context) async {
    await openEmail(email: AppConstants.supportEmail);
  }

  static Future<void> openWhatsapp(BuildContext context) async {
    if (UrlConstants.whatsappUrl.isEmpty) {
      showLinkUnavailable(context, 'WhatsApp');
      return;
    }
    await _launchExternalUrl(UrlConstants.whatsappUrl);
  }

  static Future<void> openBusinessPanel(BuildContext context) async {
    if (UrlConstants.businessPanelUrl.isEmpty) {
      showSnackBar(
        context,
        'El panel de negocios estará disponible próximamente. Contáctanos para registrarte.',
      );
      return;
    }
    await _launchExternalUrl(UrlConstants.businessPanelUrl);
  }

  static void openSupportPage(BuildContext context) {
    context.go(UrlConstants.supportUrl);
  }

  static Future<void> _launchExternalUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
