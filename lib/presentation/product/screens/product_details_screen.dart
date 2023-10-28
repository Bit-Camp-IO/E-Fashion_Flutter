import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:efashion_flutter/presentation/product/components/home/collection/animated_indicator.dart';
import 'package:efashion_flutter/presentation/shared/bloc/cart_cubit/cart_cubit.dart';
import 'package:efashion_flutter/shared/constants/app_constants.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:efashion_flutter/shared/util/size_manager.dart';
import 'package:efashion_flutter/presentation/product/bloc/details_cubit/details_cubit.dart';
import 'package:efashion_flutter/presentation/product/components/details/animated_transform_skew.dart';
import 'package:efashion_flutter/presentation/shared/widgets/container_button.dart';
import 'package:efashion_flutter/presentation/product/components/details/product_cart_component.dart';
import 'package:efashion_flutter/presentation/product/components/details/rating_and_reviews_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
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
  late DraggableScrollableController draggableScrollableController;
  ValueNotifier<int> listenableIndicatorIndex = ValueNotifier<int>(0);

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
      body: BlocBuilder<DetailsCubit, DetailsState>(
        buildWhen: (previous, current) =>
            previous.productDetailsState != current.productDetailsState,
        builder: (context, state) {
          if (state.productDetailsState == CubitState.initial ||
              state.productDetailsState == CubitState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Stack(
              children: [
                Builder(
                  builder: (context) {
                    if (state.productDetails.images.length > 1) {
                      return Stack(
                        children: [
                          CarouselSlider.builder(
                            itemCount: state.productDetails.images.length,
                            itemBuilder: (context, index, realIndex) {
                              return CachedNetworkImage(
                                width: SizeManager.screenWidth,
                                imageUrl: state.productDetails.images[index],
                                fit: BoxFit.cover,
                                cacheManager: CacheManager(
                                  Config(
                                    AppConstants.cacheFolder,
                                    stalePeriod: const Duration(
                                      days: AppConstants.cacheDuration,
                                    ),
                                  ),
                                ),
                              );
                            },
                            options: CarouselOptions(
                              height: 450.h,
                              viewportFraction: 1,
                              enlargeCenterPage: false,
                              initialPage: 0,
                              onPageChanged: (index, reason) {
                                listenableIndicatorIndex.value = index;
                              },
                            ),
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 155.h,
                            child: ValueListenableBuilder(
                              valueListenable: listenableIndicatorIndex,
                              builder: (context, activeIndex, child) {
                                return AnimatedIndicator(
                                  dotWidth: 20.w,
                                  dotHeight: 4.h,
                                  minDotWidth: 10.h,
                                  currentIndex: activeIndex,
                                  selectedColor: const Color(0xFFF2F2F2),
                                  unSelectedColor:
                                      const Color(0xFFFFFFFF).withOpacity(0.5),
                                  axisDirection: Axis.horizontal,
                                  dotsCount: state.productDetails.images.length,
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    } else {
                      return CachedNetworkImage(
                        width: SizeManager.screenWidth,
                        height: 450.h,
                        imageUrl: state.productDetails.images[0],
                        fit: BoxFit.cover,
                        cacheManager: CacheManager(
                          Config(
                            AppConstants.cacheFolder,
                            stalePeriod: const Duration(
                                days: AppConstants.cacheDuration),
                          ),
                        ),
                      );
                    }
                  },
                ),
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
                      final CartCubit cartCubit = context.read<CartCubit>();
                      return ValueListenableBuilder(
                        valueListenable: isSheetExpanded,
                        builder: (context, isSheetExpandedValue, child) =>
                            AnimatedTransformSkew(
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
                                    child: ListView(
                                      controller: scrollController,
                                      shrinkWrap: true,
                                      children: [
                                        ProductCartComponent(
                                          productName:
                                              state.productDetails.title,
                                          productColors:
                                              state.productDetails.colors,
                                          productSizes:
                                              state.productDetails.sizes,
                                          productDescription:
                                              state.productDetails.description,
                                          productStock:
                                              state.productDetails.stock,
                                          productPrice: state
                                              .productDetails.price
                                              .toInt(),
                                          cartQuantity: (quantity) {
                                            cartCubit.updateSelectedQuantity(
                                                quantity);
                                          },
                                          selectedColor: (color) {
                                            cartCubit
                                                .updateSelectedColor(color);
                                          },
                                          selectedSize: (size) {
                                            cartCubit.updateSelectedSize(size);
                                          },
                                          onAddToBagTap: () {
                                            context
                                                .read<CartCubit>()
                                                .addProductToCart(
                                                  productId:
                                                      state.productDetails.id,
                                                  productName: state
                                                      .productDetails.title,
                                                );
                                          },
                                        ),
                                        RatingAndReviewsComponent(
                                          productId: widget.productId,
                                        ),
                                        // SimilarComponent(productId: widget.productId),
                                        SizedBox(height: 40.h),
                                      ],
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
    listenableIndicatorIndex.dispose();
    super.dispose();
  }
}
