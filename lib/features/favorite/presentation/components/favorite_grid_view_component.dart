import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/config/router/app_router.dart';
import 'package:efashion_flutter/core/widgets/cart_bottom_sheet.dart';
import 'package:efashion_flutter/core/widgets/grid_card.dart';
import 'package:efashion_flutter/core/widgets/top_grid_card.dart';
import 'package:efashion_flutter/features/favorite/presentation/mock/favorites_mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteGridViewComponent extends StatefulWidget {
  const FavoriteGridViewComponent({Key? key}) : super(key: key);

  @override
  State<FavoriteGridViewComponent> createState() => _FavoriteGridViewComponentState();
}

class _FavoriteGridViewComponentState extends State<FavoriteGridViewComponent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0).r,
      child: GridView.builder(
        gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3/4,
        ),
        itemCount:favoriteList.length,
        itemBuilder: (context, index) {
          if (index == 0) {
            return TopGridCard(
              productImage:favoriteList[index].productImage,
              productName:favoriteList[index].productName,
              productPrice:favoriteList[index].productPrice,
              isFavorite:favoriteList[index].isFavorite,
              onTap: () {
                context.pushRoute(DetailsRoute(productId:favoriteList[index].productId));
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
            );
          } else if (index == 1) {
            return TopGridCard(
              productImage:favoriteList[index].productImage,
              productName:favoriteList[index].productName,
              productPrice:favoriteList[index].productPrice,
              isFavorite:favoriteList[index].isFavorite,
              onTap: () {
                context.pushRoute(DetailsRoute(productId:favoriteList[index].productId));
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
              reverse: true,
            );
          } else if (index % 2 == 0) {
            return GridCard(
              productImage:favoriteList[index].productImage,
              productName:favoriteList[index].productName,
              productPrice:favoriteList[index].productPrice,
              isFavorite:favoriteList[index].isFavorite,
              onTap: () {
                context.pushRoute(DetailsRoute(productId:favoriteList[index].productId));
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
            );
          } else {
            return GridCard(
              productImage:favoriteList[index].productImage,
              productName:favoriteList[index].productName,
              productPrice:favoriteList[index].productPrice,
              isFavorite:favoriteList[index].isFavorite,
              onTap: () {
                context.pushRoute(DetailsRoute(productId:favoriteList[index].productId));
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
              reverse: true,
            );
          }
        },
      ),
    );
  }
}
