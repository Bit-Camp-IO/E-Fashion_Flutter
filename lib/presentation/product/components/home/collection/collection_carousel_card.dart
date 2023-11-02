import 'package:cached_network_image/cached_network_image.dart';
import 'package:efashion_flutter/shared/constants/app_constants.dart';
import 'package:efashion_flutter/presentation/shared/widgets/secondary_button.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CarouselCard extends StatelessWidget {
  final int discount;
  final String collectionName;
  final String cardImageUrl;
  final void Function() onTap;

  const CarouselCard({
    super.key,
    required this.discount,
    required this.collectionName,
    required this.cardImageUrl,
    required this.onTap,
  });

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
            cacheManager: CacheManager(
              Config(
                AppConstants.cacheFolder,
                stalePeriod: const Duration(days: AppConstants.cacheDuration),
              ),
            ),
          ),
        ),
        Positioned(
          left: 20.h,
          bottom: 80.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$collectionName ${StringsManager.collectionUpperCase}',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
              ),
              SizedBox(height: 8.h),
              Container(
                width: _getTextWidth(context, collectionName),
                height: 2,
                color: Colors.white,
              ),
              Text(
                '$discount${StringsManager.collectionOff}',
                style: Theme.of(context).textTheme.displayLarge!
                        .copyWith(color: Colors.white),
              ),
              Text(
                StringsManager.collectionSubTitle,
                style: Theme.of(context).textTheme.titleMedium!
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
            buttonTitle: StringsManager.collectionShopButton,
            onTap: onTap,
          ),
        )
      ],
    );
  }

  double _getTextWidth(BuildContext context, String text) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: Theme.of(context).textTheme.titleMedium),
      textDirection: TextDirection.ltr
    )..layout();

    return textPainter.width;
  }
}
