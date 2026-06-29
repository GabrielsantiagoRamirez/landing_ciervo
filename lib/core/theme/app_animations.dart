import 'package:flutter/animation.dart';

abstract final class AppAnimations {
  static const Duration fast = Duration(milliseconds: 200);
  static const Duration normal = Duration(milliseconds: 350);
  static const Duration slow = Duration(milliseconds: 500);
  static const Duration scroll = Duration(milliseconds: 500);

  static const Curve defaultCurve = Curves.easeOut;
  static const Curve smoothCurve = Curves.easeInOut;
}
