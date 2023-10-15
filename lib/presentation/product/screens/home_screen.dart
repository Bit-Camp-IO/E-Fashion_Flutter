import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/presentation/product/components/home/collection/collection_carousel_component.dart';
import 'package:efashion_flutter/shared/constants/app_constants.dart';
import 'package:efashion_flutter/presentation/product/bloc/home_bloc/home_bloc.dart';
import 'package:efashion_flutter/presentation/product/components/home/categories_component.dart';
import 'package:efashion_flutter/presentation/product/components/home/offers_carousel_component.dart';
import 'package:efashion_flutter/presentation/product/components/home/brand_component.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class HomeScreen extends StatelessWidget implements AutoRouteWrapper {
  const HomeScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()
        ..add(const GetCategoriesEvent(genderId: AppConstants.allGendersId))
        ..add(const GetProductOffersEvent())
        ..add(const GetBrandsProductsEvent()),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        cacheExtent: double.infinity,
        padding: EdgeInsets.zero,
        children: [
          const CollectionCarouselComponent(),
          SizedBox(height: 10.h),
          const CategoriesComponent(),
          SizedBox(height: 20.h),
          const OffersCarouselComponent(),
          SizedBox(height: 20.h),
          const BrandComponent(),
          SizedBox(height: 100.h),
        ],
      ),
    );
  }
}
