import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselCard extends StatelessWidget {
  const CarouselCard({
    super.key,
    required this.offerPercentage,
    required this.collectionName,
    required this.cardImageUrl,
    required this.onTap,
  });
  final int offerPercentage;
  final String collectionName;
  final String cardImageUrl;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          child: CachedNetworkImage(
            width: MediaQuery.sizeOf(context).width,
            height: 320.h,
            imageUrl: cardImageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          left: 20,
          top: 140,
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
                '$offerPercentage%OFF',
                style: Theme.of(context)
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
          right: 20,
          bottom: 30,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              width: 100.w,
              height: 48.h,
              decoration: const BoxDecoration(
                  color: Color(0xFF526070),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    topLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )),
              child: Center(
                child: Text(
                  'Shop Now',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
  double _getTextWidth(BuildContext context, String text) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: Theme.of(context).textTheme.titleMedium),
      textDirection: TextDirection.ltr,
    )..layout();

    return textPainter.width;
  }
}

