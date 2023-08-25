import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedIndicator extends StatelessWidget {
  final int currentIndex;
  final int dotsCount;
  final Axis axisDirection;
  final Color selectedColor;
  final Color unSelectedColor;
  final double dotWidth;
  final double dotHeight;

  const AnimatedIndicator({
    super.key,
    required this.currentIndex,
    required this.dotsCount,
    required this.axisDirection,
    required this.selectedColor,
    required this.unSelectedColor,
    required this.dotWidth,
    required this.dotHeight,
  });



  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        dotsCount,
            (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0).r,
          child: AnimatedContainer(
            curve: Curves.easeIn,
            duration: const Duration(milliseconds: 300),
            width: dotWidth,
            height: dotHeight,
            decoration: BoxDecoration(
              color: index == currentIndex ? selectedColor : unSelectedColor,
              borderRadius: BorderRadius.circular(20).w,
            ),
          ),
        ),
      ),
    );
  }
}
