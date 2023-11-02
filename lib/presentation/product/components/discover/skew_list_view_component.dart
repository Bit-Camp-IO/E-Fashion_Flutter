import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/presentation/product/components/discover/list_view_card.dart';
import 'package:efashion_flutter/presentation/product/components/discover/list_view_card_shimmer_loading.dart';
import 'package:efashion_flutter/presentation/product/components/discover/top_list_view_card_shimmer_loading.dart';
import 'package:efashion_flutter/presentation/shared/animations/custom_fade_animation.dart';
import 'package:efashion_flutter/shared/router/app_router.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:efashion_flutter/presentation/product/bloc/details_cubit/details_cubit.dart';
import 'package:efashion_flutter/presentation/product/bloc/discover_cubit/discover_bloc.dart';
import 'package:efashion_flutter/presentation/shared/bloc/favorite_cubit/favorite_cubit.dart';
import 'package:efashion_flutter/presentation/product/screens/discover_products_screen.dart';
import 'package:efashion_flutter/presentation/shared/widgets/cart_bottom_sheet.dart';
import 'package:efashion_flutter/presentation/product/components/discover/top_list_view_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkewListViewComponent extends StatefulWidget {
  final DiscoverScreenType discoverScreenType;
  final String? categories;
  final String brandId;

  const SkewListViewComponent({
    super.key,
    required this.discoverScreenType,
    this.categories,
    required this.brandId,
  });

  @override
  State<SkewListViewComponent> createState() => _SkewListViewComponentState();
}

class _SkewListViewComponentState extends State<SkewListViewComponent> {
  late final ScrollController _scrollController;
  int cartQuantity = 1;
  String? selectedSize;
  String? selectedColor;

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    final discoverBloc = context.read<DiscoverBloc>();
    if (currentScroll >= maxScroll * 0.9) {
      switch (widget.discoverScreenType) {
        case (DiscoverScreenType.offers):
          discoverBloc
              .add(GetOffersProductsEvent(categories: widget.categories));
        case (DiscoverScreenType.brand):
          discoverBloc.add(GetBrandProductsEvent(
              brandId: widget.brandId, categories: widget.categories));
      }
    }
  }

  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DiscoverBloc, DiscoverState>(
      buildWhen: (previous, current) => previous.discoverState != current.discoverState,
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.products.isEmpty ? 4 : state.products.length + 1,
          controller: _scrollController,
          itemBuilder: (context, index) {
            if (state.products.isNotEmpty && index >= state.products.length) {
              if (state.hasProductsListReachedMax) {
                return const SizedBox.shrink();
              } else {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0).r,
                  child: const ListViewCardShimmerLoading(),
                );
              }
            } else {
              if(state.products.isNotEmpty){
                final String productId = state.products[index].id;
                final String productImage = state.products[index].imageUrl;
                final String productName = state.products[index].title;
                final int productPrice = state.products[index].price.toInt();
                if(index == 0){
                  return CustomFadeAnimation(
                    duration: const Duration(milliseconds: 700),
                    child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: BlocBuilder<FavoriteCubit, FavoriteState>(
                          builder: (context, state) {
                            return TopListViewCard(
                              productImage: productImage,
                              productName: productName,
                              productPrice: productPrice,
                              isFavorite: state.favoritesIds.contains(productId),
                              onTap: () {
                                context.pushRoute(
                                  ProductDetailsRoute(
                                    productId: productId,
                                  ),
                                );
                              },
                              onFavoriteTap: () {
                                context.read<FavoriteCubit>().addOrRemoveProductFromFavoriteListEvent(
                                  productId: productId,
                                );
                              },
                              onCartTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return BlocProvider(
                                      create: (context) => getIt<DetailsCubit>()
                                        ..getProductDetails(productId: productId),
                                      child:
                                      BlocBuilder<DetailsCubit, DetailsState>(
                                        buildWhen: (previous, current) =>
                                        previous.productDetailsState !=
                                            current.productDetailsState,
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
                            );
                          },
                        )),
                  );
                }else{
                  return BlocBuilder<FavoriteCubit, FavoriteState>(
                    builder: (context, state) {
                      return CustomFadeAnimation(
                        duration: const Duration(milliseconds: 700),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0).r,
                          child: ListViewCard(
                            productImage: productImage,
                            productName: productName,
                            productPrice: productPrice,
                            isFavorite: state.favoritesIds.contains(productId),
                            onTap: () {
                              context.pushRoute(
                                ProductDetailsRoute(
                                  productId: productId,
                                ),
                              );
                            },
                            onFavoriteTap: () {
                              context
                                  .read<FavoriteCubit>()
                                  .addOrRemoveProductFromFavoriteListEvent(
                                  productId: productId);
                            },
                            onCartTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return BlocProvider(
                                    create: (context) => getIt<DetailsCubit>()
                                      ..getProductDetails(productId: productId),
                                    child:
                                    BlocBuilder<DetailsCubit, DetailsState>(
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
                          ),
                        ),
                      );
                    },
                  );
                }
              }else{
                if (index == 0) {
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: TopListViewCardShimmerLoading(),
                  );
                } else {
                  return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0).r,
                      child: const ListViewCardShimmerLoading()
                  );
                }
              }
            }
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }
}
