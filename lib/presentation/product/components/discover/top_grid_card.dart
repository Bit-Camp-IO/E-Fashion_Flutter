import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/shared/constants/app_constants.dart';
import 'package:efashion_flutter/shared/util/assets_manager.dart';
import 'package:efashion_flutter/presentation/shared/widgets/card_bottom_skew_clipper.dart';
import 'package:efashion_flutter/presentation/shared/widgets/cart_icon_button.dart';
import 'package:efashion_flutter/presentation/shared/widgets/favorite_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopGridCard extends StatelessWidget {
  const TopGridCard({
    super.key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.onTap,
    required this.isFavorite,
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
          ClipPath(
            clipper:
            CardBottomSkewClipper(skewAmount: 0.1, reverse: reverse),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: reverse
                    ? const Radius.circular(20)
                    : const Radius.circular(0),
                topLeft: reverse
                    ? const Radius.circular(0)
                    : const Radius.circular(20),
              ).r,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  CachedNetworkImage(
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
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: -2,
                    child: Image.asset(
                      reverse
                          ? AssetsManager.gridShapeReverse
                          : AssetsManager.gridShape,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 5.h,
                    right: reverse ? -5.w : null,
                    left: reverse ? null : -5.w,
                    child: CartIconButton(onCartTap: onCartTap),
                  ),
                  Positioned(
                    bottom: 28.h,
                    left: 0,
                    right: 0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          productName,
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
            ),
          ),
          Positioned(
            top: 1.h,
            right: reverse ? 1.w : null,
            left: reverse ? null : 1.w,
            child: FavoriteIconButton(
              isFavorite: isFavorite,
              onFavoriteTap: onFavoriteTap,
            ),
          )
        ],
      ),
    );
  }
}