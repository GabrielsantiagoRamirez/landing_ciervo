import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../core/theme/app_animations.dart';

class AnimatedSection extends StatefulWidget {
  const AnimatedSection({
    super.key,
    required this.child,
    this.delay = Duration.zero,
  });

  final Widget child;
  final Duration delay;

  @override
  State<AnimatedSection> createState() => _AnimatedSectionState();
}

class _AnimatedSectionState extends State<AnimatedSection> {
  bool _visible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ValueKey(widget.hashCode),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.15 && !_visible) {
          setState(() => _visible = true);
        }
      },
      child: _visible
          ? widget.child
              .animate()
              .fadeIn(
                duration: AppAnimations.normal,
                delay: widget.delay,
                curve: AppAnimations.defaultCurve,
              )
              .slideY(
                begin: 0.08,
                end: 0,
                duration: AppAnimations.slow,
                delay: widget.delay,
                curve: AppAnimations.defaultCurve,
              )
          : Opacity(opacity: 0, child: widget.child),
    );
  }
}
