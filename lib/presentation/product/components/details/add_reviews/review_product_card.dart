import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/shared/constants/app_constants.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewProductCard extends StatelessWidget {
  final String productImage;
  final String productName;
  final int productPrice;

  const ReviewProductCard({
    super.key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10).r,
          child: CachedNetworkImage(
            width: 120.w,
            height: 140.h,
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
        const Spacer(
          flex: 2,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              productName,
              style: Theme.of(context).textTheme.titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            Text(
              '${StringsManager.currencySign}$productPrice',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            )
          ],
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}
