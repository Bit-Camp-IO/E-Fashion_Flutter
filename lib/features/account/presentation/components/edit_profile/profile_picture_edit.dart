import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/features/account/presentation/components/edit_profile/rounded_cutout_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class ProfilePictureEdit extends StatelessWidget {
  const ProfilePictureEdit({super.key, required this.imageUrl, required this.onTap});
  final String imageUrl;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipPath(
            clipper: RoundedCutoutClipper(),
            child: CachedNetworkImage(
              width: 120.w,
              height: 120.h,
              fit: BoxFit.cover,
              imageUrl: imageUrl,
            ),
          ),
          Positioned(
            right: 4.0.w,
            top: 8.0.h,
            child: CircleAvatar(
              radius: 11.0.r,
              backgroundColor: Theme.of(context).colorScheme.primary,
              child: Icon(
                  Iconsax.edit_2,
                  color: Colors.white,
                  size: 15.0.sp,
                ),
            ),
          ),
        ],
      ),
    );
  }
}
