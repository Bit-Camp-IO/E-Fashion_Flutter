import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/presentation/product/bloc/favorite_cubit/favorite_cubit.dart';
import 'package:efashion_flutter/presentation/product/components/favorite/favorite_card.dart';
import 'package:efashion_flutter/presentation/shared/widgets/cart_bottom_sheet.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_appbar.dart';
import 'package:efashion_flutter/shared/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class FavoriteScreen extends StatefulWidget implements AutoRouteWrapper {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider.value(
      value:  context.read<FavoriteCubit>()..getFavoriteProductsList(),
      child: this,
    );
  }
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  int switchIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 16, right: 16).r,
        child: Column(
          children: [
            const CustomAppBar(
              appBarTitle: 'Your Favourites 💙',
              disableBackButton: true,
              appBarType: AppBarType.normal,
            ),
            BlocBuilder<FavoriteCubit, FavoriteState>(
              builder: (context, state) {
                return Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 13.h,
                      crossAxisSpacing: 10.w,
                      mainAxisExtent: 236.h,
                    ),
                    itemCount: state.favoriteList.length,
                    itemBuilder: (context, index) {
                      final String productId = state.favoriteList[index].id;
                      final String productImage =
                          state.favoriteList[index].images[0];
                      final String productName =
                          state.favoriteList[index].title;
                      final int productPrice =
                          state.favoriteList[index].price.toInt();
                      return FavoriteCard(
                        productImage: productImage,
                        productId: productId,
                        productName: productName,
                        productPrice: productPrice,
                        isFavorite: state.favoritesIds.contains(productId),
                        onCardTap: () {
                          context.pushRoute(ProductDetailsRoute(productId: productId));
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
                              return BlocProvider.value(
                                value: context.read<FavoriteCubit>(),
                                child:
                                    BlocBuilder<FavoriteCubit, FavoriteState>(
                                    builder: (context, state) {
                                    return CartBottomSheet(
                                      productName: state.favoriteList[index].title,
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
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
