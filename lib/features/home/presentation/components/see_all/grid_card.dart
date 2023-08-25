import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/core/util/assets_manager.dart';
import 'package:efashion_flutter/core/widgets/favorite_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class GridCard extends StatelessWidget {
  const GridCard({
    super.key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.isFavorite,
    required this.onTap,
    required this.onFavoriteTap,
    required this.onCartTap,
    this.reverse = false,
  });

  final String productImage;
  final String productName;
  final int productPrice;
  final bool isFavorite;
  final void Function() onTap;
  final void Function() onFavoriteTap;
  final void Function() onCartTap;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Transform(
            transform: reverse ? Matrix4.skewY(0.13) : Matrix4.skewY(-0.13),
            alignment: reverse ? Alignment.topRight : Alignment.topLeft,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  top: -10,
                  left: 0,
                  right: 0,
                  bottom: -20,
                  child: Transform(
                    transform:
                    reverse ? Matrix4.skewY(-0.13) : Matrix4.skewY(0.13),
                    alignment: reverse ? Alignment.topLeft : Alignment.topRight,
                    child: CachedNetworkImage(
                      imageUrl: productImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -5,
                  child: Transform(
                    transform:
                    reverse ? Matrix4.skewY(-0.13) : Matrix4.skewY(0.13),
                    alignment: reverse ? Alignment.topRight : Alignment.topLeft,
                    child: Image.asset(
                      reverse
                          ? AssetsManager.gridShapeReverse
                          : AssetsManager.gridShape,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: reverse ? null : 2,
            right: reverse ? 2 : null,
            child: FavoriteIconButton(
              isFavorite: isFavorite,
              onFavoriteTap: onFavoriteTap,
            ),
          ),
          Positioned(
            bottom: 10,
            right: reverse ? 1 : null,
            left: reverse ? null : 1,
            child: IconButton(
              onPressed: onCartTap,
              icon: Icon(
                Iconsax.bag_2,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          Positioned(
            bottom: 28,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  productName,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                  ),
                ),
                Text(
                  '\$$productPrice',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}