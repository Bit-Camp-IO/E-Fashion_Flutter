import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/presentation/product/components/details/details_body_shimmer_loading.dart';
import 'package:efashion_flutter/presentation/product/components/details/details_images_component.dart';
import 'package:efashion_flutter/presentation/shared/animations/custom_fade_animation.dart';
import 'package:efashion_flutter/presentation/shared/widgets/no_internet_connection_widget.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:efashion_flutter/presentation/product/bloc/details_cubit/details_cubit.dart';
import 'package:efashion_flutter/presentation/product/components/details/animated_transform_skew.dart';
import 'package:efashion_flutter/presentation/shared/widgets/container_button.dart';
import 'package:efashion_flutter/presentation/product/components/details/product_cart_component.dart';
import 'package:efashion_flutter/presentation/product/components/details/rating_and_reviews_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

@RoutePage()
class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen>
    with TickerProviderStateMixin {
  int selectedColorIndex = 0;
  int selectedSizeIndex = 0;
  int productPieces = 0;
  ValueNotifier<bool> isSheetExpanded = ValueNotifier(false);
  bool isBagButtonLoading = false;
  bool isTryAgainButtonLoading = false;
  late DraggableScrollableController draggableScrollableController;

  @override
  void initState() {
    context.read<DetailsCubit>()
      ..getProductDetails(productId: widget.productId)
      ..getProductReviewsAndRatings(productId: widget.productId)
      ..getUserProductReview(productId: widget.productId);
    draggableScrollableController = DraggableScrollableController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<DetailsCubit, DetailsState>(
        listener: (context, state) {
          if(state.productDetailsState == CubitState.loading){
            isTryAgainButtonLoading = true;
          }else{
            isTryAgainButtonLoading = false;
          }
        },
        buildWhen: (previous, current) => previous.productDetailsState != current.productDetailsState,
        builder: (context, state) {
          if (state.productDetailsState == CubitState.failure) {
            return NoInternetConnectionWidget(
              onButtonTap: () {
                context.read<DetailsCubit>()
                  ..getProductDetails(productId: widget.productId)
                  ..getProductReviewsAndRatings(productId: widget.productId)
                  ..getUserProductReview(productId: widget.productId);
              },
              isButtonLoading: isTryAgainButtonLoading,
            );
          } else {
            return Stack(
              children: [
                const DetailsImagesComponent(),
                NotificationListener<DraggableScrollableNotification>(
                  onNotification: (notification) {
                    isSheetExpanded.value = notification.extent >= 0.80;
                    return false;
                  },
                  child: DraggableScrollableSheet(
                    controller: draggableScrollableController,
                    initialChildSize: 0.65,
                    minChildSize: 0.65,
                    builder: (context, scrollController) {
                      return ValueListenableBuilder(
                        valueListenable: isSheetExpanded,
                        builder: (context, isSheetExpandedValue, child) => AnimatedTransformSkew(
                          skewValue: 0.15,
                          isExpanded: isSheetExpandedValue,
                          child: AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut,
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onInverseSurface,
                              borderRadius: isSheetExpandedValue
                                  ? null
                                  : BorderRadius.only(
                                      topLeft: const Radius.circular(70).r,
                                      topRight: const Radius.circular(50).r,
                                    ),
                            ),
                            child: AnimatedTransformSkew(
                              isExpanded: isSheetExpandedValue,
                              skewValue: -0.15,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 30.h),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 16.0).r,
                                    child: AnimatedSwitcher(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      child: isSheetExpandedValue
                                          ? SizedBox(
                                              width: 48.w,
                                              height: 48.h,
                                              child: IconButton(
                                                onPressed: () {
                                                  context.popRoute();
                                                },
                                                icon: Icon(
                                                  Iconsax.arrow_left,
                                                  color: Colors.white,
                                                  size: 24.sp,
                                                ),
                                              ),
                                            )
                                          : ClippedContainerButton(
                                              key: ValueKey<bool>(
                                                  isSheetExpandedValue),
                                              onTap: () {
                                                context.popRoute();
                                              },
                                              icon: Iconsax.arrow_left,
                                            ),
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Expanded(
                                    child: SingleChildScrollView(
                                      controller: scrollController,
                                      child: Builder(
                                        builder: (context) {
                                          if (state.productDetailsState == CubitState.initial || state.productDetailsState == CubitState.loading) {
                                            return const DetailsBodyShimmerLoading();
                                          } else {
                                            return CustomFadeAnimation(
                                              duration: const Duration(
                                                  milliseconds: 500),
                                              child: Column(
                                                children: [
                                                  ProductCartComponent(
                                                    productId: state.productDetails.id,
                                                    productName: state.productDetails.title,
                                                    productColors: state.productDetails.colors,
                                                    productSizes: state.productDetails.sizes,
                                                    productDescription: state.productDetails.description,
                                                    productStock: state.productDetails.stock,
                                                    productPrice: state.productDetails.price.toInt(),
                                                  ),
                                                  RatingAndReviewsComponent(
                                                    productId: widget.productId,
                                                  ),
                                                  SizedBox(height: 120.h),
                                                ],
                                              ),
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    draggableScrollableController.dispose();
    isSheetExpanded.dispose();
    super.dispose();
  }
}
