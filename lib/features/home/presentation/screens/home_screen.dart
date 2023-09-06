import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/core/router/app_router.dart';
import 'package:efashion_flutter/features/home/presentation/components/home/collection_carousel_component.dart';
import 'package:efashion_flutter/features/home/presentation/components/home/filter_component.dart';
import 'package:efashion_flutter/features/home/presentation/components/home/offers_carousel_component.dart';
import 'package:efashion_flutter/features/home/presentation/components/home/section_widget.dart';
import 'package:efashion_flutter/features/home/presentation/components/home/brand_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          const CollectionCarouselComponent(),
          SizedBox(height: 10.h),
          const FilterComponent(),
          SizedBox(height: 10.h),
          SectionWidget(
            sectionTitle: 'Offers',
            sectionButtonTitle: 'See All',
            enableTextButton: true,
            onTextButtonTap: () {},
          ),
          SizedBox(height: 10.h),
          const OffersCarouselComponent(),
          SizedBox(height: 10.h),
          SectionWidget(
            sectionTitle: 'Zara',
            sectionButtonTitle: 'See All',
            enableTextButton: true,
            onTextButtonTap: () {
              context.pushRoute(const AllProductsRoute());
            },
          ),
          SizedBox(height: 10.h),
          const BrandComponent(),
          SizedBox(height: 100.h),
        ],
      ),
    );
  }
}


