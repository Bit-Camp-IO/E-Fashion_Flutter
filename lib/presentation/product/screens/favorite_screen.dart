import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/presentation/shared/bloc/favorite_cubit/favorite_cubit.dart';
import 'package:efashion_flutter/presentation/product/components/favorite/favorite_card.dart';
import 'package:efashion_flutter/presentation/product/components/favorite/favorite_shimmer_loading_card.dart';
import 'package:efashion_flutter/presentation/shared/widgets/cart_bottom_sheet.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_appbar.dart';
import 'package:efashion_flutter/presentation/shared/widgets/empty_widget.dart';
import 'package:efashion_flutter/presentation/shared/widgets/no_internet_connection_widget.dart';
import 'package:efashion_flutter/core/router/app_router.dart';
import 'package:efashion_flutter/shared/util/assets_manager.dart';
import 'package:efashion_flutter/shared/util/enums.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  int switchIndex = 0;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 16, right: 16).r,
        child: Column(
          children: [
            const CustomAppBar(
              appBarTitle: StringsManager.favoriteScreenTitle,
              disableBackButton: true,
              appBarType: AppBarType.normal,
            ),
            Expanded(
              child: BlocConsumer<FavoriteCubit, FavoriteState>(
                listener: (context, state) {
                  if (state.favoriteListState == CubitState.loading) {
                    isLoading = true;
                  }else{
                    isLoading = false;
                  }
                },
                builder: (context, state) {
                  if (state.favoriteList.isEmpty && state.favoriteListState == CubitState.success) {
                    return const EmptyWidget(
                      image: AssetsManager.favoriteImage,
                      title: StringsManager.emptyFavoriteTitle,
                      subTitle: StringsManager.emptyFavoriteSubTitle,
                    );
                  } else if (state.favoriteListState == CubitState.failure) {
                    return NoInternetConnectionWidget(
                      onButtonTap: () {
                        context.read<FavoriteCubit>().getUserFavoriteIdList();
                      },
                      isButtonLoading: isLoading,
                    );
                  } else {
                    return Column(
                      children: [
                        Expanded(
                          child: GridView.builder(
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 13.h,
                              crossAxisSpacing: 10.w,
                              mainAxisExtent: 236.h,
                            ),
                            itemCount: state.favoriteListState == CubitState.loading ? 6 : state.favoriteList.length,
                            itemBuilder: (context, index) {
                              if (state.favoriteListState == CubitState.initial || state.favoriteListState == CubitState.loading) {
                                return const FavoriteShimmerLoadingCard();
                              } else {
                                final String productId = state.favoriteList[index].id;
                                final String productImage = state.favoriteList[index].images[0];
                                final String productName = state.favoriteList[index].title;
                                final int productPrice = state.favoriteList[index].price.toInt();
                                return AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 500),
                                  switchInCurve: Curves.easeIn,
                                  switchOutCurve: Curves.easeOut,
                                  child: FavoriteCard(
                                    key: ValueKey<String>(productId),
                                    productImage: productImage,
                                    productId: productId,
                                    productName: productName,
                                    productPrice: productPrice,
                                    isFavorite: state.favoritesIds.contains(productId),
                                    onCardTap: () {
                                      context.pushRoute(ProductDetailsRoute(
                                          productId: productId));
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
                                          return BlocProvider.value(
                                            value: context.read<FavoriteCubit>(),
                                            child: BlocBuilder<FavoriteCubit, FavoriteState>(
                                              builder: (context, state) {
                                                return CartBottomSheet(
                                                  productName: state.favoriteList[index].title,
                                                  productId: state.favoriteList[index].id,
                                                  productPrice: state.favoriteList[index].price.toInt(),
                                                  productColors: state.favoriteList[index].colors,
                                                  productSizes: state.favoriteList[index].sizes,
                                                  productStock: state.favoriteList[index].stock,
                                                );
                                              },
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
