import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/shared/constants/app_constants.dart';
import 'package:efashion_flutter/shared/util/assets_manager.dart';
import 'package:efashion_flutter/presentation/shared/widgets/cart_icon_button.dart';
import 'package:efashion_flutter/presentation/shared/widgets/favorite_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridCard extends StatelessWidget {
  const GridCard({
    super.key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.isFavorite,
    required this.onTap,
    required this.onFavoriteTap,
    required this.onCartTap,
    this.reverse = false,
  });

  final String productImage;
  final String productName;
  final int productPrice;
  final bool isFavorite;
  final void Function() onTap;
  final void Function() onFavoriteTap;
  final void Function() onCartTap;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Transform(
            transform: reverse ? Matrix4.skewY(0.13) : Matrix4.skewY(-0.13),
            alignment: reverse ? Alignment.topRight : Alignment.topLeft,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  top: -10.h,
                  left: 0,
                  right: 0,
                  bottom: -20.h,
                  child: Transform(
                    transform:
                    reverse ? Matrix4.skewY(-0.13) : Matrix4.skewY(0.13),
                    alignment: reverse ? Alignment.topLeft : Alignment.topRight,
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
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -5.h,
                  child: Transform(
                    transform:
                    reverse ? Matrix4.skewY(-0.13) : Matrix4.skewY(0.13),
                    alignment: reverse ? Alignment.topRight : Alignment.topLeft,
                    child: Image.asset(
                      reverse
                          ? AssetsManager.gridShapeReverse
                          : AssetsManager.gridShape,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: reverse ? null : 2.w,
            right: reverse ? 2.w : null,
            child: FavoriteIconButton(
              isFavorite: isFavorite,
              onFavoriteTap: onFavoriteTap,
            ),
          ),
          Positioned(
            bottom: 5.h,
            right: reverse ? 1.w : null,
            left: reverse ? null : 1.w,
            child: CartIconButton(onCartTap: onCartTap),
          ),
          Positioned(
            bottom: 27.h,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  productName,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                  ),
                ),
                Text(
                  '\$$productPrice',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}