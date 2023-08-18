import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/config/router/app_router.dart';
import 'package:efashion_flutter/core/widgets/cart_bottom_sheet.dart';
import 'package:efashion_flutter/features/home/presentation/components/see_all/grid_card.dart';
import 'package:efashion_flutter/features/home/presentation/components/see_all/top_grid_card.dart';
import 'package:efashion_flutter/features/home/presentation/mock/product_mock.dart';
import 'package:flutter/material.dart';

class GridViewComponent extends StatefulWidget {
  const GridViewComponent({Key? key}) : super(key: key);

  @override
  State<GridViewComponent> createState() => _GridViewComponentState();
}

class _GridViewComponentState extends State<GridViewComponent> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
      const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 3 / 4,
      ),
      itemCount: brandProducts.length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return TopGridCard(
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
          );
        } else if (index == 1) {
          return TopGridCard(
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
            reverse: true,
          );
        } else if (index % 2 == 0) {
          return GridCard(
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
          );
        } else {
          return GridCard(
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
            reverse: true,
          );
        }
      },
    );
  }
}
