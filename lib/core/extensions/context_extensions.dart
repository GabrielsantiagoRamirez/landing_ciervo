import 'package:flutter/material.dart';

import '../theme/app_breakpoints.dart';

extension ContextExtensions on BuildContext {
  ScreenSize get screenSize => AppBreakpoints.of(this);
  bool get isMobile => AppBreakpoints.isMobile(this);
  bool get isTablet => AppBreakpoints.isTablet(this);
  bool get isDesktop => AppBreakpoints.isDesktop(this);
}
