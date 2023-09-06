import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/core/router/app_router.dart';
import 'package:efashion_flutter/shared/presentation/widgets/cart_bottom_sheet.dart';
import 'package:efashion_flutter/features/home/presentation/components/shared/small_brand_card.dart';
import 'package:efashion_flutter/features/home/presentation/mock/product_mock.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class GridViewComponent extends StatefulWidget {
  const GridViewComponent({Key? key, required this.products}) : super(key: key);
  final List products;

  @override
  State<GridViewComponent> createState() => _GridViewComponentState();
}

class _GridViewComponentState extends State<GridViewComponent> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 3 / 4,
      ),
      itemCount: widget.products.length,
      itemBuilder: (context, index) {
        if (widget.products.isEmpty) {
          return Center(
            child: Column(
              children: [
                Icon(
                  Iconsax.search_normal_1,
                  color: Theme.of(context).colorScheme.primary,
                  size: 80,
                ),
                Text(
                  'No result yet\n try to type something.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.outline
                  )
                )
              ],
            ),
          );
        } else {
          return SmallProductCard(
            isCartActive: true,
            productImage: widget.products[index].productImage,
            productName: widget.products[index].productName,
            productPrice: widget.products[index].productPrice,
            isFavorite: widget.products[index].isFavorite,
            onTap: () {
              context.pushRoute(
                  DetailsRoute(productId: widget.products[index].productId));
            },
            onFavoriteTap: () {
              setState(() {
                widget.products[index].isFavorite =
                    !brandProducts[index].isFavorite;
              });
            },
            onCartTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return CartBottomSheet(
                    productName: widget.products[index].productName,
                    productPrice: widget.products[index].productPrice,
                    productColors: widget.products[index].productColors,
                    productSizes: widget.products[index].productSizes,
                    productPieces: widget.products[index].avaliblePieces,
                  );
                },
              );
            },
          );
        }
      },
    );
  }
}
