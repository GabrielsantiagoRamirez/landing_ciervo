import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/services/seo_service.dart';
import '../../../shared/layout/legal_page_layout.dart';
import '../../../shared/widgets/email_link.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({super.key});

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  @override
  void initState() {
    super.initState();
    SeoService.updatePrivacy();
  }

  @override
  Widget build(BuildContext context) {
    final brand = AppConstants.brandName;

    return LegalPageLayout(
      title: 'Política de Privacidad',
      onBack: () => context.go('/'),
      children: [
        LegalSection(
          heading: 'Información general',
          body:
              'La presente Política de Privacidad describe cómo ${AppConstants.legalEntityName} ("nosotros", "nuestro" o el "Operador") trata los datos personales de los usuarios de $brand, incluyendo la aplicación móvil y el sitio web ${AppConstants.siteUrl}.\n\n'
              'Razón social: ${AppConstants.legalEntityName}\n'
              'País de operación: ${AppConstants.operatingCountry}\n'
              'Última actualización: ${AppConstants.privacyLastUpdated}\n'
              'Correo oficial de soporte: ${AppConstants.supportEmail}',
        ),
        LegalSection(
          heading: '1. Información que recopilamos',
          body:
              'Podemos recopilar las siguientes categorías de información personal cuando utilizas $brand:\n\n'
              '• Nombre completo o nombre de perfil.\n'
              '• Correo electrónico.\n'
              '• Número de teléfono.\n'
              '• Fotografía de perfil.\n'
              '• Ubicación (GPS o aproximada) para mostrar negocios, eventos y servicios cercanos.\n'
              '• Cámara: para tomar fotografías de perfil, escanear códigos QR o adjuntar imágenes en el chat.\n'
              '• Galería o almacenamiento: para seleccionar imágenes desde tu dispositivo.\n'
              '• Notificaciones push: identificadores de dispositivo para enviarte alertas de reservas, pedidos, promociones y mensajes.\n'
              '• Información del dispositivo: modelo, sistema operativo, identificadores únicos, idioma e IP.\n'
              '• Datos de reservas: fecha, hora, establecimiento, número de personas y estado de la reserva.\n'
              '• Datos de pagos: referencias de transacción, montos y estado (los datos sensibles de tarjeta son procesados por proveedores externos).\n'
              '• Wallet: saldo, movimientos, recargas y pagos realizados con el monedero digital de $brand.\n'
              '• Tarjeta Ciervo: información asociada a tu tarjeta virtual o física dentro de la plataforma.\n'
              '• Mensajes del chat: contenido de conversaciones entre usuarios, negocios y soporte.\n'
              '• Preferencias del usuario: membresía, notificaciones, favoritos, historial de búsqueda e intereses.',
        ),
        const LegalSection(
          heading: '2. Finalidad del tratamiento de datos',
          body:
              'Utilizamos tus datos personales para:\n\n'
              '• Crear, administrar y autenticar tu cuenta.\n'
              '• Proporcionar las funcionalidades de la plataforma: reservas, eventos, promociones, delivery, chat, wallet y Tarjeta Ciervo.\n'
              '• Procesar pagos y transacciones a través de proveedores autorizados.\n'
              '• Enviar notificaciones sobre tu actividad, pedidos y actualizaciones del servicio.\n'
              '• Personalizar tu experiencia y mostrar contenido relevante según tu ubicación y preferencias.\n'
              '• Brindar soporte al cliente y responder consultas.\n'
              '• Prevenir fraude, abuso y actividades no autorizadas.\n'
              '• Cumplir obligaciones legales, fiscales y regulatorias en Colombia.\n'
              '• Mejorar la seguridad, el rendimiento y el desarrollo de nuevos servicios.',
        ),
        const LegalSection(
          heading: '3. Conservación de datos',
          body:
              'Conservamos tus datos personales mientras tu cuenta esté activa y sea necesario para prestarte el servicio. '
              'Una vez solicitada la eliminación de la cuenta, eliminaremos o anonimizaremos la información personal '
              'en un plazo máximo de 30 días hábiles, salvo que debamos conservar ciertos datos por obligación legal, '
              'fiscal, contable, de prevención de fraude o defensa de reclamaciones. '
              'Los registros de transacciones y facturación pueden conservarse durante los plazos exigidos por la legislación colombiana.',
        ),
        const LegalSection(
          heading: '4. Eliminación de cuenta',
          body:
              'Puedes solicitar la eliminación de tu cuenta en cualquier momento desde la aplicación '
              '(Configuración > Cuenta > Eliminar cuenta) o a través de la página de eliminación de cuenta en nuestro sitio web. '
              'Al eliminar tu cuenta, se suprimirán tu perfil, preferencias, historial visible en la app, '
              'datos de membresía y la mayor parte de la información personal asociada. '
              'Consulta la sección "Datos que deben conservarse" en la página de eliminación de cuenta para más detalle.',
        ),
        const LegalSection(
          heading: '5. Derechos del usuario',
          body:
              'De acuerdo con la Ley 1581 de 2012 y el Decreto 1377 de 2013 de Colombia, tienes derecho a:\n\n'
              '• Conocer, actualizar y rectificar tus datos personales.\n'
              '• Solicitar prueba de la autorización otorgada.\n'
              '• Ser informado sobre el uso de tus datos.\n'
              '• Presentar quejas ante la Superintendencia de Industria y Comercio (SIC).\n'
              '• Revocar la autorización y/o solicitar la supresión de tus datos cuando sea procedente.\n'
              '• Acceder de forma gratuita a tus datos personales.\n\n'
              'Para ejercer estos derechos, contáctanos al correo oficial de soporte indicado en esta política.',
        ),
        const LegalSection(
          heading: '6. Cookies y tecnologías similares (landing web)',
          body:
              'Nuestro sitio web puede utilizar cookies y tecnologías similares para recordar preferencias, '
              'analizar el tráfico y mejorar la experiencia de navegación. Las cookies esenciales permiten el '
              'funcionamiento básico del sitio. Puedes configurar tu navegador para rechazar o eliminar cookies, '
              'aunque algunas funciones del sitio podrían verse afectadas. La aplicación móvil puede utilizar '
              'identificadores de dispositivo y almacenamiento local con fines similares.',
        ),
        const LegalSection(
          heading: '7. Seguridad de la información',
          body:
              'Implementamos medidas técnicas, administrativas y organizativas para proteger tu información '
              'personal contra acceso no autorizado, pérdida, alteración o divulgación. Utilizamos conexiones '
              'cifradas (HTTPS/TLS), controles de acceso, autenticación segura y buenas prácticas de desarrollo. '
              'Ningún sistema es 100 % infalible; te recomendamos proteger tus credenciales y notificarnos '
              'ante cualquier uso sospechoso de tu cuenta.',
        ),
        LegalSection(
          heading: '8. Proveedores de servicios externos',
          body:
              'Compartimos información con proveedores de confianza que nos ayudan a operar $brand, siempre bajo '
              'obligaciones de confidencialidad y protección de datos. Entre ellos:\n\n'
              '• Google Firebase: autenticación, base de datos, almacenamiento, analítica, mensajería y notificaciones push.\n'
              '• Google Maps: mapas, geolocalización y direcciones.\n'
              '• Mercado Pago: procesamiento de pagos, wallet y transacciones financieras.\n'
              '• Google Play Services: distribución, actualizaciones, notificaciones y servicios del ecosistema Android.\n\n'
              'Estos proveedores pueden tratar datos conforme a sus propias políticas de privacidad. '
              'Te recomendamos revisarlas para comprender cómo gestionan tu información.',
        ),
        LegalSection(
          heading: '9. Cómo solicitar la eliminación completa de tu información',
          body:
              'Para solicitar la eliminación total de tu cuenta y datos personales:\n\n'
              '1. Desde la app: Configuración > Cuenta > Eliminar cuenta.\n'
              '2. Desde la web: visita ${AppConstants.siteUrl}/delete-account y completa el formulario.\n'
              '3. Por correo: escribe a ${AppConstants.supportEmail} con el asunto "Eliminación de cuenta" e indica el correo asociado a tu cuenta.\n\n'
              'Procesaremos tu solicitud en un plazo máximo de 30 días hábiles y te enviaremos confirmación por correo electrónico.',
        ),
        LegalSection(
          heading: '10. Menores de edad',
          body:
              '$brand no está dirigido a menores de 14 años sin supervisión de un padre, madre o tutor. '
              'Los perfiles infantiles (Kids) requieren configuración y autorización de un adulto responsable. '
              'Si detectamos que se han recopilado datos de un menor sin el consentimiento adecuado, '
              'procederemos a eliminarlos.',
        ),
        const LegalSection(
          heading: '11. Cambios a esta política',
          body:
              'Podemos actualizar esta Política de Privacidad periódicamente. Publicaremos la versión vigente '
              'en esta página con la fecha de última actualización. El uso continuado de la plataforma después '
              'de los cambios implica tu aceptación de la política revisada.',
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '12. Contacto',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Para preguntas sobre esta política o el tratamiento de tus datos, contáctanos en:',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 8),
              EmailLink(email: AppConstants.supportEmail),
            ],
          ),
        ),
      ],
    );
  }
}
