import 'package:flutter/material.dart';

import '../../core/theme/app_breakpoints.dart';

class ResponsiveContainer extends StatelessWidget {
  const ResponsiveContainer({
    super.key,
    required this.child,
    this.padding,
    this.verticalPadding,
  });

  final Widget child;
  final EdgeInsets? padding;
  final double? verticalPadding;

  @override
  Widget build(BuildContext context) {
    final horizontal = AppBreakpoints.horizontalPadding(context);
    final maxWidth = AppBreakpoints.maxContentWidth(context);

    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(
          padding: padding ??
              EdgeInsets.symmetric(
                horizontal: horizontal.horizontal,
                vertical: verticalPadding ??
                    AppBreakpoints.sectionVerticalPadding(context),
              ),
          child: child,
        ),
      ),
    );
  }
}
