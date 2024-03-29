import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:efashion_flutter/presentation/product/bloc/details_cubit/details_cubit.dart';
import 'package:efashion_flutter/presentation/shared/bloc/favorite_cubit/favorite_cubit.dart';
import 'package:efashion_flutter/presentation/product/bloc/search_bloc/search_bloc.dart';
import 'package:efashion_flutter/presentation/product/components/shared/small_product_card_shimmer_loading.dart';
import 'package:efashion_flutter/core/router/app_router.dart';
import 'package:efashion_flutter/presentation/shared/widgets/cart_bottom_sheet.dart';
import 'package:efashion_flutter/presentation/product/components/shared/small_brand_card.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridViewComponent extends StatefulWidget {
  const GridViewComponent({super.key});
  @override
  State<GridViewComponent> createState() => _GridViewComponentState();
}

class _GridViewComponentState extends State<GridViewComponent> {
  late final ScrollController _scrollController;
  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    final searchBloc = context.read<SearchBloc>();
    if (currentScroll >= maxScroll * 0.9) {
      searchBloc.add(const LoadMoreSearchProductEvent());
    }
  }

  void _scrollBackUp() {
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
  @override
  void initState() {
    _scrollController = ScrollController()..addListener(_onScroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchBloc, SearchState>(
      listener: (context, state) {
        if(state.searchState == BlocState.loading){
          _scrollBackUp();
        }
      },
      buildWhen: (previous, current) => previous.searchState != current.searchState || previous.loadMoreProductsState != current.loadMoreProductsState,
      builder: (context, state) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
              mainAxisSpacing: 10.h,
              crossAxisSpacing: 10.h,
              mainAxisExtent: 200.h
          ),
          itemCount: state.hasSearchProductsListReachedMax ? state.searchProducts.length : state.searchProducts.length + 2,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          controller: _scrollController,
          itemBuilder: (context, index) {
            if (index >= state.searchProducts.length) {
              if(!state.hasSearchProductsListReachedMax){
                return const SmallProductCardShimmerLoading();
              }else{
                return const SizedBox.shrink();
              }
            } else {
              final String productId = state.searchProducts[index].id;
              final String productImage = state.searchProducts[index].imageUrl;
              final String productName = state.searchProducts[index].title;
              final int productPrice = state.searchProducts[index].price.toInt();
                return BlocBuilder<FavoriteCubit, FavoriteState>(
                  builder: (context, state) {
                    return SmallProductCard(
                      productImage: productImage,
                      productName: productName,
                      productPrice: productPrice,
                      isCartActive: true,
                      isFavorite: state.favoritesIds.contains(productId),
                      onTap: () {
                        context.pushRoute(ProductDetailsRoute(
                          productId: productId,
                        ));
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
                              create: (context) => getIt<DetailsCubit>()..getProductDetails(productId: productId),
                              child: BlocBuilder<DetailsCubit, DetailsState>(
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
                );
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
