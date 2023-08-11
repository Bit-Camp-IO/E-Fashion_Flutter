import 'package:carousel_slider/carousel_slider.dart';
import 'package:efashion_flutter/features/home/presentation/components/offers_card.dart';
import 'package:efashion_flutter/features/home/presentation/mock/offers_mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OffersCarousel extends StatelessWidget {
  const OffersCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: offersList.length,
      itemBuilder: (context, index, realIndex) {
        return OffersCard(
          productImage: offersList[index].productImage,
          productName: offersList[index].productName,
          newPrice: offersList[index].newPrice,
          oldPrice: offersList[index].oldPrice,
          onAddToCart: () {},
          onFavorite: () {},
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
