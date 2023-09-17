import 'package:efashion_flutter/injection_container.dart';
import 'package:efashion_flutter/presentation/product/bloc/details_cubit/details_cubit.dart';
import 'package:efashion_flutter/presentation/product/bloc/discover_cubit/discover_cubit.dart';
import 'package:efashion_flutter/presentation/product/bloc/favorite_cubit/favorite_cubit.dart';
import 'package:efashion_flutter/presentation/shared/widgets/cart_bottom_sheet.dart';
import 'package:efashion_flutter/presentation/shared/widgets/grid_card.dart';
import 'package:efashion_flutter/presentation/shared/widgets/top_grid_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkewGridViewComponent extends StatefulWidget {
  const SkewGridViewComponent({Key? key}) : super(key: key);

  @override
  State<SkewGridViewComponent> createState() => _SkewGridViewComponentState();
}

class _SkewGridViewComponentState extends State<SkewGridViewComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
      child: BlocBuilder<DiscoverCubit, DiscoverState>(
        builder: (context, state) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 3 / 4,
            ),
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final String productId = state.products[index].id;
              final String productImage = state.products[index].imageUrl;
              final String productName = state.products[index].title;
              final int productPrice = state.products[index].price.toInt();
              if (index == 0) {
                return BlocBuilder<FavoriteCubit, FavoriteState>(
                  builder: (context, state) {
                    return TopGridCard(
                      productImage: productImage,
                      productName: productName,
                      productPrice: productPrice,
                      isFavorite: state.favoriteList.contains(productId),
                      onTap: () {
                        // context.pushRoute(DetailsRoute(
                        //   productId: brandProducts[index].productId,
                        // ));
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
                );
              } else if (index == 1) {
                return BlocBuilder<FavoriteCubit, FavoriteState>(
                  builder: (context, state) {
                    return TopGridCard(
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
                      reverse: true,
                    );
                  },
                );
              } else if (index % 2 == 0) {
                return BlocBuilder<FavoriteCubit, FavoriteState>(
                  builder: (context, state) {
                    return GridCard(
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
                );
              } else {
                return BlocBuilder<FavoriteCubit, FavoriteState>(
                  builder: (context, state) {
                    return GridCard(
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
                      reverse: true,
                    );
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}
