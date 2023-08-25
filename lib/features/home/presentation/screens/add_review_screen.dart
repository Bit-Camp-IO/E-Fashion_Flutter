import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/features/home/presentation/components/details/add_reviews/review_product_card.dart';
import 'package:efashion_flutter/features/home/presentation/components/details/add_reviews/review_text_field.dart';
import 'package:efashion_flutter/features/home/presentation/components/details/add_reviews/reviewer_card.dart';
import 'package:efashion_flutter/features/home/presentation/components/shared/custom_rating_bar.dart';
import 'package:efashion_flutter/features/home/presentation/mock/product_mock.dart';
import 'package:efashion_flutter/core/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

@RoutePage()
class AddReviewScreen extends StatefulWidget {
  const AddReviewScreen({super.key, required this.productId});

  final int productId;

  @override
  State<AddReviewScreen> createState() => _AddReviewScreenState();
}

class _AddReviewScreenState extends State<AddReviewScreen> {
  late GlobalKey<FormState> formKey;
  late String review;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    super.initState();
  }

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
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            ReviewProductCard(
              productImage: brandProducts[widget.productId].productImage,
              productName: brandProducts[widget.productId].productName,
              productPrice: brandProducts[widget.productId].productPrice,
            ),
            const SizedBox(height: 30),
            ReviewerCard(
              reviewerImage:
                  brandProducts[widget.productId].reviews[0].reviewerImage,
              reviewerName:
                  brandProducts[widget.productId].reviews[0].reviewerName,
            ),
            SizedBox(height: 40.h),
            Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomRatingBar(
                    onRatingUpdate: (value) {},
                  ),
                  SizedBox(height: 40.h),
                  ReviewTextField(
                    onSaved: (value) {
                      if (value != null) {
                        setState(() {
                          review = value;
                        });
                        debugPrint(review);
                      }
                    },
                  ),
                  SizedBox(height: 15.h),
                  MainButton(
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                      }
                    },
                    buttonTitle: 'Add Review',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
