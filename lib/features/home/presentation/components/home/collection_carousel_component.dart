import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/core/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:efashion_flutter/features/home/presentation/components/home/animated_indicator.dart';
import 'package:efashion_flutter/features/home/presentation/components/home/collection_carousel_card.dart';
import 'package:efashion_flutter/features/home/presentation/mock/collection_mock.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CollectionCarouselComponent extends StatefulWidget {
  const CollectionCarouselComponent({super.key});

  @override
  State<CollectionCarouselComponent> createState() => _CollectionCarouselComponentState();
}

class _CollectionCarouselComponentState extends State<CollectionCarouselComponent> {
  int indicatorIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: collectionItems.length,
          itemBuilder: (context, index, realIndex) {
            return CarouselCard(
              cardImageUrl: collectionItems[index].collectionPic,
              collectionName: collectionItems[index].collectionName,
              offerPercentage: collectionItems[index].offer,
              onTap: () {},
            );
          },
          options: CarouselOptions(
            height:  320.h,
            viewportFraction: 1,
            enlargeCenterPage: false,
            initialPage: 0,
            onPageChanged: (index, reason) {
              setState(() {
                indicatorIndex = index;
              });
            },
          ),
        ),
        Positioned(
          left: 20.w,
          top: 40.h,
          child: IconButton(
            onPressed: () {
              context.pushRoute(const SearchRoute());
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
          child: AnimatedIndicator(
            dotWidth: 30.w,
            dotHeight: 4.h,
            currentIndex: indicatorIndex,
            selectedColor: const Color(0xFFF2F2F2),
            unSelectedColor: const Color(0xFFFFFFFF).withOpacity(0.5),
            axisDirection: Axis.horizontal,
            dotsCount: 5,
          ),
        ),
      ],
    );
  }
}