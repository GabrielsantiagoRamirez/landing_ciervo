import 'package:flutter/material.dart';

enum ScreenSize { mobile, tablet, desktop, largeDesktop }

abstract final class AppBreakpoints {
  static const double mobileMax = 767;
  static const double tabletMax = 1023;
  static const double desktopMax = 1599;

  static ScreenSize of(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    if (width <= mobileMax) return ScreenSize.mobile;
    if (width <= tabletMax) return ScreenSize.tablet;
    if (width <= desktopMax) return ScreenSize.desktop;
    return ScreenSize.largeDesktop;
  }

  static bool isMobile(BuildContext context) =>
      of(context) == ScreenSize.mobile;

  static bool isTablet(BuildContext context) =>
      of(context) == ScreenSize.tablet;

  static bool isDesktop(BuildContext context) {
    final size = of(context);
    return size == ScreenSize.desktop || size == ScreenSize.largeDesktop;
  }

  static double maxContentWidth(BuildContext context) {
    final size = of(context);
    return switch (size) {
      ScreenSize.mobile => double.infinity,
      ScreenSize.tablet => 960,
      ScreenSize.desktop => 1200,
      ScreenSize.largeDesktop => 1400,
    };
  }

  static EdgeInsets horizontalPadding(BuildContext context) {
    final size = of(context);
    return switch (size) {
      ScreenSize.mobile => const EdgeInsets.symmetric(horizontal: 16),
      ScreenSize.tablet => const EdgeInsets.symmetric(horizontal: 32),
      ScreenSize.desktop => const EdgeInsets.symmetric(horizontal: 48),
      ScreenSize.largeDesktop => const EdgeInsets.symmetric(horizontal: 64),
    };
  }

  static double sectionVerticalPadding(BuildContext context) {
    final size = of(context);
    return switch (size) {
      ScreenSize.mobile => 64,
      ScreenSize.tablet => 80,
      _ => 96,
    };
  }
}
