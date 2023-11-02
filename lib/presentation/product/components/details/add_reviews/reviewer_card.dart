import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/presentation/shared/widgets/no_profile_picture.dart';
import 'package:efashion_flutter/shared/constants/app_constants.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewerCard extends StatelessWidget {
  final String? reviewerImage;
  final String reviewerName;
  const ReviewerCard({super.key, required this.reviewerImage, required this.reviewerName});


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        reviewerImage != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(20).r,
                child: CachedNetworkImage(
                  width: 40.w,
                  height: 40.h,
                  imageUrl: reviewerImage!,
                  fit: BoxFit.cover,
                  cacheManager: CacheManager(
                    Config(
                      AppConstants.cacheFolder,
                      stalePeriod:
                      const Duration(days: AppConstants.cacheDuration),
                    ),
                  ),
                ),
              )
            : EmptyProfilePicture(name: reviewerName[0]),
        SizedBox(width: 16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              reviewerName,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
            SizedBox(height: 4.h),
            SizedBox(
              width: 216.w,
              child: Text(
                StringsManager.reviewCardNotice,
                textAlign: TextAlign.start,
                overflow: TextOverflow.visible,
                maxLines: null,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
