import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/shared/presentation/widgets/favorite_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class OffersCard extends StatelessWidget {
  const OffersCard({
    super.key,
    required this.productImage,
    required this.productName,
    required this.oldPrice,
    required this.newPrice,
    required this.onFavorite,
    required this.onAddToCart,
    required this.onOfferTap,
    required this.isFavorite,
  });

  final String productImage;
  final String productName;
  final int oldPrice;
  final int newPrice;
  final void Function() onFavorite;
  final void Function() onAddToCart;
  final void Function() onOfferTap;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onOfferTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16).r,
        child: Stack(
          children: [
            CachedNetworkImage(
              width: 250.h,
              imageUrl: productImage,
              fit: BoxFit.cover,
            ),
            Positioned(
              left: -10,
              right: -10,
              bottom: -5,
              child: ClipPath(
                clipper: OffersClipper(),
                child: SizedBox(
                  width: 260.w,
                  height: 72.h,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(0.9),
                              Colors.black.withOpacity(0.9),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: const [0.0, 2.0],
                          ),
                        ),
                      ),
                      Container(
                        color: const Color(0xFF001D34).withOpacity(0.7),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            productName,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.white),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '\$$oldPrice',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: const Color(0xFF99CBFF),
                                      decoration: TextDecoration.lineThrough,
                                      decorationColor: const Color(0xFF99CBFF),
                                      decorationThickness: 2.0,
                                    ),
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                '\$$newPrice',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: IconButton(
                          onPressed: onAddToCart,
                          icon: Icon(
                            Iconsax.bag_2,
                            color: Theme.of(context).colorScheme.primary,
                            size: 26,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 3,
              right: 3,
              child: FavoriteIconButton(
                isFavorite: isFavorite,
                onFavoriteTap: onFavorite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OffersClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path0 = Path();
    path0.moveTo(size.width, size.height * 0.3750792);
    path0.cubicTo(
        size.width,
        size.height * 0.3750792,
        size.width * 0.2456492,
        size.height * -0.2776153,
        size.width * 0.05311589,
        size.height * 0.1389972);
    path0.cubicTo(
        size.width * -0.06639496,
        size.height * 0.3976014,
        size.width * 0.05311589,
        size.height,
        size.width * 0.05311589,
        size.height);
    path0.lineTo(size.width, size.height);
    path0.lineTo(size.width, size.height * 0.3750792);
    path0.close();
    return path0;
  }

  @override
  bool shouldReclip(covariant OffersClipper oldClipper) {
    return true;
  }
}
