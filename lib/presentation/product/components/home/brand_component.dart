import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/shared/router/app_router.dart';
import 'package:efashion_flutter/presentation/product/bloc/details_cubit/details_cubit.dart';
import 'package:efashion_flutter/presentation/product/bloc/favorite_cubit/favorite_cubit.dart';
import 'package:efashion_flutter/presentation/product/bloc/home_bloc/home_bloc.dart';
import 'package:efashion_flutter/presentation/product/components/home/section_widget.dart';
import 'package:efashion_flutter/presentation/product/screens/discover_products_screen.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:efashion_flutter/presentation/shared/widgets/cart_bottom_sheet.dart';
import 'package:efashion_flutter/presentation/product/components/shared/small_brand_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandComponent extends StatefulWidget {
  const BrandComponent({super.key});

  @override
  State<BrandComponent> createState() => _BrandComponentState();
}

class _BrandComponentState extends State<BrandComponent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<HomeBloc, HomeState>(
          buildWhen: (previous, current) =>
              previous.brandsProducts != current.brandsProducts,
          builder: (context, state) {
            return Column(
              children: List.generate(state.brands.length, (index) {
                return Column(
                  children: [
                    SectionWidget(
                      key: ValueKey<String>(state.brands[index].id),
                      sectionTitle: state.brands[index].name,
                      sectionType: SectionType.withTextButton,
                      onTextButtonTap: () {
                        context.pushRoute(
                          DiscoverProductsRoute(
                            brandId: state.brands[index].id,
                            discoverScreenType: DiscoverScreenType.brand,
                            brandName: state.brands[index].name,
                            categories: context.read<HomeBloc>().categories,
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 200.h,
                      child: ListView.builder(
                        key: ValueKey(state.brands[index].id),
                        itemCount: state.brandsProducts[state.brands[index].id]!.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, itemIndex) {
                          final String productId = state.brandsProducts[state.brands[index].id]![itemIndex].id;
                          final String productImage = state.brandsProducts[state.brands[index].id]![itemIndex].imageUrl;
                          final String productName = state.brandsProducts[state.brands[index].id]![itemIndex].title;
                          final int productPrice = state.brandsProducts[state.brands[index].id]![itemIndex].price.toInt();
                          return Padding(
                            padding: const EdgeInsets.only(left: 10.0).r,
                            child: SizedBox(
                              width: 150.w,
                              child: BlocBuilder<FavoriteCubit, FavoriteState>(
                                builder: (context, state) {
                                  return SmallProductCard(
                                    key: ValueKey<String>(productId),
                                    productImage: productImage,
                                    productName: productName,
                                    productPrice: productPrice,
                                    isFavorite:
                                        state.favoritesIds.contains(productId),
                                    isCartActive: true,
                                    onTap: () {
                                      context.pushRoute(ProductDetailsRoute(productId: productId));
                                    },
                                    onCartTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        builder: (context) {
                                          return BlocProvider(
                                            create: (context) => getIt<DetailsCubit>()..getProductDetails(productId: productId),
                                            child: BlocBuilder<DetailsCubit, DetailsState>(
                                              buildWhen: (previous, current) =>
                                                  previous.productDetailsState != current.productDetailsState,
                                              builder: (context, state) {
                                                return CartBottomSheet(
                                                  productName: state.productDetails.title,
                                                  productId: state.productDetails.id,
                                                  productPrice: state.productDetails.price.toInt(),
                                                  productColors: state.productDetails.colors,
                                                  productSizes: state.productDetails.sizes,
                                                  productStock: state.productDetails.stock,
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    onFavoriteTap: () {
                                      context.read<FavoriteCubit>()
                                          .addOrRemoveProductFromFavoriteListEvent(productId: productId);
                                    },
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              }),
            );
          },
        )
      ],
    );
  }
}
