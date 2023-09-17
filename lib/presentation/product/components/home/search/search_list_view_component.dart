import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/core/router/app_router.dart';
import 'package:efashion_flutter/presentation/shared/widgets/cart_bottom_sheet.dart';
import 'package:efashion_flutter/presentation/product/components/shared/large_product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListViewComponent extends StatefulWidget {
  const ListViewComponent({super.key, required this.products});

  final List products;

  @override
  State<ListViewComponent> createState() => _ListViewComponentState();
}

class _ListViewComponentState extends State<ListViewComponent> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0).r,
            child: LargeProductCard(
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
                      !widget.products[index].isFavorite;
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
            ),
          );
        });
  }
}
