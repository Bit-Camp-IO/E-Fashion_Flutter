import 'package:efashion_flutter/shared/util/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class EmptyProfilePicture extends StatelessWidget {
  final String name;
  final double? width;
  final double? height;
  final bool isLarge;
  final void Function()? onRefreshPress;

  const EmptyProfilePicture({
    super.key,
    required this.name,
    this.width,
    this.height,
    this.isLarge = false,
    this.onRefreshPress,
  });

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
        child: name.isNotEmpty
            ? Text(
                name[0],
                style: isLarge
                    ? Theme.of(context).textTheme.displayLarge!.copyWith(
                          color: Colors.white,
                          fontFamily: AssetsManager.primaryFontFamily,
                        ) : Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                        ),
              )
            : IconButton(
                onPressed: onRefreshPress,
                icon: const Icon(
                  Iconsax.refresh,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
