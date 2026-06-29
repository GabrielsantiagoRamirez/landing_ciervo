# CIERVO LANDING - IMPLEMENTACIÓN OFICIAL

Antes de escribir una sola línea de código debes leer completamente los siguientes documentos.

Son el Single Source of Truth (SSOT) del proyecto.

No debes tomar decisiones por tu cuenta si contradicen estos documentos.

Orden de lectura obligatorio:

```
docs/LANDING-SSOT-01-FOUNDATION.md

docs/LANDING-SSOT-02-DESIGN-SYSTEM.md

docs/LANDING-SSOT-03-CONTENT-SEO.md

docs/LANDING-SSOT-04-IMPLEMENTATION.md
```

---

# Objetivo

Construir la Landing oficial de CIERVO utilizando Flutter Web.

La Landing será el sitio público oficial de la plataforma.

Debe estar preparada para:

* Google Play
* Apple App Store
* Marketing
* Clientes
* Negocios
* SEO
* Escalabilidad futura

No es un prototipo.

Debe quedar lista para producción.

---

# Tecnología

Utilizar únicamente Flutter Web.

No utilizar React.

No utilizar HTML manual.

No utilizar Bootstrap.

No utilizar Tailwind.

Toda la interfaz debe desarrollarse mediante Flutter.

---

# Arquitectura

Respetar estrictamente la arquitectura Feature First definida en el SSOT.

No crear estructuras alternativas.

No mezclar responsabilidades.

Todos los widgets deben ser reutilizables.

---

# Diseño

Implementar exactamente el Design System.

No modificar:

Colores

Tipografías

Espaciados

Animaciones

Radius

Sombras

Navbar

Footer

Componentes

No improvisar estilos.

---

# Responsive

Debe funcionar correctamente en:

320

360

390

414

430

768

1024

1280

1440

1600

1920

No debe existir:

RenderFlex Overflow

Bottom Overflow

Pixel Overflow

Texto cortado

Botones fuera de pantalla

Scroll horizontal

---

# Contenido

Utilizar exclusivamente el contenido definido en:

LANDING-SSOT-03-CONTENT-SEO.md

No inventar textos.

No inventar funcionalidades.

No inventar estadísticas.

Todo contenido dinámico deberá prepararse para obtenerse posteriormente desde backend.

---

# Navegación

Implementar:

Navbar fija.

Scroll suave.

Navegación entre secciones.

Páginas independientes:

Privacy

Terms

Delete Account

Support

404

---

# Componentes

Crear componentes reutilizables para:

PrimaryButton

SecondaryButton

FeatureCard

MembershipCard

PhoneMockup

AnimatedCounter

GlassNavbar

Footer

FAQ

ResponsiveContainer

SectionTitle

SectionSubtitle

HeroBackground

SocialButton

DownloadBadge

No duplicar código.

---

# Animaciones

Todas las animaciones deben ser suaves.

Fade.

Slide.

Scale ligera.

Hover.

Focus.

No utilizar animaciones exageradas.

---

# Mockups

Preparar la Landing para mostrar mockups reales de la aplicación.

Mientras no existan imágenes oficiales utilizar placeholders claramente identificados.

Toda la lógica deberá permitir reemplazarlos fácilmente.

---

# Assets

Organizar correctamente:

logos/

icons/

images/

mockups/

animations/

No dejar archivos sin utilizar.

---

# Tema

Crear un Theme centralizado.

No hardcodear colores.

No hardcodear tamaños.

No hardcodear tipografías.

---

# SEO

Implementar:

Meta Title

Meta Description

Open Graph

Twitter Cards

robots.txt

manifest

sitemap.xml

favicon

Canonical

Schema.org

---

# Accesibilidad

Toda la Landing debe cumplir:

Navegación por teclado.

Contraste suficiente.

Focus visible.

Semántica.

Lectores de pantalla.

---

# Rendimiento

Optimizar para obtener Lighthouse:

Performance >= 90

Accessibility >= 95

SEO >= 95

Best Practices >= 95

Optimizar imágenes.

Utilizar widgets const cuando sea posible.

Evitar rebuilds innecesarios.

---

# Calidad

No utilizar:

TODO

FIXME

Widgets gigantes

Código duplicado

Magic Numbers

Hardcoded Colors

Hardcoded Strings

---

# Código

Mantener un estilo consistente.

Documentar únicamente cuando aporte valor.

Preferir nombres claros.

Componentes pequeños.

Responsabilidad única.

---

# Google Play

Preparar la Landing para cumplir los requisitos oficiales.

Debe existir:

Privacy Policy

Terms of Service

Delete Account

Support

Contacto

---

# App Store

La Landing también debe cumplir los requisitos necesarios para Apple.

---

# Entregables

La implementación deberá incluir:

Landing completamente funcional.

Responsive.

SEO.

Accesibilidad.

Tema centralizado.

Componentes reutilizables.

Arquitectura limpia.

Flutter Analyze sin errores.

Flutter Web compilando correctamente.

---

# Validaciones Finales

Antes de finalizar debes ejecutar:

flutter analyze

flutter build web --release

Corregir cualquier advertencia relevante.

No dar la tarea por terminada mientras existan errores de compilación.

---

# Reporte Final

Al terminar entregar un resumen con:

Archivos creados.

Archivos modificados.

Arquitectura implementada.

Widgets reutilizables creados.

Responsive implementado.

SEO implementado.

Páginas legales implementadas.

Pendientes encontrados.

Mejoras futuras recomendadas.

---

# Reglas Obligatorias

No modificar el contenido del SSOT.

No eliminar funcionalidades definidas.

No simplificar la arquitectura.

No reemplazar Flutter por otra tecnología.

No crear componentes improvisados.

No cambiar la identidad visual.

No hardcodear datos que deban provenir del backend en el futuro.

Toda decisión técnica debe favorecer la mantenibilidad, reutilización y escalabilidad del proyecto.

El resultado debe sentirse como el sitio oficial de una plataforma tecnológica premium, consistente con la identidad de CIERVO y listo para producción.
