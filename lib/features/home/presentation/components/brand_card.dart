import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/core/util/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class BrandCard extends StatelessWidget {
  const BrandCard({
    super.key,
    required this.productName,
    required this.productImage,
    required this.productPrice,
    required this.onFavoriteTap,
    required this.onCartTap,
    required this.isFavorite,
  });

  final String productName;
  final String productImage;
  final int productPrice;
  final void Function() onFavoriteTap;
  final void Function() onCartTap;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          CachedNetworkImage(
            width: 150.w,
            imageUrl: productImage,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: -5,
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
                              productName,
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
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: IconButton(
                          onPressed: onCartTap,
                          icon: Icon(
                            Iconsax.bag_2,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          Positioned(
            top: 2,
            right: -5,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeOut,
              child: IconButton(
                key: ValueKey<bool>(isFavorite),
                onPressed: onFavoriteTap,
                icon: Icon(
                  isFavorite ? Iconsax.heart5 : Iconsax.heart,
                  color: ColorsManager.lightPrimaryColor,
                ),
              ),
            ),
          ),
        ],
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