# CIERVO LANDING

## Single Source of Truth (SSOT)

### Documento 02 - Design System

**Versión:** 1.0

**Estado:** Aprobado

**Proyecto:** CIERVO

---

# 1. Filosofía de Diseño

La Landing de CIERVO debe transmitir una sensación de producto tecnológico premium.

Las referencias de calidad visual son:

* Apple
* Notion
* Stripe
* Linear
* Mercado Pago
* Airbnb
* Uber

No debe parecer una plantilla.

No debe parecer un dashboard.

No debe parecer una página corporativa tradicional.

Debe sentirse como una startup tecnológica moderna.

---

# 2. Principios

Todo el diseño debe seguir estos principios.

Elegancia

Minimalismo

Mucho espacio en blanco

Contenido fácil de leer

Jerarquía visual clara

Animaciones suaves

Consistencia absoluta

---

# 3. Identidad Visual

CIERVO utiliza una identidad premium.

Nunca debe utilizar colores excesivamente saturados.

Nunca usar degradados exagerados.

Nunca usar sombras fuertes.

Todo debe sentirse limpio.

---

# 4. Paleta Oficial

## Primario

Negro profundo

```text
#0B0B0B
```

---

## Secundario

Negro carbón

```text
#161616
```

---

## Superficies

```text
#1F1F1F
```

---

## Fondo alterno

```text
#252525
```

---

## Dorado Principal

```text
#D4AF37
```

---

## Dorado Hover

```text
#E5C65C
```

---

## Dorado Oscuro

```text
#B58F1D
```

---

## Texto Principal

```text
#FFFFFF
```

---

## Texto Secundario

```text
#D7D7D7
```

---

## Texto Deshabilitado

```text
#9E9E9E
```

---

## Divider

```text
#333333
```

---

## Success

```text
#3DBE6C
```

---

## Warning

```text
#F3B94E
```

---

## Error

```text
#E14C4C
```

---

# 5. Tipografía

Google Fonts.

Fuente oficial:

## Plus Jakarta Sans

En caso de no estar disponible:

Outfit

o

Manrope

Nunca utilizar múltiples familias tipográficas.

---

# 6. Escala Tipográfica

Hero

64 px Desktop

48 px Tablet

34 px Mobile

---

Título Sección

40 px

---

Subtítulo

24 px

---

Body

18 px

---

Texto secundario

16 px

---

Caption

14 px

---

# 7. Peso Tipográfico

Hero

700

Título

700

Subtítulo

600

Body

400

Caption

400

---

# 8. Grid

Desktop

12 columnas

Tablet

8 columnas

Mobile

4 columnas

---

# 9. Espaciado

Unidad base:

8 px

Escalas:

8

16

24

32

40

48

64

80

96

Nunca usar valores aleatorios.

---

# 10. Border Radius

Botón

16 px

Card

24 px

Input

16 px

Chip

999 px

---

# 11. Sombras

Muy suaves.

Nunca sombras negras fuertes.

Preferir elevación mediante contraste.

---

# 12. Glassmorphism

Solo Navbar.

No utilizar Glass en todo.

Backdrop Blur ligero.

Transparencia moderada.

---

# 13. Botones

## Primario

Fondo dorado.

Texto negro.

Hover:

Escala 1.03

Cambio ligero de color.

---

## Secundario

Outline dorado.

Hover:

Fondo dorado.

Texto negro.

---

## Ghost

Sin fondo.

Texto dorado.

Hover:

Background transparente con leve opacidad.

---

# 14. Cards

Fondo:

#161616

Radius:

24

Padding:

32

Borde:

1 px

Muy sutil.

Hover:

Elevar ligeramente.

---

# 15. Navbar

Siempre fija.

Glass.

Logo izquierda.

Links centro.

CTA derecha.

Altura:

80 px

---

# 16. Footer

Fondo completamente negro.

Varias columnas.

Logo.

Enlaces.

Redes.

Copyright.

---

# 17. Iconografía

Material Symbols Rounded

o

Lucide Icons

No mezclar estilos.

---

# 18. Ilustraciones

Preferir:

Mockups del teléfono.

No usar dibujos infantiles.

No usar cliparts.

---

# 19. Mockups

Utilizar mockups modernos.

Sombras suaves.

Pantallas reales de la app.

No usar marcos exagerados.

---

# 20. Imágenes

Optimizar.

Formato WebP.

Nunca cargar imágenes enormes.

Lazy Loading cuando aplique.

---

# 21. Animaciones

Todas las animaciones deben durar entre:

200 ms

y

500 ms

Nunca superiores a 700 ms.

Curvas:

easeOut

easeInOut

Nunca Bounce.

---

# 22. Scroll

El desplazamiento debe sentirse premium.

Suave.

Natural.

Nunca abrupto.

---

# 23. Aparición de Secciones

Cada sección aparecerá mediante:

Fade

*

Slide

desde abajo

Solo una vez.

---

# 24. Hover

Desktop únicamente.

Botones

Cards

Links

Iconos

Todos deberán responder al cursor.

---

# 25. CTA

Todos los botones principales utilizarán el color dorado.

Nunca más de un CTA principal por sección.

---

# 26. Componentes Reutilizables

Crear componentes compartidos para:

PrimaryButton

SecondaryButton

SectionTitle

SectionSubtitle

FeatureCard

MembershipCard

PhoneMockup

StatCard

AnimatedCounter

TestimonialCard

FAQItem

FooterColumn

SocialButton

DownloadBadge

HeroBackground

GlassNavbar

SectionContainer

ResponsivePadding

---

# 27. Responsive

Todo componente debe adaptarse automáticamente.

Nunca ocultar información importante.

Solo reorganizar.

---

# 28. Microinteracciones

Los botones deben responder al usuario.

Hover.

Focus.

Pressed.

Disabled.

Todo debe sentirse vivo.

---

# 29. Estados

Todo componente debe contemplar:

Normal

Hover

Pressed

Focused

Disabled

Loading

---

# 30. Calidad Visual

La Landing debe transmitir la misma calidad que la aplicación móvil.

El usuario debe percibir una experiencia consistente entre la web y la app.

No deben existir componentes improvisados ni inconsistencias visuales.

---

# 31. Reglas de Implementación

No usar colores hardcodeados.

No usar tamaños hardcodeados.

Toda la configuración visual debe centralizarse en un Theme.

Crear:

AppColors

AppTypography

AppSpacing

AppShadows

AppRadius

AppAnimations

AppIcons

AppBreakpoints

Todo el proyecto deberá consumir exclusivamente estas clases.

---

# 32. Resultado Esperado

El usuario debe percibir CIERVO como una plataforma tecnológica moderna, elegante y confiable desde el primer segundo.

El diseño debe ser consistente, rápido, accesible y preparado para evolucionar sin perder identidad visual.
