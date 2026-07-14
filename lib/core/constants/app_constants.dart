abstract final class AppConstants {
  /// Nombre del logotipo (marca visual).
  static const String logoName = 'CIERVO';

  /// Marca comercial oficial.
  static const String brandName = 'Ciervo Club';

  static const String logoPath = 'assets/logos/icon_sin_fondo.png';
  static const String siteUrl = 'https://ciervo.club';
  static const String supportEmail = 'gabrielsabtiago716@gmail.com';
  static const String contactEmail = 'gabrielsabtiago716@gmail.com';

  /// Destino temporal para solicitudes de privacidad hasta disponer de endpoint API.
  static const String dataSafetyEmail = 'gabrielsabtiago716@gmail.com';
  static const String whatsappNumber = '';

  /// Razón social del operador de la plataforma.
  static const String legalEntityName = 'Ciervo Club S.A.S.';

  /// País de operación inicial.
  static const String operatingCountry = 'Colombia';

  /// Fechas de última actualización de documentos legales.
  static const String privacyLastUpdated = '29 de junio de 2026';
  static const String termsLastUpdated = '29 de junio de 2026';

  /// Cambiar a `true` y completar las URLs de tienda cuando la app esté publicada.
  static const bool appsPublished = false;

  static String copyrightText() =>
      '© ${DateTime.now().year} $brandName. Todos los derechos reservados.';

  /// Compatibilidad con referencias al nombre del logo.
  static const String appName = logoName;
}
