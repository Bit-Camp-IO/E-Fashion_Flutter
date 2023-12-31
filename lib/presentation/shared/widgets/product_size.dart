import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectableProductSize extends StatelessWidget {
  final String size;
  final void Function() onTap;
  final bool isSelected;
  const SelectableProductSize({
    super.key,
    required this.size,
    required this.onTap,
    required this.isSelected,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0).r,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedOpacity(
              opacity: isSelected ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Text(
                size,
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
            AnimatedOpacity(
              opacity: isSelected ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              child: Container(
                width: 30.w,
                height: 30.h,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    shape: BoxShape.circle
                ),
                child: Center(
                  child: Text(
                    size,
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}