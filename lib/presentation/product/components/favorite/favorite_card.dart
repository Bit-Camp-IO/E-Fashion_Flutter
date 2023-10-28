import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/presentation/shared/widgets/favorite_icon_button.dart';
import 'package:efashion_flutter/shared/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    super.key,
    required this.productImage,
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.isFavorite,
    required this.onFavoriteTap,
    required this.onCartTap,
    required this.onCardTap,
  });

  final String productImage;
  final String productId;
  final String productName;
  final int productPrice;
  final bool isFavorite;
  final void Function() onFavoriteTap;
  final void Function() onCartTap;
  final void Function() onCardTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 236.h,
      width: 150.w,
      child: Stack(
        children: [
          InkWell(
            onTap: onCardTap,
            child: ClipPath(
              clipper: FavoriteClipper(),
              child: SizedBox(
                width: 150.w,
                height: 180.h,
                child: CachedNetworkImage(
                  imageUrl: productImage,
                  fit: BoxFit.cover,
                  cacheManager: CacheManager(
                    Config(
                      AppConstants.cacheFolder,
                      stalePeriod:
                      const Duration(days: AppConstants.cacheDuration),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 3.h,
            right: 10.w,
            child: FavoriteIconButton(
              isFavorite: isFavorite,
              onFavoriteTap: onFavoriteTap,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 40.h,
            child: GestureDetector(
              onTap: onCartTap,
              child: Container(
                width: 29.w,
                height: 29.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Iconsax.bag_2,
                  color: Colors.white,
                  size: 14.sp,
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -7.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  productName,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  '\$$productPrice',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FavoriteClipper extends CustomClipper<Path> {
  FavoriteClipper();

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(size.width * 0.1066667, 0);
    path.cubicTo(size.width * 0.04775627, 0, 0, size.height * 0.03979689, 0,
        size.height * 0.08888889);
    path.lineTo(0, size.height * 0.9111111);
    path.cubicTo(0, size.height * 0.9602056, size.width * 0.04775633,
        size.height, size.width * 0.1066667, size.height);
    path.lineTo(size.width * 0.4000000, size.height);
    path.cubicTo(
        size.width * 0.4000000,
        size.height * 0.9539778,
        size.width * 0.4447713,
        size.height * 0.9166667,
        size.width * 0.5000000,
        size.height * 0.9166667);
    path.cubicTo(
        size.width * 0.5552287,
        size.height * 0.9166667,
        size.width * 0.6000000,
        size.height * 0.9539778,
        size.width * 0.6000000,
        size.height);
    path.lineTo(size.width * 0.8933333, size.height);
    path.cubicTo(size.width * 0.9522467, size.height, size.width,
        size.height * 0.9602056, size.width, size.height * 0.9111111);
    path.lineTo(size.width, size.height * 0.08888889);
    path.cubicTo(size.width, size.height * 0.03979689, size.width * 0.9522467,
        0, size.width * 0.8933333, 0);
    path.lineTo(size.width * 0.1066667, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
