import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/presentation/account/bloc/profile_cubit/profile_cubit.dart';
import 'package:efashion_flutter/presentation/shared/animations/custom_fade_animation.dart';
import 'package:efashion_flutter/shared/constants/api_constants.dart';
import 'package:efashion_flutter/core/router/app_router.dart';
import 'package:efashion_flutter/shared/util/colors_manager.dart';
import 'package:efashion_flutter/presentation/product/bloc/details_cubit/details_cubit.dart';
import 'package:efashion_flutter/presentation/product/components/shared/review_card.dart';
import 'package:efashion_flutter/presentation/product/components/shared/custom_rating_bar.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';

class RatingAndReviewsComponent extends StatelessWidget {
  final String productId;

  const RatingAndReviewsComponent({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        final ratingAverage = state.reviewsAndRatings.average;
        final rateCount = state.reviewsAndRatings.rateCount;
        final userRate = state.userReview.rate;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringsManager.rateSuggestionTitle,
                style: Theme.of(context).textTheme.bodyMedium!
                    .copyWith(color: Theme.of(context).colorScheme.onSurface),
              ),
              SizedBox(height: 4.h),
              Text(
                StringsManager.rateSuggestionSubTitle,
                style: Theme.of(context).textTheme.bodySmall!
                    .copyWith(color: Theme.of(context).colorScheme.outline,
                ),
              ),
              SizedBox(height: 24.h),
              Center(
                child: CustomRatingBar(
                  initialRating: userRate.toDouble(),
                  onRatingUpdate: (value) {
                    context.read<DetailsCubit>().addOrEditProductReview(
                        productId: productId, rate: value);
                  },
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    context.pushRoute(AddOrEditReviewRoute(productId: productId));
                  },
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: Text(
                      key: ValueKey<bool>(state.userReview.createdAt.isEmpty),
                      StringsManager.addOrEditReviewTextButton(
                          state.userReview.createdAt.isEmpty),
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                StringsManager.ratingsAndReviewsTitle,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
              ),
              SizedBox(height: 4.h),
              Text(
                StringsManager.ratingAndReviewsSubTitle,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    ),
              ),
              SizedBox(height: 12.h),
              Center(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: Column(
                    key: ValueKey<double>(
                        ratingAverage.toDouble()),
                    children: [
                      Text(ratingAverage == ratingAverage.floor() ?
                      ratingAverage.floor().toString() :
                      ratingAverage.toStringAsFixed(1),
                        style: Theme.of(context).textTheme.headlineSmall!
                            .copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                      RatingBarIndicator(
                        unratedColor: Theme.of(context).colorScheme.outline,
                        itemSize: 24.sp,
                        itemPadding: const EdgeInsets.all(8).r,
                        rating: ratingAverage.toDouble(),
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: ColorsManager.ratingStarColor,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        StringsManager.reviewsCount(
                            state.reviewsAndRatings.reviews.length),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ),
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
                          '${index + 1}',
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
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 250),
                          child: LinearPercentIndicator(
                            key: ValueKey(rateCount['${index + 1}']),
                            width: 220.w,
                            lineHeight: 8.h,
                            curve: Curves.bounceInOut,
                            backgroundColor: Colors.white,
                            progressColor: Colors.black,
                            barRadius: const Radius.circular(5).r,
                            percent: rateCount.isNotEmpty && rateCount['total'] != 0
                                    ? (rateCount['${index + 1}'] / rateCount['total']).toDouble()
                                    : 0,
                          ),
                        )
                      ],
                    ),
                  );
                }),
              ),
              ListView.builder(
                itemCount: state.reviewsAndRatings.reviews.length > 3
                    ? 3
                    : state.reviewsAndRatings.reviews.length,
                physics: const NeverScrollableScrollPhysics(),
                padding:
                    const EdgeInsets.only(top: 16.0, left: 24, right: 24).r,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  ProfileCubit profileCubit = context.read<ProfileCubit>();
                 final String? reviewerImage =  state.reviewsAndRatings.reviews[index].reviewer.profileImage;
                  final String reviewerName =  state.reviewsAndRatings.reviews[index].reviewer.fullName;
                  final String reviewerId = state.reviewsAndRatings.reviews[index].reviewer.id;
                  final String reviewDate = state.reviewsAndRatings.reviews[index].createdAt;
                  final double reviewRating =  state.reviewsAndRatings.reviews[index].rate.toDouble();
                  final String reviewDescription = state.reviewsAndRatings.reviews[index].comment;
                  if (index == 0 && reviewerId == profileCubit.state.userData.id) {
                   return BlocBuilder<ProfileCubit, ProfileState>(
                      buildWhen: (previous, current) => previous.userData != current.userData,
                      builder: (context, state) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0).r,
                          child: ReviewCard(
                            reviewerImage:
                               state.userData.profileImagePath != null ? ApiConstants.getUserProfilePicture(
                                        path: state.userData.profileImagePath!,
                                      ) : null,
                            reviewerName:reviewerName,
                            reviewDate: reviewDate,
                            reviewRating: reviewRating,
                            reviewDescription: reviewDescription,
                          ),
                        );
                      },
                    );
                  }
                  return CustomFadeAnimation(
                    duration: const Duration(milliseconds: 250),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0).r,
                      child: ReviewCard(
                        reviewerImage: reviewerImage != null
                            ? ApiConstants.getUserProfilePicture(
                                path: reviewerImage,
                         ) : null,
                        reviewerName:reviewerName,
                        reviewDate: reviewDate,
                        reviewRating: reviewRating,
                        reviewDescription: reviewDescription,
                      ),
                    ),
                  );
                },
              ),
              state.reviewsAndRatings.reviews.length > 3
                  ? Center(
                      child: TextButton(
                        onPressed: () {
                          context
                              .pushRoute(AllReviewsRoute(productId: productId));
                        },
                        child: Text(
                          StringsManager.seeAllReviewsButton,
                          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                                color: Theme.of(context).colorScheme.primary,
                              ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        );
      },
    );
  }
}
