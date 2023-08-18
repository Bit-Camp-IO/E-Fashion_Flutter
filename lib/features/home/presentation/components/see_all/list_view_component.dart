import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/config/router/app_router.dart';
import 'package:efashion_flutter/core/widgets/cart_bottom_sheet.dart';
import 'package:efashion_flutter/features/home/presentation/components/see_all/list_view_card.dart';
import 'package:efashion_flutter/features/home/presentation/components/see_all/top_list_view_card.dart';
import 'package:efashion_flutter/features/home/presentation/mock/product_mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewComponent extends StatefulWidget {
  const ListViewComponent({Key? key}) : super(key: key);

  @override
  State<ListViewComponent> createState() => _ListViewComponentState();
}

class _ListViewComponentState extends State<ListViewComponent> {
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
