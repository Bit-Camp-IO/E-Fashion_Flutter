import 'package:flutter/material.dart';

class SlideFadeAnimationSwitcher extends StatelessWidget {
  const SlideFadeAnimationSwitcher({
    super.key,
    required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (Widget child, Animation<double> animation) {
        const Offset startOffset = Offset(1.0, 0.0);
        const Offset endOffset = Offset.zero;
        final Tween<Offset> slideTween = Tween<Offset>(
          begin: startOffset,
          end: endOffset,
        );
        final Animation<Offset> slideAnimation = animation.drive(slideTween);
        return SlideTransition(
          position: slideAnimation,
          child: FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
}
