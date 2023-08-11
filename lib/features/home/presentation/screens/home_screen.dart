import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/features/home/presentation/components/collection_carousel_component.dart';
import 'package:efashion_flutter/features/home/presentation/components/filter_component.dart';
import 'package:efashion_flutter/features/home/presentation/components/offers_carousel.dart';
import 'package:efashion_flutter/features/home/presentation/components/section_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        const CollectionCarouselComponent(),
        SizedBox(height: 20.h),
        SectionWidget(
          sectionTitle: 'Filters',
          sectionButtonTitle: 'See All',
          onTap: () {},
        ),
        const FilterComponent(),
        SizedBox(height: 10.h),
        SectionWidget(
          sectionTitle: 'Offers',
          sectionButtonTitle: 'See All',
          onTap: () {},
        ),
        const OffersCarousel(),
        SizedBox(height: 10.h),
        SectionWidget(
          sectionTitle: 'Zara',
          sectionButtonTitle: 'See All',
          onTap: () {},
        ),
        SizedBox(height: 100.h),
      ],
    );
  }
}
