import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/shared/constants/app_constants.dart';
import 'package:efashion_flutter/shared/util/assets_manager.dart';
import 'package:efashion_flutter/presentation/shared/widgets/favorite_icon_button.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class LargeProductCard extends StatelessWidget {
  final String productImage;
  final String productName;
  final int productPrice;
  final bool isFavorite;
  final void Function() onTap;
  final void Function() onFavoriteTap;
  final void Function() onCartTap;
  const LargeProductCard({
    super.key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.onTap,
    required this.isFavorite,
    required this.onFavoriteTap,
    required this.onCartTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(20)).r,
        child: SizedBox(
          width: 312.w,
          height: 280.h,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    top: -10.h,
                    left: 0,
                    right: 0,
                    bottom: -50.h,
                    child: CachedNetworkImage(
                      imageUrl: productImage,
                      fit: BoxFit.cover,
                      cacheManager: CacheManager(
                        Config(
                          AppConstants.cacheFolder,
                          stalePeriod: const Duration(
                            days: AppConstants.cacheDuration,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: -10.w,
                    right: 0,
                    bottom: 0,
                    child: Image.asset(
                      AssetsManager.largeCardShape,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
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
                bottom: 20.h,
                child: IconButton(
                  onPressed: onCartTap,
                  icon: Icon(
                    Iconsax.bag_2,
                    color: Theme.of(context).colorScheme.primary,
                    size: 26,
                  ),
                ),
              ),
              Positioned(
                bottom: 25.h,
                left: 0,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      productName.length > 16 ? '${productName.substring(0,16)}..' : productName,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                    Text(
                      '${StringsManager.currencySign}$productPrice',
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
    );
  }
}
