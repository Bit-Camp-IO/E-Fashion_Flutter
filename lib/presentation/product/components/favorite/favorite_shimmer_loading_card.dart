import 'package:efashion_flutter/presentation/product/components/favorite/favorite_card.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteShimmerLoadingCard extends StatelessWidget {
  const FavoriteShimmerLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomShimmerEffect(
      child: SizedBox(
        height: 236.h,
        child: Stack(
          children: [
            ClipPath(
              clipper: FavoriteClipper(),
              child: Container(
                width: 150.w,
                height: 180.h,
                color: Theme.of(context).colorScheme.outlineVariant,
              ),
            ),
            Positioned(
              left: 0,
              right: 10.h,
              bottom: 40.h,
              child: Container(
                width: 29.w,
                height: 29.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.outlineVariant,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 10.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 8.h,
                    width: 65.w,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.outlineVariant,
                      borderRadius: BorderRadius.circular(10).r,
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Container(
                    height: 5.h,
                    width: 35.w,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.outlineVariant,
                      borderRadius: BorderRadius.circular(10).r,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
