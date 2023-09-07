import 'package:flutter/material.dart';

class CustomSlideAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final AnimationDirection animationDirection;

  const CustomSlideAnimation({
    super.key,
    required this.child,
    this.duration = const Duration(seconds: 2),
    required this.animationDirection,
  });

  @override
  State<CustomSlideAnimation> createState() => _CustomSlideAnimationState();
}

class _CustomSlideAnimationState extends State<CustomSlideAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    // Create an AnimationController with a duration
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _offsetAnimation = Tween<Offset>(
      begin: chooseDirection(widget.animationDirection),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: widget.child,
    );
  }
}

Offset chooseDirection(AnimationDirection animationDirection) {
  switch (animationDirection) {
    case AnimationDirection.right:
      return const Offset(1.0, 0.0);
    case AnimationDirection.left:
      return const Offset(-1.0, 0.0);
    case AnimationDirection.bottom:
      return const Offset(0.0, 1.0);
    case AnimationDirection.top:
      return const Offset(0.0, -1.0);
    case AnimationDirection.topLeft:
      return const Offset(-1.0, -1.0);
    case AnimationDirection.topRight:
      return const Offset(1.0, -1.0);
    case AnimationDirection.bottomLeft:
      return const Offset(-1.0, 1.0);
    case AnimationDirection.bottomRight:
      return const Offset(1.0, 1.0);
  }
}

enum AnimationDirection {
  left,
  right,
  bottom,
  top,
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
}
