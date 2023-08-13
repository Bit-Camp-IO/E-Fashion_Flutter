import 'package:efashion_flutter/features/home/presentation/components/brand_card.dart';
import 'package:efashion_flutter/features/home/presentation/components/cart_bottom_sheet.dart';
import 'package:efashion_flutter/features/home/presentation/mock/product_mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandComponent extends StatefulWidget {
  const BrandComponent({super.key});

  @override
  State<BrandComponent> createState() => _BrandComponentState();
}

class _BrandComponentState extends State<BrandComponent> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.h,
      child: ListView.builder(
        itemCount: brandProducts.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0).r,
            child: BrandCard(
              productImage: brandProducts[index].productImage,
              productName: brandProducts[index].productName,
              productPrice: brandProducts[index].productPrice,
              isFavorite: brandProducts[index].isFavorite,
              onCartTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return CartBottomSheet(
                      productName: brandProducts[index].productName,
                      productPrice: brandProducts[index].productPrice,
                      productColors: brandProducts[index].productColors,
                      productSizes: brandProducts[index].productSizes,
                      productPieces: brandProducts[index].avaliblePieces,
                    );
                  },
                );
              },
              onFavoriteTap: () {
                setState(() {
                  brandProducts[index].isFavorite =
                      !brandProducts[index].isFavorite;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
