import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class FavoriteIconButton extends StatelessWidget {
  final bool isFavorite;
  final void Function() onFavoriteTap;
  const FavoriteIconButton({
    super.key,
    required this.isFavorite,
    required this.onFavoriteTap,
  });
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      child: IconButton(
        key: ValueKey<bool>(isFavorite),
        onPressed: onFavoriteTap,
        icon: Icon(
          isFavorite ? Iconsax.heart5 : Iconsax.heart,
          color: Theme.of(context).colorScheme.primary,
          size: 26.sp,
        ),
      ),
    );
  }
}
