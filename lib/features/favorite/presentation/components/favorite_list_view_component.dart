import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/config/router/app_router.dart';
import 'package:efashion_flutter/core/widgets/cart_bottom_sheet.dart';
import 'package:efashion_flutter/core/widgets/list_view_card.dart';
import 'package:efashion_flutter/core/widgets/top_list_view_card.dart';
import 'package:efashion_flutter/features/favorite/presentation/mock/favorites_mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteListViewComponent extends StatefulWidget {
  const FavoriteListViewComponent({Key? key}) : super(key: key);
  @override
  State<FavoriteListViewComponent> createState() => _FavoriteListViewComponentState();
}

class _FavoriteListViewComponentState extends State<FavoriteListViewComponent> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favoriteList.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TopListViewCard(
              productImage: favoriteList[index].productImage,
              productName: favoriteList[index].productName,
              productPrice: favoriteList[index].productPrice,
              isFavorite: favoriteList[index].isFavorite,
              onTap: () {
                context.pushRoute(DetailsRoute(productId: favoriteList[index].productId));
              },
              onFavoriteTap: () {
                setState(() {
                  favoriteList[index].isFavorite =
                  !favoriteList[index].isFavorite;
                });
              },
              onCartTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return CartBottomSheet(
                      productName:
                      favoriteList[index].productName,
                      productPrice:
                      favoriteList[index].productPrice,
                      productColors:
                      favoriteList[index].productColors,
                      productSizes:
                      favoriteList[index].productSizes,
                      productPieces:
                      favoriteList[index].avaliblePieces,
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
              productImage: favoriteList[index].productImage,
              productName: favoriteList[index].productName,
              productPrice: favoriteList[index].productPrice,
              isFavorite: favoriteList[index].isFavorite,
              onTap: () {
                context.pushRoute(DetailsRoute(productId: favoriteList[index].productId));
              },
              onFavoriteTap: () {
                setState(() {
                  favoriteList[index].isFavorite =
                  !favoriteList[index].isFavorite;
                });
              },
              onCartTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return CartBottomSheet(
                      productName:
                      favoriteList[index].productName,
                      productPrice:
                      favoriteList[index].productPrice,
                      productColors:
                      favoriteList[index].productColors,
                      productSizes:
                      favoriteList[index].productSizes,
                      productPieces:
                      favoriteList[index].avaliblePieces,
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
