import 'package:efashion_flutter/presentation/account/components/edit_profile/rounded_cutout_clipper.dart';
import 'package:efashion_flutter/shared/util/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class EmptyProfilePictureEdit extends StatelessWidget {
  const EmptyProfilePictureEdit({
    super.key,
    required this.name,
    required this.onTap, this.onRefreshPress,
  });

  final String name;
  final void Function() onTap;
  final void Function()? onRefreshPress;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ClipPath(
          clipper: RoundedCutoutClipper(),
          child: Container(
            width: 120.w,
            height: 120.h,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              shape: BoxShape.circle,
            ),
            child: Center(
                child: name.isNotEmpty ? Text(name[0],
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: Colors.white,
                    fontFamily: AssetsManager.primaryFontFamily,
                  ),
                ) : IconButton(
                    onPressed: onRefreshPress,
                    icon: const Icon(Iconsax.refresh, color: Colors.white,)),
            ),
          ),
        ),
        Positioned(
          right: 2.0.w,
          top: 8.0.h,
          child: InkWell(
            onTap: onTap,
            child: CircleAvatar(
              radius: 12.2.r,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Icon(
                Iconsax.edit_2,
                color: Colors.white,
                size: 15.0.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
