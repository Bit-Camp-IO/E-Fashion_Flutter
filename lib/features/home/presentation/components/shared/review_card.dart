import 'package:efashion_flutter/core/util/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.reviewerImage,
    required this.reviewerName,
    required this.reviewDate,
    required this.reviewRating,
    required this.reviewDescription,
  });

  final String reviewerImage;
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
        color: Theme.of(context).colorScheme.background,
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
                CircleAvatar(
                  backgroundImage: NetworkImage(reviewerImage),
                ),
                SizedBox(width: 16.w),
                Text(
                  reviewerName,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: ColorsManager.textColorPrimary,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                RatingBarIndicator(
                  unratedColor: Theme.of(context).colorScheme.outline,
                  itemSize: 10,
                  itemPadding: const EdgeInsets.all(4).r,
                  rating: reviewRating,
                  itemBuilder: (context, index) =>
                  const Icon(Icons.star, color: Color(0xFFF5EC00)),
                ),
                SizedBox(width: 11.w),
                Text(reviewDate,
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                    color: ColorsManager.textColorPrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(reviewDescription,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: ColorsManager.textColorPrimary,
              ),
            )
          ],
        ),
      ),
    );
  }
}