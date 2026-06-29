# CIERVO LANDING

## Single Source of Truth (SSOT)

### Documento 04 - Implementation Guide

**Versión:** 1.0

**Estado:** Aprobado

**Tecnología:** Flutter Web

---

# 1. Objetivo

Este documento define la implementación técnica obligatoria de la Landing oficial de CIERVO.

Cursor deberá implementar el proyecto siguiendo exclusivamente este documento y los demás documentos SSOT.

No deberá inventar arquitectura, componentes, estilos ni estructura.

---

# 2. Tecnologías

Flutter Stable

Material Design 3

Dart Stable

Google Fonts

go_router

flutter_animate

visibility_detector

url_launcher

font_awesome_flutter

No utilizar paquetes innecesarios.

---

# 3. Arquitectura

Feature First

```text
lib/

app/

core/

features/

shared/

assets/
```

---

# 4. Core

Debe existir un módulo core.

```text
core/

theme/

constants/

routing/

extensions/

utils/

services/
```

---

# 5. Shared

Todos los widgets reutilizables estarán aquí.

```text
shared/

buttons/

cards/

dialogs/

layout/

animations/

widgets/
```

Nunca duplicar componentes.

---

# 6. Features

Cada sección será completamente independiente.

```text
hero/

features/

wallet/

delivery/

events/

memberships/

business/

faq/

contact/

footer/

privacy/

terms/

delete_account/

support/
```

Cada feature tendrá:

```text
widgets/

pages/

models/

controllers/
```

---

# 7. Rutas

Utilizar go_router.

Rutas oficiales.

```text
/

privacy

terms

delete-account

support

404
```

No crear rutas adicionales.

---

# 8. Assets

```text
assets/

images/

icons/

logos/

animations/

mockups/
```

Todo registrado en pubspec.

---

# 9. Imágenes

Formato:

WebP

SVG

PNG únicamente cuando sea necesario.

No utilizar JPG pesados.

---

# 10. Mockups

Los mockups del teléfono deberán mostrarse mediante widgets reutilizables.

Nunca incrustar imágenes directamente en cada sección.

Crear:

PhoneMockupWidget

---

# 11. Responsive

Crear clase:

AppBreakpoints

Con:

```text
mobile

tablet

desktop

largeDesktop
```

Nunca usar:

```dart
MediaQuery.of(context).size.width > 800
```

en múltiples lugares.

Todo centralizado.

---

# 12. Layout

Crear widget:

ResponsiveContainer

Que defina automáticamente:

Padding

MaxWidth

Spacing

---

# 13. Scroll

Single Page.

Utilizar ScrollController.

Cada botón del menú desplazará suavemente hacia la sección correspondiente.

Duración:

500 ms.

---

# 14. Navbar

Crear:

GlassNavbar

Debe incluir:

Logo

Links

CTA principal

Cambiar ligeramente al hacer scroll.

---

# 15. Hero

Crear:

HeroSection

Debe incluir:

Título

Descripción

Botones

Mockup

Background

Animaciones

---

# 16. Feature Cards

Crear componente reutilizable.

FeatureCard

Debe aceptar:

Icono

Título

Descripción

Acción

---

# 17. Membership Card

Crear:

MembershipCard

Datos dinámicos desde backend.

No hardcodear precios.

---

# 18. FAQ

Crear:

FAQAccordion

Animación de apertura.

No reinventar múltiples acordeones.

---

# 19. Footer

Crear:

FooterSection

Con columnas reutilizables.

---

# 20. Animaciones

Utilizar flutter_animate.

Todas las secciones deben aparecer mediante:

Fade

Slide

Scale ligera cuando aplique

No usar animaciones excesivas.

---

# 21. Lazy Loading

Las imágenes grandes deben cargarse únicamente cuando entren al viewport.

Utilizar VisibilityDetector cuando sea necesario.

---

# 22. Performance

Evitar rebuilds innecesarios.

Widgets const.

Dividir widgets grandes.

No realizar cálculos en build().

---

# 23. Estado

La Landing no requiere gestor de estado complejo.

Utilizar StatefulWidget únicamente cuando sea necesario.

El resto deberá ser StatelessWidget.

---

# 24. Tema

Crear:

AppTheme

AppColors

AppTypography

AppSpacing

AppAnimations

AppRadius

AppShadows

Todo el proyecto consumirá estas clases.

---

# 25. Componentes Obligatorios

PrimaryButton

SecondaryButton

DownloadBadge

FeatureCard

MembershipCard

SectionTitle

SectionSubtitle

PhoneMockup

AnimatedCounter

GlassNavbar

FooterColumn

FAQItem

SocialButton

ResponsiveContainer

AnimatedSection

HeroBackground

No crear variantes innecesarias.

---

# 26. SEO Técnico

Implementar soporte para:

Title

Description

Open Graph

Twitter Card

Canonical

Schema.org

Manifest

Favicons

robots.txt

sitemap.xml

---

# 27. Accesibilidad

Todo botón tendrá tooltip.

Las imágenes decorativas deberán marcarse como tales.

El texto deberá mantener contraste suficiente.

Toda la navegación será posible mediante teclado.

---

# 28. Enlaces

Todos los enlaces externos deberán abrirse mediante url_launcher.

Preparar constantes para:

Google Play

App Store

Privacy

Terms

Support

Contacto

---

# 29. Internacionalización

La arquitectura deberá permitir agregar i18n posteriormente.

No hardcodear textos directamente dentro de widgets.

Centralizar contenido cuando sea posible.

---

# 30. Lighthouse

Objetivos mínimos.

Performance

≥ 90

Accessibility

≥ 95

Best Practices

≥ 95

SEO

≥ 95

---

# 31. Calidad

No utilizar código duplicado.

No utilizar números mágicos.

No utilizar colores hardcodeados.

No utilizar tamaños hardcodeados.

---

# 32. Build

El proyecto deberá compilar sin:

Warnings críticos

Errores

Overflow

RenderFlex

Layouts rotos

---

# 33. Compatibilidad

Desktop

Chrome

Edge

Firefox

Safari

Tablet

Android

iPad

Móvil

Android

iPhone

---

# 34. Checklist de Implementación

Antes de considerar la Landing terminada, verificar:

✅ Responsive en todos los breakpoints definidos.

✅ Navbar fija y funcional.

✅ Hero completamente adaptativo.

✅ Todas las secciones implementadas.

✅ Animaciones fluidas.

✅ Sin overflows.

✅ Sin RenderFlex.

✅ Sin excepciones en consola.

✅ Sin assets faltantes.

✅ Imágenes optimizadas.

✅ SEO implementado.

✅ robots.txt.

✅ sitemap.xml.

✅ manifest.

✅ Open Graph.

✅ Twitter Cards.

✅ Privacy Policy.

✅ Terms of Service.

✅ Delete Account.

✅ Support.

✅ Contacto.

✅ Build Flutter Web exitoso.

---

# 35. Criterios de Aceptación

La Landing será considerada finalizada únicamente cuando:

* Cumpla íntegramente los cuatro documentos SSOT.
* Mantenga una identidad visual consistente con la aplicación móvil.
* Sea completamente responsive.
* Obtenga una puntuación alta en Lighthouse.
* Esté lista para producción y para cumplir los requisitos de Google Play y App Store.
* Pueda desplegarse sin modificaciones adicionales en el entorno de producción.

No deberán quedar elementos provisionales, componentes duplicados ni decisiones de diseño fuera de esta especificación.
