import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/services/seo_service.dart';
import '../../../shared/layout/legal_page_layout.dart';

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
    return LegalPageLayout(
      title: 'Política de Privacidad',
      onBack: () => context.go('/'),
      children: [
        const LegalSection(
          heading: '1. Información que recopilamos',
          body:
              'CIERVO puede recopilar información personal que usted proporciona directamente al crear una cuenta, realizar transacciones o contactar al soporte. Esto puede incluir nombre, correo electrónico, número de teléfono, información de perfil y datos de uso de la aplicación.',
        ),
        LegalSection(
          heading: '2. Uso de la información',
          body:
              'Utilizamos la información recopilada para proporcionar, mantener y mejorar nuestros servicios, procesar transacciones, comunicarnos con usted, personalizar su experiencia y cumplir con obligaciones legales.',
        ),
        LegalSection(
          heading: '3. Cookies y tecnologías similares',
          body:
              'Nuestro sitio web y aplicación pueden utilizar cookies y tecnologías similares para mejorar la experiencia del usuario, analizar el tráfico y recordar preferencias. Puede configurar su navegador para rechazar cookies.',
        ),
        LegalSection(
          heading: '4. Proveedores de servicios',
          body:
              'Compartimos información con proveedores de confianza que nos ayudan a operar la plataforma, incluyendo procesadores de pago como Mercado Pago, servicios de hosting y herramientas de análisis. Estos proveedores están obligados a proteger su información.',
        ),
        LegalSection(
          heading: '5. Seguridad',
          body:
              'Implementamos medidas de seguridad técnicas y organizativas para proteger su información personal contra acceso no autorizado, alteración, divulgación o destrucción. Utilizamos conexiones cifradas (HTTPS) para todas las comunicaciones.',
        ),
        LegalSection(
          heading: '6. Sus derechos',
          body:
              'Usted tiene derecho a acceder, corregir, eliminar o portar sus datos personales. También puede oponerse al procesamiento de sus datos o solicitar la limitación del mismo. Para ejercer estos derechos, contacte a ${AppConstants.supportEmail}.',
        ),
        const LegalSection(
          heading: '7. Retención de datos',
          body:
              'Conservamos su información personal mientras su cuenta esté activa o según sea necesario para proporcionar servicios, cumplir obligaciones legales, resolver disputas y hacer cumplir nuestros acuerdos.',
        ),
        LegalSection(
          heading: '8. Contacto',
          body:
              'Para preguntas sobre esta política de privacidad, contacte a ${AppConstants.supportEmail}.',
        ),
      ],
    );
  }
}
