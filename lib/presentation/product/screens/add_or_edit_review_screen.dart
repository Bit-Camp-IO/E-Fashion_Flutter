import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/presentation/account/bloc/account_cubit/account_cubit.dart';
import 'package:efashion_flutter/presentation/product/bloc/details_cubit/details_cubit.dart';
import 'package:efashion_flutter/presentation/product/components/details/add_reviews/reviewer_card.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_appbar.dart';
import 'package:efashion_flutter/presentation/product/components/details/add_reviews/review_product_card.dart';
import 'package:efashion_flutter/presentation/product/components/details/add_reviews/review_text_field.dart';
import 'package:efashion_flutter/presentation/product/components/shared/custom_rating_bar.dart';
import 'package:efashion_flutter/presentation/shared/widgets/primary_button.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class AddOrEditReviewScreen extends StatefulWidget {
  const AddOrEditReviewScreen(
      {super.key, required this.productId, this.rating = 0});

  final String productId;
  final int rating;

  @override
  State<AddOrEditReviewScreen> createState() => _AddOrEditReviewScreenState();
}

class _AddOrEditReviewScreenState extends State<AddOrEditReviewScreen> {
  late GlobalKey<FormState> _formKey;
  late String _review;
  late double _rate;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    _rate = context.read<DetailsCubit>().state.userReview.rate.toDouble();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: true,
          body: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24, top: 50).r,
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                CustomAppBar(
                  appBarTitle: StringsManager.addOrEditReviewScreen(
                      state.userReview.createdAt.isEmpty),
                  appBarType: AppBarType.normal,
                ),
                SizedBox(height: 30.h),
                ReviewProductCard(
                  productImage: state.productDetails.images[0],
                  productName: state.productDetails.title,
                  productPrice: state.productDetails.price.toInt(),
                ),
                const SizedBox(height: 30),
                BlocBuilder<AccountCubit, AccountState>(
                  builder: (context, state) {
                    return ReviewerCard(
                      reviewerImage: state.userData.profileImage,
                      reviewerName: state.userData.fullName,
                    );
                  },
                ),
                SizedBox(height: 40.h),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomRatingBar(
                        initialRating: state.userReview.rate.toDouble(),
                        onRatingUpdate: (value) {
                          _rate = value;
                        },
                      ),
                      SizedBox(height: 40.h),
                      ReviewTextField(
                        reviewController: TextEditingController(
                            text: state.userReview.comment),
                        onSaved: (value) {
                          if (value != null) {
                            _review = value;
                          }
                        },
                      ),
                      SizedBox(height: 15.h),
                      PrimaryButton(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            context.read<DetailsCubit>().addOrEditProductReview(
                                productId: widget.productId,
                                rate: _rate,
                                review: _review);
                            context.popRoute();
                          }
                        },
                        buttonTitle: StringsManager.addOrEditReviewButton(
                            state.userReview.createdAt.isEmpty),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    super.dispose();
  }
}
