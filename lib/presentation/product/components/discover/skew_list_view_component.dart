import 'package:efashion_flutter/injection_container.dart';
import 'package:efashion_flutter/presentation/product/bloc/details_cubit/details_cubit.dart';
import 'package:efashion_flutter/presentation/product/bloc/discover_cubit/discover_cubit.dart';
import 'package:efashion_flutter/presentation/product/bloc/favorite_cubit/favorite_cubit.dart';
import 'package:efashion_flutter/presentation/shared/widgets/cart_bottom_sheet.dart';
import 'package:efashion_flutter/presentation/shared/widgets/list_view_card.dart';
import 'package:efashion_flutter/presentation/shared/widgets/top_list_view_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkewListViewComponent extends StatefulWidget {
  const SkewListViewComponent({Key? key}) : super(key: key);

  @override
  State<SkewListViewComponent> createState() => _SkewListViewComponentState();
}

class _SkewListViewComponentState extends State<SkewListViewComponent> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverCubit, DiscoverState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.products.length,
          itemBuilder: (context, index) {
            final String productId = state.products[index].id;
            final String productImage = state.products[index].imageUrl;
            final String productName = state.products[index].title;
            final int productPrice = state.products[index].price.toInt();
            if (index == 0) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: BlocBuilder<FavoriteCubit, FavoriteState>(
                  builder: (context, state) {
                    return TopListViewCard(
                      productImage: productImage,
                      productName: productName,
                      productPrice: productPrice,
                      isFavorite: state.favoriteList.contains(productId),
                      onTap: () {
                        // context.pushRoute(DetailsRoute(
                        //     productId: brandProducts[index].productId));
                      },
                      onFavoriteTap: () {
                        context.read<FavoriteCubit>().
                            addOrRemoveProductFromFavoriteListEvent(
                                productId: productId);
                      },
                      onCartTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return BlocProvider(
                              create: (context) => getIt<DetailsCubit>()..getProductDetails(productId: productId),
                              child: BlocBuilder<DetailsCubit, DetailsState>(
                                buildWhen: (previous, current) => previous.productDetailsState != current.productDetailsState,
                                builder: (context, state) {
                                  return CartBottomSheet(
                                    productName: state.productDetails.title,
                                    productPrice: state.productDetails.price.toInt(),
                                    productColors: state.productDetails.colors,
                                    productSizes: state.productDetails.sizes,
                                    productPieces: 10,
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              );
            } else {
              return BlocBuilder<FavoriteCubit, FavoriteState>(
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0).r,
                    child: ListViewCard(
                      productImage: productImage,
                      productName: productName,
                      productPrice: productPrice,
                      isFavorite: state.favoriteList.contains(productId),
                      onTap: () {
                        // context.pushRoute(DetailsRoute(
                        //     productId: brandProducts[index].productId));
                      },
                      onFavoriteTap: () {
                        context.read<FavoriteCubit>().
                            addOrRemoveProductFromFavoriteListEvent(
                                productId: productId);
                      },
                      onCartTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return BlocProvider(
                              create: (context) => getIt<DetailsCubit>()..getProductDetails(productId: productId),
                              child: BlocBuilder<DetailsCubit, DetailsState>(
                                buildWhen: (previous, current) => previous.productDetailsState != current.productDetailsState,
                                builder: (context, state) {
                                  return CartBottomSheet(
                                    productName: state.productDetails.title,
                                    productPrice: state.productDetails.price.toInt(),
                                    productColors: state.productDetails.colors,
                                    productSizes: state.productDetails.sizes,
                                    productPieces: 10,
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              );
            }
          },
        );
      },
    );
  }
}
