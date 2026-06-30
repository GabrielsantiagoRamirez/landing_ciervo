import '../constants/app_constants.dart';
import 'landing_actions.dart';

abstract final class ContactFormService {
  static Future<bool> sendSupportRequest({
    required String name,
    required String email,
    required String message,
  }) {
    return LandingActions.openEmail(
      email: AppConstants.supportEmail,
      subject: 'Soporte ${AppConstants.brandName} — $name',
      body:
          'Nombre: $name\nCorreo de contacto: $email\n\nMensaje:\n$message\n\n---\nEnviado desde la página de soporte de ${AppConstants.siteUrl}',
    );
  }

  static Future<bool> sendContactRequest({
    required String name,
    required String email,
    required String message,
  }) {
    return LandingActions.openEmail(
      email: AppConstants.contactEmail,
      subject: 'Contacto ${AppConstants.brandName} — $name',
      body:
          'Nombre: $name\nCorreo: $email\n\nMensaje:\n$message\n\n---\nEnviado desde la landing de ${AppConstants.siteUrl}',
    );
  }

  static Future<bool> sendDeleteAccountRequest({
    required String email,
  }) {
    return LandingActions.openEmail(
      email: AppConstants.supportEmail,
      subject: 'Solicitud de eliminación de cuenta — ${AppConstants.brandName}',
      body:
          'Solicito la eliminación completa de mi cuenta de ${AppConstants.brandName}.\n\nCorreo de la cuenta: $email\n\nConfirmo que entiendo que algunos datos pueden conservarse por obligación legal según la política de privacidad.\n\n---\nEnviado desde ${AppConstants.siteUrl}/delete-account',
    );
  }
}
