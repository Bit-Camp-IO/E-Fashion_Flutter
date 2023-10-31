import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/presentation/product/bloc/collections_cubit/collections_cubit.dart';
import 'package:efashion_flutter/presentation/product/components/home/collection/collection_carousel_component.dart';
import 'package:efashion_flutter/presentation/shared/widgets/no_internet_connection_widget.dart';
import 'package:efashion_flutter/shared/constants/app_constants.dart';
import 'package:efashion_flutter/presentation/product/bloc/home_bloc/home_bloc.dart';
import 'package:efashion_flutter/presentation/product/components/home/categories/categories_component.dart';
import 'package:efashion_flutter/presentation/product/components/home/offers/offers_carousel_component.dart';
import 'package:efashion_flutter/presentation/product/components/home/brands/brand_component.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class HomeScreen extends StatefulWidget implements AutoRouteWrapper {
  const HomeScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()
        ..add(const GetCategoriesEvent(genderId: AppConstants.allGendersId))
        ..add(const GetProductOffersEvent())
        ..add(const GetBrandsEvent()),
      child: this,
    );
  }

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeState>(
        buildWhen: (previous, current) =>
            previous.categoriesState != current.categoriesState,
        listener: (context, state) {
          if (state.offersState == BlocState.loading ||
              state.brandsProductsState == BlocState.loading ||
              state.categoriesState == BlocState.loading ||
              state.brandsState == BlocState.loading) {
            isLoading = true;
          } else {
            isLoading = false;
          }
        },
        builder: (context, state) {
          if (state.offersState == BlocState.failure ||
              state.brandsProductsState == BlocState.failure ||
              state.categoriesState == BlocState.failure) {
            return NoInternetConnectionWidget(
              isButtonLoading: isLoading,
              onButtonTap: () {
                context.read<HomeBloc>()
                  ..add(const GetCategoriesEvent(
                      genderId: AppConstants.allGendersId))
                  ..add(const GetProductOffersEvent())
                  ..add(const GetBrandsEvent());
                context.read<CollectionsCubit>().getCollectionsList();
              },
            );
          } else {
            return ListView(
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
            );
          }
        },
      ),
    );
  }
}
