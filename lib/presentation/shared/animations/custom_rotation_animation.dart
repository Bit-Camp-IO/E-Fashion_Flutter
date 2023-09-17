import 'dart:math' as math;
import 'package:flutter/material.dart';

class CustomRotationAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const CustomRotationAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 30),
  });

  @override
  State<CustomRotationAnimation> createState() =>
      _CustomRotationAnimationState();
}

class _CustomRotationAnimationState extends State<CustomRotationAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.rotate(
          angle: _controller.value * 2 * math.pi,
          child: widget.child,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
