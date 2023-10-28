import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DotsLoadingIndicator extends StatefulWidget {
  const DotsLoadingIndicator({super.key});

  @override
  State<DotsLoadingIndicator> createState() => _DotsLoadingIndicatorState();
}

class _DotsLoadingIndicatorState extends State<DotsLoadingIndicator> {
  final ValueNotifier<int> _currentDotIndex = ValueNotifier(0);

  @override
  void initState() {
    super.initState();
    _startAnimationLoop();
  }

  void _updateDotAnimation() {
    _currentDotIndex.value = (_currentDotIndex.value + 1) % 4;
  }

  void _startAnimationLoop() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        _updateDotAnimation();
        _startAnimationLoop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (index) => ValueListenableBuilder(
          valueListenable: _currentDotIndex,
          builder: (context, value, child) => LoadingDot(
            color: Colors.white,
            isActive: value == index,
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _currentDotIndex.dispose();
    super.dispose();
  }
}

class LoadingDot extends StatelessWidget {
  final Color color;
  final bool isActive;

  const LoadingDot({super.key, required this.color, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      duration: const Duration(milliseconds: 500),
      width: isActive ? 14.w : 13.w,
      height: isActive ? 14.h : 13.w,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: isActive ? color : color.withOpacity(0.5),
        shape: BoxShape.circle,
      ),
    );
  }
}
