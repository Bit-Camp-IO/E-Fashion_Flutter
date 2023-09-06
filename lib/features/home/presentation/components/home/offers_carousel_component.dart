import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:efashion_flutter/core/router/app_router.dart';
import 'package:efashion_flutter/shared/presentation/widgets/cart_bottom_sheet.dart';
import 'package:efashion_flutter/features/home/presentation/components/home/offers_card.dart';
import 'package:efashion_flutter/features/home/presentation/mock/product_mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OffersCarouselComponent extends StatefulWidget {
  const OffersCarouselComponent({
    super.key,
  });

  @override
  State<OffersCarouselComponent> createState() => _OffersCarouselComponentState();
}

class _OffersCarouselComponentState extends State<OffersCarouselComponent> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: offersList.length,
      itemBuilder: (context, index, realIndex) {
        return OffersCard(
          productImage: offersList[index].productImage,
          productName: offersList[index].productName,
          newPrice: offersList[index].productPrice,
          oldPrice: offersList[index].oldProductPrice!,
          isFavorite: offersList[index].isFavorite,
          onAddToCart: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return CartBottomSheet(
                  productName: offersList[index].productName,
                  productPrice: offersList[index].productPrice,
                  productColors: offersList[index].productColors,
                  productSizes: offersList[index].productSizes,
                  productPieces: offersList[index].avaliblePieces,
                );
              },
            );
          },
          onFavorite: () {
            setState(() {
              offersList[index].isFavorite = !offersList[index].isFavorite;
            });
          },
          onOfferTap: () {
            context.pushRoute(DetailsRoute(productId: offersList[index].productId));
          },
        );
      },
      options: CarouselOptions(
        height: 180.h,
        viewportFraction: 0.65,
        enlargeCenterPage: true,
      ),
    );
  }
}