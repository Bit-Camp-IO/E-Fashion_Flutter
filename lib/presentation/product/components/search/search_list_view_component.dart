import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:efashion_flutter/presentation/product/bloc/details_cubit/details_cubit.dart';
import 'package:efashion_flutter/presentation/shared/bloc/favorite_cubit/favorite_cubit.dart';
import 'package:efashion_flutter/presentation/product/bloc/search_bloc/search_bloc.dart';
import 'package:efashion_flutter/presentation/product/components/shared/large_product_card_shimmer_loading.dart';
import 'package:efashion_flutter/core/router/app_router.dart';
import 'package:efashion_flutter/presentation/shared/widgets/cart_bottom_sheet.dart';
import 'package:efashion_flutter/presentation/product/components/shared/large_product_card.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewComponent extends StatefulWidget {
  const ListViewComponent({super.key});
  @override
  State<ListViewComponent> createState() => _ListViewComponentState();
}

class _ListViewComponentState extends State<ListViewComponent> {
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
            return ListView.builder(
              itemCount: state.searchProducts.length + 1,
              controller: _scrollController,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemBuilder: (context, index) {
                if (index >= state.searchProducts.length) {
                  if (!state.hasSearchProductsListReachedMax) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0).r,
                      child: const LargeProductCardShimmerLoading(),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                } else {
                  final String productId = state.searchProducts[index].id;
                  final String productImage =
                      state.searchProducts[index].imageUrl;
                  final String productName = state.searchProducts[index].title;
                  final int productPrice =
                      state.searchProducts[index].price.toInt();
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0).r,
                    child: BlocBuilder<FavoriteCubit, FavoriteState>(
                      builder: (context, state) {
                        return LargeProductCard(
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
                                  productId: productId,
                                );
                          },
                          onCartTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return BlocProvider(
                                  create: (context) => getIt<DetailsCubit>()..getProductDetails(productId: productId),
                                  child:
                                      BlocBuilder<DetailsCubit, DetailsState>(
                                    buildWhen: (previous, current) => previous.productDetailsState != current.productDetailsState,
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
                    ),
                  );
                }
              },
            );
      },
    );
  }
  @override
  void dispose() {
    _scrollController..removeListener(_onScroll)..dispose();
    super.dispose();
  }
}
