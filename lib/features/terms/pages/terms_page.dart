import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/services/seo_service.dart';
import '../../../shared/layout/legal_page_layout.dart';

class TermsPage extends StatefulWidget {
  const TermsPage({super.key});

  @override
  State<TermsPage> createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsPage> {
  @override
  void initState() {
    super.initState();
    SeoService.updateTerms();
  }

  @override
  Widget build(BuildContext context) {
    return LegalPageLayout(
      title: 'Términos y Condiciones',
      onBack: () => context.go('/'),
      children: [
        const LegalSection(
          heading: '1. Aceptación de los términos',
          body:
              'Al acceder o utilizar CIERVO, usted acepta estar sujeto a estos Términos y Condiciones. Si no está de acuerdo con alguna parte de estos términos, no debe utilizar la plataforma.',
        ),
        LegalSection(
          heading: '2. Uso permitido',
          body:
              'CIERVO está destinado a conectar usuarios con negocios y servicios. Usted se compromete a utilizar la plataforma de manera legal, respetuosa y conforme a estos términos. Queda prohibido el uso fraudulento, abusivo o que infrinja derechos de terceros.',
        ),
        LegalSection(
          heading: '3. Cuentas de usuario',
          body:
              'Usted es responsable de mantener la confidencialidad de sus credenciales de acceso y de todas las actividades que ocurran bajo su cuenta. Debe notificarnos inmediatamente cualquier uso no autorizado.',
        ),
        LegalSection(
          heading: '4. Propiedad intelectual',
          body:
              'Todo el contenido, marcas, logotipos y software de CIERVO son propiedad de CIERVO o sus licenciantes. No se otorga ninguna licencia para usar dicho contenido sin autorización previa por escrito.',
        ),
        LegalSection(
          heading: '5. Suspensión de cuentas',
          body:
              'Nos reservamos el derecho de suspender o terminar cuentas que violen estos términos, realicen actividades fraudulentas o representen un riesgo para la plataforma o sus usuarios.',
        ),
        LegalSection(
          heading: '6. Limitaciones de responsabilidad',
          body:
              'CIERVO actúa como intermediario entre usuarios y negocios. No somos responsables de la calidad de productos o servicios ofrecidos por terceros. La plataforma se proporciona "tal cual" dentro de los límites permitidos por la ley.',
        ),
        LegalSection(
          heading: '7. Legislación aplicable',
          body:
              'Estos términos se rigen por las leyes aplicables en la jurisdicción donde opera CIERVO. Cualquier disputa será resuelta ante los tribunales competentes de dicha jurisdicción.',
        ),
        LegalSection(
          heading: '8. Contacto',
          body:
              'Para consultas sobre estos términos, contacte a ${AppConstants.supportEmail}.',
        ),
      ],
    );
  }
}
