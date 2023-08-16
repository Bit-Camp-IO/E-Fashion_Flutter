import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/core/util/assets_manager.dart';
import 'package:efashion_flutter/core/widgets/favorite_icon_button.dart';
import 'package:efashion_flutter/core/widgets/card_bottom_skew_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class TopGridCard extends StatelessWidget {
  const TopGridCard({
    super.key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.isFavorite,
    required this.onFavoriteTap,
    required this.onCartTap,
    this.reverse = false,
  });

  final String productImage;
  final String productName;
  final int productPrice;
  final bool isFavorite;
  final void Function() onFavoriteTap;
  final void Function() onCartTap;
  final bool reverse;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper:
          CardBottomSkewClipper(skewAmount: 0.1, reverse: reverse),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: reverse
                  ? const Radius.circular(20)
                  : const Radius.circular(0),
              topLeft: reverse
                  ? const Radius.circular(0)
                  : const Radius.circular(20),
            ).r,
            child: Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  imageUrl: productImage,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: -1,
                  child: Image.asset(
                    reverse
                        ? AssetsManager.gridShapeReverse
                        : AssetsManager.gridShape,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: reverse ? 2 : null,
                  left: reverse ? null : 2,
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
          ),
        ),
        Positioned(
          top: 1,
          right: reverse ? 1 : null,
          left: reverse ? null : 1,
          child: FavoriteIconButton(
            isFavorite: isFavorite,
            onFavoriteTap: onFavoriteTap,
          ),
        )
      ],
    );
  }
}