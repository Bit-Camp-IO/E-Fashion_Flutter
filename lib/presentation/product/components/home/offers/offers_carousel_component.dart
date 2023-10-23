import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:efashion_flutter/presentation/product/components/home/offers/offers_shimmer_loading.dart';
import 'package:efashion_flutter/presentation/shared/widgets/section_shimmer_loading.dart';
import 'package:efashion_flutter/shared/router/app_router.dart';
import 'package:efashion_flutter/presentation/product/bloc/details_cubit/details_cubit.dart';
import 'package:efashion_flutter/presentation/product/bloc/home_bloc/home_bloc.dart';
import 'package:efashion_flutter/presentation/product/components/shared/section_widget.dart';
import 'package:efashion_flutter/injection_container.dart';
import 'package:efashion_flutter/presentation/product/bloc/favorite_cubit/favorite_cubit.dart';
import 'package:efashion_flutter/presentation/product/screens/discover_products_screen.dart';
import 'package:efashion_flutter/presentation/shared/widgets/cart_bottom_sheet.dart';
import 'package:efashion_flutter/presentation/product/components/home/offers/offers_card.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OffersCarouselComponent extends StatefulWidget {
  const OffersCarouselComponent({super.key});

  @override
  State<OffersCarouselComponent> createState() => _OffersCarouselComponentState();
}

class _OffersCarouselComponentState extends State<OffersCarouselComponent> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) => previous.productsOffers != current.productsOffers,
      builder: (context, state) {
        return Column(
          children: [
          state.productsOffers.isEmpty ? const SectionShimmerLoading():
          SectionWidget(
              sectionTitle: StringsManager.offersSectionTitle,
              sectionType: SectionType.withTextButton,
              onTextButtonTap: () {
                context.pushRoute(DiscoverProductsRoute(
                  categories: context.read<HomeBloc>().categories,
                  discoverScreenType: DiscoverScreenType.offers,
                ));
              },
            ),
            CarouselSlider.builder(
              itemCount: state.productsOffers.isEmpty ? 3 : state.productsOffers.length,
              itemBuilder: (context, index, realIndex) {
                if(state.productsOffers.isEmpty){
                  return const OffersShimmerLoading();
                }else{
                  final productId = state.productsOffers[index].id;
                  final productImage = state.productsOffers[index].imageUrl;
                  final productName = state.productsOffers[index].title;
                  final newPrice = state.productsOffers[index].price.toInt();
                  final oldPrice = state.productsOffers[index].oldPrice.toInt();
                  return BlocBuilder<FavoriteCubit, FavoriteState>(
                    buildWhen: (previous, current) => previous != current,
                    builder: (context, state) {
                      return OffersCard(
                        productImage: productImage,
                        productName: productName,
                        newPrice: newPrice,
                        oldPrice: oldPrice,
                        isFavorite: state.favoritesIds.contains(productId),
                        onAddToCart: () {
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
                        onFavorite: () {
                          context.read<FavoriteCubit>().addOrRemoveProductFromFavoriteListEvent(productId: productId);
                        },
                        onOfferTap: () {
                          context.pushRoute(ProductDetailsRoute(productId: productId));
                        },
                      );
                    },
                  );
                }
              },
              options: CarouselOptions(
                height: 180.h,
                viewportFraction: 0.65,
                enlargeCenterPage: true,
              ),
            ),
          ],
        );
      },
    );
  }
}
