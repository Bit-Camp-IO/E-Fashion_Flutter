import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerticalRectangleButton extends StatelessWidget {
  const VerticalRectangleButton({super.key, required this.onTap, required this.isSelected});

  final void Function() onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Stack(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeOut,
              child: Row(
                key: ValueKey<bool>(isSelected),
                children: List.generate(
                  2,
                      (index) => Padding(
                    padding: const EdgeInsets.only(left: 1.0).r,
                    child: Container(
                      width: 10,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                            color: isSelected
                                ? Theme.of(context).colorScheme.primary
                                : Theme.of(context).colorScheme.outline,
                            width: 2.0),
                        borderRadius: BorderRadius.circular(3.0).r,
                      ),
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