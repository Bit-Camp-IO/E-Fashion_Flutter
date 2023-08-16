import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SquareButton extends StatelessWidget {
  const SquareButton({super.key, required this.onTap, required this.isSelected});

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
              child: Container(
                key: ValueKey<bool>(isSelected),
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.outline,
                      width: 2.0),
                  borderRadius: BorderRadius.circular(5.0).r,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
