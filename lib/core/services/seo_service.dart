import 'seo_service_stub.dart'
    if (dart.library.js_interop) 'seo_service_web.dart' as seo_impl;

import '../constants/seo_constants.dart';

abstract final class SeoService {
  static void updatePageMeta({
    required String title,
    required String description,
    String? canonical,
  }) {
    seo_impl.updateWebMeta(
      title: title,
      description: description,
      canonical: canonical,
    );
  }

  static void updateHome() => updatePageMeta(
        title: SeoConstants.homeTitle,
        description: SeoConstants.homeDescription,
        canonical: '/',
      );

  static void updatePrivacy() => updatePageMeta(
        title: SeoConstants.privacyTitle,
        description: SeoConstants.privacyDescription,
        canonical: '/privacy',
      );

  static void updateTerms() => updatePageMeta(
        title: SeoConstants.termsTitle,
        description: SeoConstants.termsDescription,
        canonical: '/terms',
      );

  static void updateDeleteAccount() => updatePageMeta(
        title: SeoConstants.deleteAccountTitle,
        description: SeoConstants.deleteAccountDescription,
        canonical: '/delete-account',
      );

  static void updateDataRequest() => updatePageMeta(
        title: SeoConstants.dataRequestTitle,
        description: SeoConstants.dataRequestDescription,
        canonical: '/data-request',
      );

  static void updateSupport() => updatePageMeta(
        title: SeoConstants.supportTitle,
        description: SeoConstants.supportDescription,
        canonical: '/support',
      );

  static void updateNotFound() => updatePageMeta(
        title: SeoConstants.notFoundTitle,
        description: SeoConstants.notFoundDescription,
      );
}
