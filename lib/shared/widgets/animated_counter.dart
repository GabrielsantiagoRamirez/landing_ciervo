import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_typography.dart';

class AnimatedCounter extends StatefulWidget {
  const AnimatedCounter({
    super.key,
    required this.value,
    this.prefix = '',
    this.suffix = '',
    this.label,
    this.isText = false,
  });

  final int value;
  final String prefix;
  final String suffix;
  final String? label;
  final bool isText;

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _started = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animation = Tween<double>(begin: 0, end: widget.value.toDouble()).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    if (!_started && !widget.isText) {
      _started = true;
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ValueKey('counter_${widget.label}'),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.3) _startAnimation();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.isText)
            Icon(Icons.verified_outlined, color: AppColors.gold, size: 36)
          else
            AnimatedBuilder(
              animation: _animation,
              builder: (context, _) {
                return Text(
                  '${widget.prefix}${_animation.value.toInt()}${widget.suffix}',
                  style: AppTypography.sectionTitle(context).copyWith(
                    color: AppColors.gold,
                    fontSize: 36,
                  ),
                );
              },
            ),
          if (widget.label != null) ...[
            const SizedBox(height: 8),
            Text(
              widget.label!,
              textAlign: TextAlign.center,
              style: AppTypography.bodySmall(context),
            ),
          ],
        ],
      ),
    );
  }
}
