import 'package:carousel_slider/carousel_slider.dart';
import 'package:efashion_flutter/features/home/presentation/components/cart_bottom_sheet.dart';
import 'package:efashion_flutter/features/home/presentation/components/offers_card.dart';
import 'package:efashion_flutter/features/home/presentation/mock/product_mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OffersCarousel extends StatefulWidget {
  const OffersCarousel({
    super.key,
  });

  @override
  State<OffersCarousel> createState() => _OffersCarouselState();
}

class _OffersCarouselState extends State<OffersCarousel> {
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
          onOfferTap: () {},
        );
      },
      options: CarouselOptions(
        height: 180.h,
        autoPlay: true,
        viewportFraction: 0.65,
        enlargeCenterPage: true,
      ),
    );
  }
}




