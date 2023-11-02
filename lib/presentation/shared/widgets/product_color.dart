import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectableProductColor extends StatelessWidget {

  final String color;
  final void Function() onTap;
  final bool isSelected;
  const SelectableProductColor({
    super.key,
    required this.color,
    required this.onTap,
    required this.isSelected,
  });

  int _cleanHexCode(String hexCode){
    String cleanedHex = hexCode.replaceAll("#", "");
    return int.parse('0xFF$cleanedHex');
  }
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
              child: CircleAvatar(
                radius: 14.r,
                backgroundColor: Color(_cleanHexCode(color)),
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
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                    width: 2.0, // Adjust the border width as needed
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: CircleAvatar(
                    radius: 20.r,
                    backgroundColor: Colors.transparent,
                    child: CircleAvatar(
                      radius: 14.r,
                      backgroundColor: Color(_cleanHexCode(color)),
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