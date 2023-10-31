import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTick extends StatefulWidget {
  final bool isTickVisible;
  final int tickCount;

  const CustomTick(
      {super.key, required this.isTickVisible, required this.tickCount});

  @override
  State<CustomTick> createState() => _CustomTickState();
}

class _CustomTickState extends State<CustomTick> with SingleTickerProviderStateMixin {
  late AnimationController _shakingAnimationController;
  late Animation<double> _shakingAnimation;

  @override
  void initState() {
    super.initState();

    _shakingAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _shakingAnimation = Tween(begin: -5.0, end: 5.0).animate(
      CurvedAnimation(
        parent: _shakingAnimationController,
        curve: Curves.easeInOut,
      ),
    );
    if (widget.isTickVisible) {
      _shakingAnimationController.forward();
    }
  }

  @override
  void didUpdateWidget(covariant CustomTick oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Start the animation when isTickVisible is true and tickCount changes
    if (widget.isTickVisible && oldWidget.tickCount != widget.tickCount) {
      _shakingAnimationController.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _shakingAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(_shakingAnimation.value, 0),
          child: Visibility(
            key: ValueKey<int>(widget.tickCount),
            visible: widget.isTickVisible,
            child: Container(
              width: 15.w,
              height: 15.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.redAccent,
              ),
              child: Center(
                child: Text(
                  key: ValueKey<int>(widget.tickCount),
                  widget.tickCount.toString(),
                  style: TextStyle(fontSize: 10.sp),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _shakingAnimationController.dispose();
    super.dispose();
  }
}

