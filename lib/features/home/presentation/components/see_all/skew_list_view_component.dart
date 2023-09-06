import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/core/router/app_router.dart';
import 'package:efashion_flutter/shared/presentation/widgets/cart_bottom_sheet.dart';
import 'package:efashion_flutter/shared/presentation/widgets/list_view_card.dart';
import 'package:efashion_flutter/shared/presentation/widgets/top_list_view_card.dart';
import 'package:efashion_flutter/features/home/presentation/mock/product_mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SkewListViewComponent extends StatefulWidget {
  const SkewListViewComponent({Key? key}) : super(key: key);
  @override
  State<SkewListViewComponent> createState() => _SkewListViewComponentState();
}

class _SkewListViewComponentState extends State<SkewListViewComponent> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: brandProducts.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TopListViewCard(
              productImage: brandProducts[index].productImage,
              productName: brandProducts[index].productName,
              productPrice: brandProducts[index].productPrice,
              isFavorite: brandProducts[index].isFavorite,
              onTap: () {
                context.pushRoute(DetailsRoute(productId: brandProducts[index].productId));
              },
              onFavoriteTap: () {
                setState(() {
                  brandProducts[index].isFavorite =
                  !brandProducts[index].isFavorite;
                });
              },
              onCartTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return CartBottomSheet(
                      productName:
                      brandProducts[index].productName,
                      productPrice:
                      brandProducts[index].productPrice,
                      productColors:
                      brandProducts[index].productColors,
                      productSizes:
                      brandProducts[index].productSizes,
                      productPieces:
                      brandProducts[index].avaliblePieces,
                    );
                  },
                );
              },
            ),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0).r,
            child: ListViewCard(
              productImage: brandProducts[index].productImage,
              productName: brandProducts[index].productName,
              productPrice: brandProducts[index].productPrice,
              isFavorite: brandProducts[index].isFavorite,
              onTap: () {
                context.pushRoute(DetailsRoute(productId: brandProducts[index].productId));
              },
              onFavoriteTap: () {
                setState(() {
                  brandProducts[index].isFavorite =
                  !brandProducts[index].isFavorite;
                });
              },
              onCartTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return CartBottomSheet(
                      productName:
                      brandProducts[index].productName,
                      productPrice:
                      brandProducts[index].productPrice,
                      productColors:
                      brandProducts[index].productColors,
                      productSizes:
                      brandProducts[index].productSizes,
                      productPieces:
                      brandProducts[index].avaliblePieces,
                    );
                  },
                );
              },
            ),
          );
        }
      },
    );
  }
}
