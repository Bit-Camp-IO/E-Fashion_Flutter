import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/core/util/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReviewProductCard extends StatelessWidget {
  const ReviewProductCard({
    super.key,
    required this.productImage,
    required this.productName,
    required this.productPrice,
  });

  final String productImage;
  final String productName;
  final int productPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10).r,
          child: CachedNetworkImage(
            width: 120.w,
            height: 140.h,
            imageUrl: productImage,
            fit: BoxFit.cover,
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              productName,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: ColorsManager.textColorPrimary),
            ),
            Text(
              '\$$productPrice',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: ColorsManager.textColorPrimary),
            )
          ],
        ),
        const Spacer(flex: 2),
      ],
    );
  }
}
