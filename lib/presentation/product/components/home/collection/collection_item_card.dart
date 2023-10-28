import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/shared/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CollectionItemCard extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final bool isReversed;

  const CollectionItemCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.isReversed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 312.w,
      height: 196.h,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(16).r),
      child: Directionality(
        textDirection: isReversed ? TextDirection.ltr : TextDirection.rtl,
        child: Row(
          children: [
            SizedBox(width: 8.w),
            ClipRRect(
              borderRadius: BorderRadius.circular(16).r,
              child: CachedNetworkImage(
                width: 150.w,
                height: 180.h,
                fit: BoxFit.cover,
                imageUrl: image,
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
            Padding(
              padding: const EdgeInsets.all(20.0).r,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: isReversed
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.end,
                children: [
                  Text(
                    textDirection: TextDirection.ltr,
                    title.length > 13 ? '${title.substring(0, 13)}..' : title,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                  SizedBox(height: 4.h),
                  ConstrainedBox(
                    constraints:
                        BoxConstraints(maxHeight: 120.h, maxWidth: 135.w),
                    child: Text(
                      textDirection: TextDirection.ltr,
                      description,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
