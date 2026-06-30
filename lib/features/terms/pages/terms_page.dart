import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_constants.dart';
import '../../../core/services/seo_service.dart';
import '../../../shared/layout/legal_page_layout.dart';
import '../../../shared/widgets/email_link.dart';

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
    final brand = AppConstants.brandName;

    return LegalPageLayout(
      title: 'Términos y Condiciones',
      onBack: () => context.go('/'),
      children: [
        LegalSection(
          heading: 'Información del operador',
          body:
              'Los presentes Términos y Condiciones regulan el acceso y uso de $brand, operado por '
              '${AppConstants.legalEntityName}, con operación inicial en ${AppConstants.operatingCountry}.\n\n'
              'Última actualización: ${AppConstants.termsLastUpdated}\n'
              'Sitio web: ${AppConstants.siteUrl}\n'
              'Correo de soporte: ${AppConstants.supportEmail}',
        ),
        LegalSection(
          heading: '1. Aceptación de los términos',
          body:
              'Al descargar, registrarte o utilizar $brand, aceptas estos Términos y Condiciones y nuestra Política de Privacidad. '
              'Si no estás de acuerdo, no debes utilizar la plataforma.',
        ),
        LegalSection(
          heading: '2. Uso permitido de la plataforma',
          body:
              '$brand es una plataforma digital que conecta usuarios con negocios afiliados para descubrir, reservar, comprar, '
              'pagar y disfrutar experiencias. El uso debe ser lícito, respetuoso y conforme a estos términos. '
              'Queda prohibido el fraude, suplantación de identidad, spam, acoso, manipulación de precios, '
              'uso automatizado no autorizado o cualquier actividad que afecte la seguridad o integridad del servicio.',
        ),
        const LegalSection(
          heading: '3. Obligaciones del usuario',
          body:
              'El usuario se compromete a:\n\n'
              '• Proporcionar información veraz y mantenerla actualizada.\n'
              '• Proteger sus credenciales de acceso.\n'
              '• Utilizar los servicios de forma personal, salvo planes empresariales autorizados.\n'
              '• Respetar a negocios, otros usuarios y al personal de soporte.\n'
              '• Cumplir las políticas de cada negocio afiliado al realizar reservas, compras o pedidos.\n'
              '• No utilizar la plataforma para actividades ilegales o no autorizadas.',
        ),
        LegalSection(
          heading: '4. Responsabilidad de negocios afiliados',
          body:
              'Los negocios afiliados son responsables de la información publicada, disponibilidad, calidad de productos y servicios, '
              'cumplimiento de promociones, atención al cliente y obligaciones legales propias de su actividad. '
              '$brand actúa como intermediario tecnológico y no es el proveedor directo de bienes o servicios ofrecidos por terceros, '
              'salvo que se indique expresamente lo contrario.',
        ),
        LegalSection(
          heading: '5. Pagos mediante Mercado Pago',
          body:
              'Los pagos en la plataforma pueden procesarse a través de Mercado Pago u otros proveedores autorizados. '
              'Al realizar un pago, aceptas también los términos del proveedor de pagos. '
              '$brand no almacena datos completos de tarjetas de crédito o débito; estos son tratados directamente por el procesador de pagos. '
              'Las comisiones, impuestos y condiciones de cada transacción se mostrarán antes de confirmar el pago.',
        ),
        LegalSection(
          heading: '6. Wallet Ciervo',
          body:
              'El Wallet Ciervo permite recargar saldo y realizar pagos dentro de $brand. '
              'El saldo no constituye un depósito bancario ni genera intereses. '
              'Las recargas, límites, comisiones y restricciones se informarán en la aplicación. '
              'El uso indebido del wallet puede resultar en suspensión de la cuenta.',
        ),
        LegalSection(
          heading: '7. Tarjeta Ciervo',
          body:
              'La Tarjeta Ciervo (virtual o física, según disponibilidad) está sujeta a términos adicionales que se presentan al activarla. '
              'El usuario es responsable de su uso y de notificar pérdida o uso no autorizado. '
              '$brand y sus aliados pueden establecer límites, bloqueos y verificaciones de identidad.',
        ),
        const LegalSection(
          heading: '8. Reservas',
          body:
              'Las reservas de mesas, habitaciones o servicios están sujetas a disponibilidad y políticas del negocio afiliado. '
              'El usuario debe presentarse en el horario acordado y respetar las condiciones de cancelación o modificación. '
              'El incumplimiento reiterado puede afectar la cuenta del usuario.',
        ),
        const LegalSection(
          heading: '9. Eventos',
          body:
              'La compra de entradas para eventos genera un código o boleto digital válido según las condiciones del organizador. '
              'No se garantiza la realización del evento en casos de fuerza mayor; los reembolsos dependerán de la política del organizador y la normativa aplicable.',
        ),
        LegalSection(
          heading: '10. Promociones',
          body:
              'Las promociones tienen vigencia, stock y condiciones definidas por cada negocio. '
              'No son acumulables salvo indicación expresa. $brand puede retirar promociones fraudulentas o mal utilizadas.',
        ),
        LegalSection(
          heading: '11. Delivery',
          body:
              'Los pedidos de domicilio dependen de la disponibilidad del negocio, zona de cobertura, tiempos estimados y tarifas informadas al confirmar. '
              'Los retrasos por causas externas (tráfico, clima, alta demanda) no siempre generan derecho a reembolso. '
              'Reclamos sobre productos entregados deben dirigirse al negocio y, si corresponde, a soporte de $brand.',
        ),
        const LegalSection(
          heading: '12. Chat',
          body:
              'El chat permite comunicación entre usuarios, negocios y soporte. '
              'Está prohibido enviar contenido ofensivo, ilegal, publicitario no autorizado o que vulnere derechos de terceros. '
              'Podemos moderar, restringir o eliminar mensajes que violen estos términos.',
        ),
        const LegalSection(
          heading: '13. Cancelaciones',
          body:
              'Las cancelaciones de reservas, pedidos o compras se rigen por la política del negocio afiliado y el tipo de servicio. '
              'Algunas cancelaciones pueden no ser reembolsables o estar sujetas a cargos. '
              'Revisa siempre las condiciones antes de confirmar.',
        ),
        LegalSection(
          heading: '14. Reembolsos',
          body:
              'Los reembolsos, cuando procedan, se procesarán por el mismo medio de pago o según la política del negocio y del proveedor de pagos. '
              'Los plazos de acreditación dependen de Mercado Pago, entidades financieras u otros intermediarios. '
              '$brand gestionará solicitudes legítimas en coordinación con el negocio correspondiente.',
        ),
        const LegalSection(
          heading: '15. Suspensión de cuentas',
          body:
              'Nos reservamos el derecho de suspender o cancelar cuentas que violen estos términos, realicen fraude, '
              'generen chargebacks indebidos, abusen del soporte o representen riesgo para la plataforma, usuarios o negocios. '
              'En casos graves, podremos retener temporalmente fondos del wallet mientras se investiga una disputa, dentro de los límites legales.',
        ),
        LegalSection(
          heading: '16. Propiedad intelectual',
          body:
              'El nombre $brand, el logotipo ${AppConstants.logoName}, diseño, software, textos y contenido de la plataforma son propiedad de '
              '${AppConstants.legalEntityName} o sus licenciantes. Queda prohibida su reproducción, distribución o uso comercial sin autorización escrita.',
        ),
        LegalSection(
          heading: '17. Limitación de responsabilidad',
          body:
              'La plataforma se ofrece "tal cual" dentro de los límites permitidos por la ley colombiana. '
              '$brand no garantiza disponibilidad ininterrumpida ni ausencia de errores. '
              'No seremos responsables por daños indirectos, lucro cesante o decisiones tomadas con base en información de terceros.',
        ),
        const LegalSection(
          heading: '18. Legislación aplicable',
          body:
              'Estos términos se rigen por las leyes de la República de Colombia. '
              'Cualquier controversia será sometida a los tribunales competentes de Colombia, '
              'sin perjuicio de los derechos que asistan a los consumidores conforme a la normativa de protección al consumidor.',
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '19. Contacto',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Para consultas sobre estos términos:',
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
