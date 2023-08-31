import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/config/router/app_router.dart';
import 'package:efashion_flutter/core/util/colors_manager.dart';
import 'package:efashion_flutter/features/home/presentation/components/shared/review_card.dart';
import 'package:efashion_flutter/features/home/presentation/components/shared/custom_rating_bar.dart';
import 'package:efashion_flutter/features/home/presentation/mock/product_mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';

class RatingAndReviewsComponent extends StatelessWidget {
  final int productId;

  const RatingAndReviewsComponent({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Rate this product',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: Theme.of(context).colorScheme.onSurface),
          ),
          SizedBox(height: 4.h),
          Text(
            'Tell others what you think',
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Theme.of(context).colorScheme.outline),
          ),
          SizedBox(height: 24.h),
          Center(
              child: CustomRatingBar(
            onRatingUpdate: (value) {},
          )),
          Center(
            child: TextButton(
              onPressed: () {
                context.pushRoute(AddReviewRoute(productId: productId));
              },
              child: Text(
                'Write a review',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            'Rating and Reviews',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          SizedBox(height: 4.h),
          Text(
            'What others think about this product.',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                ),
          ),
          SizedBox(height: 12.h),
          Center(
            child: Column(
              children: [
                Text(
                  '${brandProducts[productId].productRating}',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                RatingBarIndicator(
                  unratedColor: Theme.of(context).colorScheme.outline,
                  itemSize: 24,
                  itemPadding: const EdgeInsets.all(8).r,
                  rating: brandProducts[productId].productRating.toDouble(),
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: ColorsManager.ratingStarColor,
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  '${brandProducts[productId].reviews.length}   Reviews',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(5, (index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${5 - index}',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.star,
                      color: ColorsManager.ratingStarColor,
                      size: 24,
                    ),
                    LinearPercentIndicator(
                      width: 220.w,
                      lineHeight: 8.h,
                      curve: Curves.bounceInOut,
                      backgroundColor: Colors.white,
                      progressColor: Colors.black,
                      barRadius: const Radius.circular(5).r,
                      percent: brandProducts[productId].rates[index],
                    )
                  ],
                ),
              );
            }),
          ),
          ListView.builder(
            itemCount: 3,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: 16.0, left: 24, right: 24).r,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0).r,
                child: ReviewCard(
                  reviewerImage:
                      brandProducts[productId].reviews[index].reviewerImage,
                  reviewerName:
                      brandProducts[productId].reviews[index].reviewerName,
                  reviewDate:
                      brandProducts[productId].reviews[index].reviewDate,
                  reviewRating: brandProducts[productId]
                      .reviews[index]
                      .reviewRating
                      .toDouble(),
                  reviewDescription:
                      brandProducts[productId].reviews[index].reviewDescription,
                ),
              );
            },
          ),
          Center(
            child: TextButton(
              onPressed: () {
                context.pushRoute(AllReviewsRoute(productId: productId));
              },
              child: Text(
                'See all reviews',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
