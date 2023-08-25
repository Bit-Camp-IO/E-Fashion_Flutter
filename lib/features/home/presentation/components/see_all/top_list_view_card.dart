import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/core/util/assets_manager.dart';
import 'package:efashion_flutter/core/widgets/favorite_icon_button.dart';
import 'package:efashion_flutter/core/widgets/card_bottom_skew_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class TopListViewCard extends StatelessWidget {
  const TopListViewCard({
    super.key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.isFavorite,
    required this.onTap,
    required this.onFavoriteTap,
    required this.onCartTap,
  });
  final String productImage;
  final String productName;
  final int productPrice;
  final bool isFavorite;
  final void Function() onTap;
  final void Function() onFavoriteTap;
  final void Function() onCartTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 312.w,
        height: 300.h,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipPath(
              clipper: CardBottomSkewClipper(skewAmount: 0.12, reverse: true),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
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
                      bottom: -10,
                      child: Image.asset(
                        AssetsManager.listViewShape,
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: FavoriteIconButton(
                isFavorite: isFavorite,
                onFavoriteTap: onFavoriteTap,
              ),
            ),
            Positioned(
              right: 5,
              bottom: 45,
              child: IconButton(
                onPressed: onCartTap,
                icon: Icon(
                  Iconsax.bag_2,
                  color: Theme.of(context).colorScheme.primary,
                  size: 26,
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    productName,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
    );
  }
}
