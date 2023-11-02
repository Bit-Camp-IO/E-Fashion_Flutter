import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/presentation/product/bloc/collections_cubit/collections_cubit.dart';
import 'package:efashion_flutter/presentation/product/bloc/home_bloc/home_bloc.dart';
import 'package:efashion_flutter/presentation/product/components/home/collection/collection_shimmer_loading.dart';
import 'package:efashion_flutter/shared/router/app_router.dart';
import 'package:efashion_flutter/shared/util/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:efashion_flutter/presentation/product/components/home/collection/animated_indicator.dart';
import 'package:efashion_flutter/presentation/product/components/home/collection/collection_carousel_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CollectionCarouselComponent extends StatefulWidget {
  const CollectionCarouselComponent({super.key});

  @override
  State<CollectionCarouselComponent> createState() => _CollectionCarouselComponentState();
}

class _CollectionCarouselComponentState extends State<CollectionCarouselComponent> {
  ValueNotifier<int> listenableIndicatorIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CollectionsCubit, CollectionsState>(
      builder: (context, state) {
        if (state.collectionsList.isEmpty) {
          return const CollectionShimmerLoading();
        } else {
          return Stack(
            children: [
              BlocBuilder<CollectionsCubit, CollectionsState>(
                buildWhen: (previous, current) => previous.collectionsState != current.collectionsState,
                builder: (context, state) {
                  return CarouselSlider.builder(
                    itemCount: state.collectionsList.length,
                    itemBuilder: (context, index, realIndex) {
                      return CarouselCard(
                        cardImageUrl: state.collectionsList[index].image,
                        collectionName: state.collectionsList[index].title,
                        discount: state.collectionsList[index].discount,
                        onTap: () {
                          context.pushRoute(
                            CollectionDetailsRoute(
                              collectionId: state.collectionsList[index].id,
                              collectionName:
                                  state.collectionsList[index].title,
                              collectionPrice:
                                  state.collectionsList[index].price,
                            ),
                          );
                        },
                      );
                    },
                    options: CarouselOptions(
                      height: 320.h,
                      viewportFraction: 1,
                      enlargeCenterPage: false,
                      initialPage: 0,
                      onPageChanged: (index, reason) {
                        listenableIndicatorIndex.value = index;
                      },
                    ),
                  );
                },
              ),
              Positioned(
                left: 20.w,
                top: 40.h,
                child: IconButton(
                  onPressed: () {
                    final homeBloc = context.read<HomeBloc>();
                    context.pushRoute(
                      SearchRoute(
                        categories: homeBloc.state.categories,
                        brands: homeBloc.state.brands,
                      ),
                    );
                  },
                  icon: Icon(
                    Iconsax.search_normal_1,
                    color: Colors.white,
                    size: 24.sp,
                  ),
                ),
              ),
              Positioned(
                right: 20.w,
                top: 40.h,
                child: IconButton(
                  onPressed: () {
                    context.pushRoute(const NotificationsRoute());
                  },
                  icon: Icon(
                    Iconsax.notification,
                    color: Colors.white,
                    size: 24.sp,
                  ),
                ),
              ),
              Positioned(
                left: 10.w,
                bottom: 25.h,
                child: BlocBuilder<CollectionsCubit, CollectionsState>(
                  buildWhen: (previous, current) =>
                      previous.collectionsList != current.collectionsList,
                  builder: (context, state) {
                    return ValueListenableBuilder(
                      valueListenable: listenableIndicatorIndex,
                      builder: (context, activeIndex, child) {
                        return AnimatedIndicator(
                          dotWidth: 30.w,
                          dotHeight: 4.h,
                          currentIndex: activeIndex,
                          selectedColor: ColorsManager.activeIndicatorColor,
                          unSelectedColor: ColorsManager.inActiveIndicatorColor,
                          axisDirection: Axis.horizontal,
                          dotsCount: state.collectionsList.length,
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
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
