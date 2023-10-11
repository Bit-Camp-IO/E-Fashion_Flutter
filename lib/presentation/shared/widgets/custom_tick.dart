import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTick extends StatelessWidget {
  const CustomTick({super.key, required this.isTickVisible});
  final bool isTickVisible;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.bounceIn,
      switchOutCurve: Curves.bounceOut,
      child: Visibility(
        key: ValueKey<bool>(isTickVisible),
        visible: isTickVisible,
        child: Container(
          width: 10.w,
          height: 10.h,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}
