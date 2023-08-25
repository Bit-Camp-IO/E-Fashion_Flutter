import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/features/home/presentation/components/shared/review_card.dart';
import 'package:efashion_flutter/features/home/presentation/mock/product_mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

@RoutePage()
class AllReviewsScreen extends StatelessWidget {
  const AllReviewsScreen({super.key, required this.productId});

  final int productId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Review'),
        leading: IconButton(
          onPressed: () {
            context.popRoute();
          },
          icon: const Icon(Iconsax.arrow_left),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 10).r,
        child: ListView.builder(
          itemCount: brandProducts[productId].reviews.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0).r,
              child: ReviewCard(
                reviewerImage: brandProducts[productId].reviews[index].reviewerImage,
                reviewerName: brandProducts[productId].reviews[index].reviewerName,
                reviewDate: brandProducts[productId].reviews[index].reviewDate,
                reviewRating: brandProducts[productId].reviews[index].reviewRating.toDouble(),
                reviewDescription: brandProducts[productId].reviews[index].reviewDescription,
              ),
            );
          },
        ),
      ),
    );
  }
}
