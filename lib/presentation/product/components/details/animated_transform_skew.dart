import 'package:flutter/material.dart';

class AnimatedTransformSkew extends StatefulWidget {
  final Widget child;
  final bool isExpanded;
  final double skewValue;

  const AnimatedTransformSkew({
    super.key,
    required this.child,
    required this.isExpanded,
    required this.skewValue,
  });



  @override
  State<AnimatedTransformSkew> createState() => _AnimatedTransformSkewState();
}

class _AnimatedTransformSkewState extends State<AnimatedTransformSkew> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _skewAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _skewAnimation = Tween<double>(begin: widget.skewValue, end: 0.0)
        .animate(_animationController);
  }
  @override
  void didUpdateWidget(covariant AnimatedTransformSkew oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpanded != oldWidget.isExpanded) {
      if (widget.isExpanded) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _skewAnimation,
      builder: (context, child) {
        return Transform(
          transform: Matrix4.skewY(_skewAnimation.value),
          child: widget.child,
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
