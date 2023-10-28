import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/shared/constants/app_constants.dart';
import 'package:efashion_flutter/shared/util/assets_manager.dart';
import 'package:efashion_flutter/presentation/shared/widgets/card_bottom_skew_clipper.dart';
import 'package:efashion_flutter/presentation/shared/widgets/cart_icon_button.dart';
import 'package:efashion_flutter/presentation/shared/widgets/favorite_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopListViewCard extends StatelessWidget {
  const TopListViewCard({
    super.key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.isFavorite,
    required this.onTap,
    required this.onFavoriteTap,
    required this.onCartTap,
  });
  final String productImage;
  final String productName;
  final int productPrice;
  final bool isFavorite;
  final void Function() onTap;
  final void Function() onFavoriteTap;
  final void Function() onCartTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipPath(
        clipper: CardBottomSkewClipper(skewAmount: 0.12, reverse: true),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ).r,
          child: SizedBox(
            width: 312.w,
            height: 300.h,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Stack(
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
                  ],
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -20.h,
                  child: Image.asset(
                    AssetsManager.listViewShape,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 5.h,
                  right: 5.w,
                  child: FavoriteIconButton(
                    isFavorite: isFavorite,
                    onFavoriteTap: onFavoriteTap,
                  ),
                ),
                Positioned(
                  right: 5.w,
                  bottom: 35.h,
                  child: CartIconButton(onCartTap: onCartTap),
                ),
                Positioned(
                  bottom: 40.h,
                  left: 0,
                  right: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        productName,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
      ),
    );
  }
}
