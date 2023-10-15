import 'package:efashion_flutter/shared/util/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyProfilePicture extends StatelessWidget {
  const EmptyProfilePicture({
    super.key,
    required this.name,
    this.width,
    this.height,
    this.isLarge = false,
  });

  final String name;
  final double? width;
  final double? height;
  final bool isLarge;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 40.w,
      height: height ?? 40.h,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          name.isNotEmpty ? name[0] : name,
          style: isLarge
              ? Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: Colors.white,
                  fontFamily: AssetsManager.primaryFontFamily)
              : Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                  ),
        ),
      ),
    );
  }
}
