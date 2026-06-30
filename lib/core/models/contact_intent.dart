enum ContactIntentType { general, business, enterprise }

class ContactIntent {
  const ContactIntent({
    required this.type,
    required this.subject,
    required this.message,
    this.highlightText,
  });

  final ContactIntentType type;
  final String subject;
  final String message;
  final String? highlightText;

  factory ContactIntent.business() => const ContactIntent(
        type: ContactIntentType.business,
        subject: 'Registro de negocio - Ciervo Club',
        message:
            'Hola, me interesa registrar mi negocio en Ciervo Club.\n\nNombre del negocio:\nCiudad:\nTipo de negocio:\n',
        highlightText: 'Completa el formulario para registrar tu negocio.',
      );

  factory ContactIntent.enterprise() => const ContactIntent(
        type: ContactIntentType.enterprise,
        subject: 'Planes empresariales - Ciervo Club',
        message:
            'Hola, solicito una asesoría para planes empresariales.\n\nEmpresa:\nNúmero de empleados:\nCiudad:\n',
        highlightText:
            'Solicita una asesoría para planes empresariales.',
      );
}
