import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/shared/util/size_manager.dart';
import 'package:efashion_flutter/presentation/shared/widgets/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselCard extends StatelessWidget {
  const CarouselCard({
    super.key,
    required this.discount,
    required this.collectionName,
    required this.cardImageUrl,
    required this.onTap,
  });

  final int discount;
  final String collectionName;
  final String cardImageUrl;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ).r,
          child: CachedNetworkImage(
            height: 320.h,
            imageUrl: cardImageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 20.h,
          bottom: 80.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$collectionName COLLECTION',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
              SizedBox(height: 8.h),
              Container(
                width: _getTextWidth(context, collectionName),
                height: 2,
                color: Colors.white,
              ),
              Text(
                '$discount%OFF',
                style: SizeManager.screenWidth <= 400
                    ? Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: Colors.white)
                    : Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(color: Colors.white),
              ),
              Text(
                'For Selected collection',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
        Positioned(
          right: 10.w,
          bottom: 30.h,
          child: SecondaryButton(
            width: 100.w,
            height: 48.h,
            buttonTitle: 'Shop Now',
            onTap: onTap,
          ),
        )
      ],
    );
  }

  double _getTextWidth(BuildContext context, String text) {
    final textPainter = TextPainter(
      text:
          TextSpan(text: text, style: Theme.of(context).textTheme.titleMedium),
      textDirection: TextDirection.ltr,
    )..layout();

    return textPainter.width;
  }
}
