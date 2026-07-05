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
    required String name,
    required String email,
    String? ciervoId,
    String? reason,
  }) {
    final idLine = ciervoId != null && ciervoId.isNotEmpty
        ? 'ID Ciervo: $ciervoId\n'
        : '';
    final reasonLine = reason != null && reason.isNotEmpty
        ? 'Motivo: $reason\n'
        : '';

    return LandingActions.openEmail(
      email: AppConstants.dataSafetyEmail,
      subject: 'Solicitud de eliminación de cuenta — ${AppConstants.brandName}',
      body:
          'Solicito la eliminación permanente de mi cuenta de ${AppConstants.brandName}.\n\n'
          'Nombre: $name\n'
          'Correo de la cuenta: $email\n'
          '$idLine'
          '$reasonLine'
          'Confirmo que entiendo que este proceso puede ser irreversible y que algunos datos pueden conservarse por obligación legal según la política de privacidad.\n\n'
          '---\n'
          'Enviado desde ${AppConstants.siteUrl}/delete-account',
    );
  }

  static Future<bool> sendDataRequest({
    required String name,
    required String email,
    required String requestType,
    String? ciervoId,
    String? details,
  }) {
    final idLine = ciervoId != null && ciervoId.isNotEmpty
        ? 'ID Ciervo: $ciervoId\n'
        : '';
    final detailsLine = details != null && details.isNotEmpty
        ? 'Detalles adicionales:\n$details\n'
        : '';

    return LandingActions.openEmail(
      email: AppConstants.dataSafetyEmail,
      subject: 'Solicitud de datos personales — ${AppConstants.brandName}',
      body:
          'Tipo de solicitud: $requestType\n\n'
          'Nombre: $name\n'
          'Correo de la cuenta: $email\n'
          '$idLine'
          '$detailsLine'
          '---\n'
          'Enviado desde ${AppConstants.siteUrl}/data-request',
    );
  }
}
