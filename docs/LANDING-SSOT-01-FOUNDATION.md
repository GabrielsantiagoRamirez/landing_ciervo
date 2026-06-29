# CIERVO LANDING

## Single Source of Truth (SSOT)

### Documento 01 - Foundation

**Versión:** 1.0

**Estado:** Aprobado

**Proyecto:** CIERVO

**Tecnología:** Flutter Web

**Última actualización:** 2026-06-29

---

# 1. Objetivo

Este documento define las reglas oficiales para el desarrollo de la Landing oficial de CIERVO.

Todo desarrollador, diseñador o herramienta de IA deberá seguir este documento.

Ninguna decisión de diseño, arquitectura o contenido deberá tomarse fuera de este SSOT.

Cualquier modificación futura deberá realizarse primero en este documento.

---

# 2. Objetivos de la Landing

La landing debe cumplir simultáneamente cinco objetivos:

## 2.1 Marketing

Presentar CIERVO como una plataforma tecnológica moderna, premium y confiable.

---

## 2.2 Conversión

Lograr que el visitante realice alguna acción:

* Descargar la App
* Registrar un negocio
* Conocer las membresías
* Contactar al equipo
* Compartir el sitio

---

## 2.3 Información

Explicar claramente qué es CIERVO.

Qué problemas resuelve.

Cómo funciona.

Por qué utilizarla.

---

## 2.4 Cumplimiento

Servir como sitio oficial requerido por:

Google Play

Apple App Store

Mercado Pago

Políticas de privacidad

Eliminación de cuentas

Términos y condiciones

Soporte

---

## 2.5 Escalabilidad

La arquitectura debe permitir agregar en el futuro:

Blog

Noticias

Portal Empresarial

Portal Partners

Portal Inversionistas

Documentación Pública

Centro de Ayuda

Multiidioma

Sin rehacer el proyecto.

---

# 3. Público objetivo

La Landing debe hablar simultáneamente a tres perfiles.

---

## Usuario Final

Personas que desean:

Descubrir negocios

Reservar

Comprar

Pedir domicilios

Comprar eventos

Usar Wallet

Administrar su familia

---

## Negocios

Restaurantes

Hoteles

Bares

Discotecas

Cafeterías

Veterinarias

Centros deportivos

Parques

Centros comerciales

Cualquier comercio afiliado.

---

## Empresas

Empresas interesadas en:

Planes Empresariales

Convenios

Eventos corporativos

Beneficios para empleados

---

# 4. Identidad de Marca

La Landing debe transmitir:

Elegancia

Exclusividad

Tecnología

Confianza

Modernidad

Velocidad

Seguridad

Nunca debe sentirse como una aplicación "económica".

Debe sentirse premium.

---

# 5. Personalidad

CIERVO es una plataforma:

Moderna

Tecnológica

Confiable

Elegante

Profesional

Amigable

Nunca infantil.

Nunca exageradamente seria.

Nunca recargada.

---

# 6. Tecnologías

Flutter 3.x

Material Design 3

Dart estable

Google Fonts

Responsive Layout

Router moderno

No usar HTML manual para construir páginas.

Todo debe desarrollarse mediante Flutter.

---

# 7. Arquitectura

El proyecto utilizará una arquitectura Feature First.

Estructura:

lib/

core/

features/

shared/

assets/

Cada sección de la Landing será un Feature independiente.

Ejemplo:

features/

hero/

wallet/

delivery/

kids/

events/

memberships/

business/

faq/

contact/

footer/

Cada feature tendrá:

widgets/

models/

controllers (si aplica)

pages/

No se permitirán widgets gigantes con cientos de líneas.

Todos los componentes deben dividirse.

---

# 8. Navegación

La Landing utilizará una sola página (Single Page Experience).

La navegación superior deberá desplazarse suavemente hacia cada sección.

No se recargará el sitio.

No se abrirán nuevas páginas para contenido principal.

Únicamente existirán páginas independientes para:

Privacy Policy

Terms of Service

Delete Account

Support

404

---

# 9. Menú superior

Debe permanecer fijo.

Siempre visible.

Con efecto Glass.

Fondo semitransparente.

Blur.

Sombra muy ligera.

Debe contener:

Logo

Inicio

Características

Membresías

Negocios

FAQ

Contacto

Descargar App

Botón principal destacado.

---

# 10. Responsive

La Landing deberá comportarse correctamente en todos los tamaños.

Desktop UltraWide

Desktop

Laptop

Tablet Horizontal

Tablet Vertical

Móvil Grande

Móvil Estándar

Móvil Pequeño

No deben existir:

Overflow

RenderFlex

Widgets cortados

Texto fuera de pantalla

Botones inaccesibles

---

# 11. Breakpoints Oficiales

320 px

360 px

390 px

414 px

430 px

768 px

1024 px

1280 px

1440 px

1600 px

1920 px

No deben usarse tamaños fijos.

Todo deberá ser adaptable.

---

# 12. Accesibilidad

Toda la Landing debe cumplir:

Contraste suficiente

Navegación por teclado

Focus visible

Lectores de pantalla

Textos escalables

Botones accesibles

No depender únicamente del color para transmitir información.

---

# 13. Rendimiento

Objetivo:

Lighthouse Performance superior a 90.

Lighthouse Accessibility superior a 95.

SEO superior a 95.

Best Practices superior a 95.

No cargar imágenes innecesarias.

Usar lazy loading cuando sea posible.

Optimizar todos los assets.

---

# 14. Compatibilidad

Google Chrome

Microsoft Edge

Safari

Firefox

Android

iOS

Windows

macOS

Linux

---

# 15. Seguridad

No exponer:

Tokens

Secrets

API Keys

URLs privadas

Credenciales

Toda comunicación deberá realizarse mediante HTTPS.

---

# 16. Analítica

La Landing deberá quedar preparada para integrar posteriormente:

Google Analytics 4

Google Search Console

Google Tag Manager

Meta Pixel

Sin modificar la arquitectura.

---

# 17. Objetivo de Conversión

Toda sección deberá conducir al usuario hacia una acción:

Descargar la App

Registrar un negocio

Contactar soporte

Conocer las membresías

Nunca deberá existir una sección únicamente decorativa.

Todo elemento tendrá un propósito.

---

# 18. Preparación para el Futuro

La arquitectura deberá permitir agregar nuevas secciones sin modificar las existentes.

Cada sección será completamente reutilizable.

---

# 19. Convenciones

No utilizar texto hardcodeado dentro de widgets.

Centralizar constantes.

Centralizar colores.

Centralizar tipografías.

Centralizar espaciados.

Centralizar animaciones.

Todo deberá reutilizarse.

---

# 20. Regla Principal

La Landing representa la imagen oficial de CIERVO.

Debe transmitir la calidad de una empresa tecnológica consolidada.

Cada decisión visual, técnica y funcional deberá orientarse a generar confianza, facilitar la navegación y maximizar la conversión, manteniendo una experiencia premium, rápida, accesible y preparada para el crecimiento del producto.
