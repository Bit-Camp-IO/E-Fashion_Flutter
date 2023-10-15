import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/presentation/shared/widgets/no_profile_picture.dart';
import 'package:efashion_flutter/shared/util/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.reviewerImage,
    required this.reviewerName,
    required this.reviewDate,
    required this.reviewRating,
    required this.reviewDescription,
  });

  final String? reviewerImage;
  final String reviewerName;
  final String reviewDate;
  final String reviewDescription;
  final double reviewRating;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 312.h,
      height: 164.w,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: BorderRadius.circular(20).r,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(width: 2.w),
                reviewerImage != null
                    ? ClipOval(
                        child: CachedNetworkImage(
                          height: 40.h,
                          width: 40.h,
                          imageUrl: reviewerImage!,
                          fit: BoxFit.cover,
                        ),
                      )
                    : EmptyProfilePicture(name: reviewerName),
                SizedBox(width: 16.w),
                Text(
                  reviewerName,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ],
            ),
            SizedBox(height: 7.h),
            Row(
              children: [
                RatingBarIndicator(
                  unratedColor: Theme.of(context).colorScheme.outline,
                  itemSize: 10,
                  itemPadding: const EdgeInsets.all(4).r,
                  rating: reviewRating,
                  itemBuilder: (context, index) => AnimatedSwitcher(
                    duration: const Duration(milliseconds: 300),
                    child: Icon(
                      key: ValueKey<double>(reviewRating),
                        Icons.star,
                        color: ColorsManager.ratingStarColor),
                  ),
                ),
                SizedBox(width: 11.w),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Text(
                    key: ValueKey<String>(reviewDate),
                    DateFormat('M/d/yy').format(DateTime.parse(reviewDate)),
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                ),
              ],
            ),
            SizedBox(height: reviewDescription.isEmpty ? 30.h : 12.h),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                reviewDescription.isEmpty
                    ? "No additional comments available."
                    : reviewDescription,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
