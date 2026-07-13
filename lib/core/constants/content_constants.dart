abstract final class ContentConstants {
  // Hero
  static const String heroTitle =
      'Descubre, reserva, compra y disfruta desde una sola aplicación.';
  static const String heroSubtitle =
      'Ciervo Club conecta personas, negocios y experiencias en una única plataforma. Descubre restaurantes, hoteles, eventos, promociones, domicilios y mucho más, todo desde una experiencia moderna, rápida y segura.';
  static const String heroPrimaryCta = 'Reservar App';
  static const String heroSecondaryCta = 'Explorar funcionalidades';
  static const String merchantLoginCta = '¿Eres un comercio? Ingresa por aquí';

  // Presence
  static const String presenceTitle = 'Disponible en Chile y Colombia';
  static const String presenceSubtitle =
      'Ciervo Club ya está presente en dos países, conectando personas y negocios en la región.';
  static const List<CountryPresence> presenceCountries = [
    CountryPresence(name: 'Chile', code: 'CL'),
    CountryPresence(name: 'Colombia', code: 'CO'),
  ];

  // Stats
  static const List<StatItem> stats = [
    StatItem(value: 100, prefix: '+', label: 'Negocios afiliados'),
    StatItem(value: 10, prefix: '+', label: 'Categorías'),
    StatItem(value: 0, prefix: '', label: 'Pagos seguros', isText: true),
    StatItem(value: 0, prefix: '', label: 'Disponibilidad 24/7', isText: true),
  ];

  // About
  static const String aboutTitle = 'Todo lo que necesitas en un solo lugar.';
  static const String aboutDescription =
      'Ciervo Club reúne múltiples servicios en una única plataforma para facilitar la forma en que descubres, reservas, compras y administras tus experiencias. Desde un restaurante hasta un evento o un domicilio, todo puede gestionarse desde la misma aplicación.';

  // Features grid
  static const String featuresSectionTitle = 'Funcionalidades';
  static const String featuresSectionSubtitle =
      'Todo lo que necesitas para descubrir, reservar y disfrutar en un solo lugar.';
  static const String learnMore = 'Conocer más';

  // Individual features
  static const String walletTitle = 'Wallet';
  static const String walletDescription =
      'Realiza recargas de forma segura y administra tu saldo desde la aplicación. Consulta movimientos, pagos y recargas cuando lo necesites.';

  static const String deliveryTitle = 'Delivery';
  static const String deliveryDescription =
      'Solicita pedidos a negocios afiliados y realiza seguimiento del estado de tu orden.';

  static const String eventsTitle = 'Eventos';
  static const String eventsDescription =
      'Compra entradas para eventos, recibe tu código QR y realiza el ingreso de manera rápida.';

  static const String reservationsTitle = 'Reservas';
  static const String reservationsDescription =
      'Reserva mesas, habitaciones o servicios directamente desde la aplicación.';

  static const String promotionsTitle = 'Promociones';
  static const String promotionsDescription =
      'Descubre descuentos exclusivos disponibles cerca de ti.';

  static const String familyTitle = 'Familia';
  static const String familyDescription =
      'Administra perfiles familiares desde una sola cuenta.';

  static const String kidsTitle = 'Kids';
  static const String kidsDescription =
      'Configura perfiles infantiles con controles parentales y restricciones personalizadas.';

  static const String businessTitle = 'Negocios';
  static const String businessDescription =
      'Gestiona tu establecimiento, promociones, eventos y clientes desde el panel administrativo.';

  // How it works
  static const String howItWorksTitle = 'Cómo funciona';
  static const List<String> howItWorksSteps = [
    'Descarga la aplicación.',
    'Crea tu cuenta.',
    'Explora negocios y servicios.',
    'Reserva, compra o solicita un domicilio.',
    'Disfruta tu experiencia.',
  ];

  // Memberships
  static const String membershipsTitle = 'Membresías';
  static const String membershipsSubtitle =
      'Elige el plan que mejor se adapte a tus necesidades.';
  static const String learnPlan = 'Conocer plan';

  static const String downloadMembershipCta =
      'Descarga la app para elegir tu membresía y activar tus beneficios.';
  static const String enterpriseConsultationCta =
      'Solicita una asesoría para planes empresariales.';
  static const String registerBusinessButton = 'Registrar negocio';
  static const String registerBusinessSubtitle =
      'Únete a Ciervo Club y lleva tu negocio a más clientes.';
  static const String appComingSoonMessage =
      'La aplicación estará disponible próximamente en Google Play y App Store.';
  static const String socialComingSoonMessage =
      'Este enlace estará disponible próximamente.';

  static const List<MembershipItem> memberships = [
    MembershipItem(
      name: 'FREE',
      description: 'Acceso básico a la plataforma.',
      benefits: ['Descubrir negocios', 'Explorar servicios', 'Cuenta personal'],
      category: MembershipCategory.consumer,
    ),
    MembershipItem(
      name: 'PLUS',
      description: 'Beneficios adicionales para usuarios frecuentes.',
      benefits: ['Promociones exclusivas', 'Soporte prioritario', 'Más funciones'],
      category: MembershipCategory.consumer,
    ),
    MembershipItem(
      name: 'GOLD',
      description: 'Experiencia premium con ventajas ampliadas.',
      benefits: ['Descuentos especiales', 'Acceso anticipado', 'Beneficios premium'],
      category: MembershipCategory.consumer,
    ),
    MembershipItem(
      name: 'PLATINUM',
      description: 'El máximo nivel de beneficios para usuarios.',
      benefits: ['Máximos beneficios', 'Atención VIP', 'Experiencias exclusivas'],
      category: MembershipCategory.consumer,
    ),
    MembershipItem(
      name: 'FAMILY',
      description: 'Administra perfiles familiares desde una cuenta.',
      benefits: ['Perfiles familiares', 'Controles parentales', 'Gestión centralizada'],
      category: MembershipCategory.consumer,
    ),
    MembershipItem(
      name: 'BUSINESS',
      description: 'Para negocios que desean crecer en la plataforma.',
      benefits: ['Panel administrativo', 'Promociones', 'Estadísticas'],
      category: MembershipCategory.business,
    ),
    MembershipItem(
      name: 'EMPRESARIAL',
      description: 'Soluciones para empresas medianas.',
      benefits: ['Convenios', 'Beneficios empleados', 'Soporte dedicado'],
      category: MembershipCategory.enterprise,
    ),
    MembershipItem(
      name: 'CORPORATIVO',
      description: 'Planes corporativos a medida.',
      benefits: ['Eventos corporativos', 'Integración empresarial', 'Gestión avanzada'],
      category: MembershipCategory.enterprise,
    ),
  ];

  // Security
  static const String securityTitle = 'Tu información protegida en todo momento.';
  static const String securityDescription =
      'Ciervo Club utiliza conexiones seguras y proveedores de pago confiables para proteger tu información y tus transacciones. Los pagos son gestionados mediante plataformas especializadas como Mercado Pago, según el país disponible.';

  // Business benefits
  static const String businessBenefitsTitle = 'Beneficios para Negocios';
  static const List<String> businessBenefits = [
    'Mayor visibilidad.',
    'Administración de promociones.',
    'Gestión de eventos.',
    'Reservas.',
    'Pedidos.',
    'Clientes.',
    'Estadísticas.',
    'Membresías.',
  ];

  // FAQ
  static const String faqTitle = 'Preguntas Frecuentes';
  static const List<FaqItem> faqItems = [
    FaqItem(
      question: '¿Qué es Ciervo Club?',
      answer:
          'Es una plataforma que conecta usuarios con negocios y servicios desde una única aplicación. Puedes descubrir lugares, reservar, comprar entradas, pedir domicilios y más.',
    ),
    FaqItem(
      question: '¿Cómo descargo la aplicación?',
      answer: 'Desde Google Play o App Store cuando esté disponible.',
    ),
    FaqItem(
      question: '¿Cómo puedo registrar mi negocio?',
      answer:
          'Si eres un comercio, ingresa al panel administrativo desde el enlace de la página o contacta al equipo para registrarte.',
    ),
    FaqItem(
      question: '¿Qué métodos de pago existen?',
      answer:
          'Los métodos disponibles dependen del país y de las integraciones habilitadas.',
    ),
    FaqItem(
      question: '¿Cómo funcionan las membresías?',
      answer:
          'Las membresías ofrecen beneficios y límites diferentes según el plan seleccionado.',
    ),
    FaqItem(
      question: '¿Puedo cancelar mi cuenta?',
      answer:
          'Sí. Existe una página específica para solicitar la eliminación de la cuenta.',
    ),
    FaqItem(
      question: '¿Mi información está protegida?',
      answer:
          'Sí. La plataforma utiliza conexiones seguras y buenas prácticas de seguridad.',
    ),
  ];

  // Download
  static const String downloadTitle = 'Descarga Ciervo Club';
  static const String comingSoon = 'Disponible próximamente';

  // Contact
  static const String contactTitle = 'Contacto';
  static const String contactSubtitle =
      '¿Tienes preguntas? Estamos aquí para ayudarte.';
  static const String contactName = 'Nombre';
  static const String contactEmail = 'Correo';
  static const String contactMessage = 'Mensaje';
  static const String contactSend = 'Enviar';
  static const String contactSuccess =
      'Mensaje enviado. Te contactaremos pronto.';

  // Footer
  static const String footerDescription =
      'Ciervo Club conecta personas, negocios y experiencias en una única plataforma moderna, rápida y segura.';

  // Navbar
  static const List<NavItem> navItems = [
    NavItem(label: 'Inicio', sectionKey: 'hero'),
    NavItem(label: 'Características', sectionKey: 'features'),
    NavItem(label: 'Membresías', sectionKey: 'memberships'),
    NavItem(label: 'Negocios', sectionKey: 'business'),
    NavItem(label: 'FAQ', sectionKey: 'faq'),
    NavItem(label: 'Contacto', sectionKey: 'contact'),
  ];
  static const String navDownload = 'Reservar App';
}

class CountryPresence {
  const CountryPresence({required this.name, required this.code});

  final String name;
  final String code;
}

enum MembershipCategory { consumer, business, enterprise }

class StatItem {
  const StatItem({
    required this.value,
    required this.prefix,
    required this.label,
    this.isText = false,
  });

  final int value;
  final String prefix;
  final String label;
  final bool isText;
}

class MembershipItem {
  const MembershipItem({
    required this.name,
    required this.description,
    required this.benefits,
    required this.category,
  });

  final String name;
  final String description;
  final List<String> benefits;
  final MembershipCategory category;
}

class FaqItem {
  const FaqItem({required this.question, required this.answer});

  final String question;
  final String answer;
}

class NavItem {
  const NavItem({required this.label, required this.sectionKey});

  final String label;
  final String sectionKey;
}
