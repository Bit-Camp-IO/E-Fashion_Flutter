import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/presentation/shared/widgets/cart_icon_button.dart';
import 'package:efashion_flutter/presentation/shared/widgets/favorite_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SmallProductCard extends StatelessWidget {
  const SmallProductCard({
    super.key,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.onTap,
    required this.onFavoriteTap,
    required this.isCartActive,
    this.onCartTap,
    required this.isFavorite,
  });

  final String productName;
  final String productImage;
  final int productPrice;
  final void Function() onTap;
  final void Function() onFavoriteTap;
  final void Function()? onCartTap;
  final bool isCartActive;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20).r,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              width: 150.w,
              height: 180.h,
              imageUrl:productImage,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: -5.h,
              child: ClipPath(
                clipper: BrandClipper(),
                child: SizedBox(
                  width: 160.w,
                  height: 65.h,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.white.withOpacity(0.9),
                              Colors.black.withOpacity(0.9),
                            ],
                            stops: const [0.0, 2.0],
                          ),
                        ),
                      ),
                      Container(
                        color: const Color(0xFF001D34).withOpacity(0.7),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, top: 8.0).r,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                             productName.length > 13 ? '${productName.substring(0, 13)}..'
                                  : productName,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.white),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              '\$$productPrice',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      isCartActive
                          ? Positioned(
                              bottom: 5.h,
                              right: 5.w,
                              child: CartIconButton(onCartTap: onCartTap),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 2.h,
              right: -5.w,
              child: FavoriteIconButton(
                isFavorite: isFavorite,
                onFavoriteTap: onFavoriteTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BrandClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.8718733, size.height * 0.2796047);
    path_0.cubicTo(size.width * 0.9500267, size.height * 0.3342859, size.width,
        size.height * 0.3750781, size.width, size.height * 0.3750781);
    path_0.lineTo(size.width, size.height);
    path_0.lineTo(size.width * -0.003697013, size.height);
    path_0.cubicTo(
        size.width * -0.003697013,
        size.height,
        size.width * -0.1303787,
        size.height * 0.3976016,
        size.width * -0.003697013,
        size.height * 0.1389972);
    path_0.cubicTo(
        size.width * 0.002680647,
        size.height * 0.1259781,
        size.width * 0.009639867,
        size.height * 0.1140031,
        size.width * 0.01713807,
        size.height * 0.1030200);
    path_0.cubicTo(
        size.width * 0.1895973,
        size.height * -0.1495939,
        size.width * 0.6471833,
        size.height * 0.1223984,
        size.width * 0.8718733,
        size.height * 0.2796047);
    path_0.close();
    return path_0;
  }

  @override
  bool shouldReclip(covariant BrandClipper oldClipper) {
    return true;
  }
}
