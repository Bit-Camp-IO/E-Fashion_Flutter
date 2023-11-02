import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/presentation/product/bloc/details_cubit/details_cubit.dart';
import 'package:efashion_flutter/presentation/product/components/shared/review_card.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

@RoutePage()
class AllReviewsScreen extends StatelessWidget {

  final String productId;
  const AllReviewsScreen({super.key, required this.productId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringsManager.allReviewsScreenTitle,
          style: Theme.of(context).textTheme.titleMedium!
              .copyWith(color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.popRoute();
          },
          icon: const Icon(Iconsax.arrow_left),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 10).r,
        child: BlocBuilder<DetailsCubit, DetailsState>(
          buildWhen: (previous, current) => previous.reviewsAndRatings.reviews != current.reviewsAndRatings.reviews,
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.reviewsAndRatings.reviews.length,
              itemBuilder: (context, index) {
                  final String? reviewerImage = state.reviewsAndRatings.reviews[index].reviewer.profileImage;
                  final String reviewerName = state.reviewsAndRatings.reviews[index].reviewer.fullName;
                  final String reviewDate = state.reviewsAndRatings.reviews[index].createdAt;
                  final double reviewRating = state.reviewsAndRatings.reviews[index].rate .toDouble();
                  final String reviewDescription = state.reviewsAndRatings.reviews[index].comment;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0).r,
                    child: ReviewCard(
                      reviewerImage: reviewerImage,
                      reviewerName: reviewerName,
                      reviewDate:reviewDate,
                      reviewRating: reviewRating,
                      reviewDescription: reviewDescription,
                    ),
                  );
              },
            );
          },
        ),
      ),
    );
  }
}
