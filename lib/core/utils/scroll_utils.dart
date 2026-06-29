import 'package:flutter/material.dart';

import '../theme/app_animations.dart';

Future<void> scrollToSection(
  ScrollController controller,
  GlobalKey key,
) async {
  final context = key.currentContext;
  if (context == null) return;

  await Scrollable.ensureVisible(
    context,
    duration: AppAnimations.scroll,
    curve: AppAnimations.smoothCurve,
    alignment: 0.05,
  );
}
