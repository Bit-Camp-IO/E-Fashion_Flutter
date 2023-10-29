import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:efashion_flutter/presentation/product/bloc/details_cubit/details_cubit.dart';
import 'package:efashion_flutter/presentation/product/components/home/collection/animated_indicator.dart';
import 'package:efashion_flutter/presentation/shared/animations/custom_fade_animation.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_shimmer_effect.dart';
import 'package:efashion_flutter/shared/constants/app_constants.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:efashion_flutter/shared/util/size_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsImagesComponent extends StatefulWidget {
  const DetailsImagesComponent({super.key});

  @override
  State<DetailsImagesComponent> createState() => _DetailsImagesComponentState();
}

class _DetailsImagesComponentState extends State<DetailsImagesComponent> {
  final ValueNotifier<int> listenableIndicatorIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsCubit, DetailsState>(
      builder: (context, state) {
        if (state.productDetailsState == CubitState.initial ||
            state.productDetailsState == CubitState.loading) {
          return CustomShimmerEffect(
            child: Container(
              width: SizeManager.screenWidth,
              height: 450,
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
          );
        } else {
          if (state.productDetails.images.length > 1) {
            return CustomFadeAnimation(
              duration: const Duration(milliseconds: 500),
              child: Stack(
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
              ),
            );
          } else {
            return CustomFadeAnimation(
              duration: const Duration(milliseconds: 500),
              child: CachedNetworkImage(
                width: SizeManager.screenWidth,
                height: 450.h,
                imageUrl: state.productDetails.images[0],
                fit: BoxFit.cover,
                cacheManager: CacheManager(
                  Config(
                    AppConstants.cacheFolder,
                    stalePeriod: const Duration(days: AppConstants.cacheDuration),
                  ),
                ),
              ),
            );
          }
        }
      },
    );
  }

  @override
  void dispose() {
    listenableIndicatorIndex.dispose();
    super.dispose();
  }
}
