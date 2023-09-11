import 'package:efashion_flutter/core/util/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomRatingBar extends StatelessWidget {
  const CustomRatingBar({super.key, required this.onRatingUpdate});
  final ValueChanged<double> onRatingUpdate;


  @override
  Widget build(BuildContext context) {
    return RatingBar(
      initialRating: 0,
      minRating: 0,
      direction: Axis.horizontal,
      itemCount: 5,
      allowHalfRating: true,
      glowColor: Theme.of(context).colorScheme.outline,
      itemSize: 35.sp,
      itemPadding: const EdgeInsets.symmetric(horizontal: 12.0).r,
      ratingWidget: RatingWidget(
        full: const Icon(
          Icons.star,
          color: ColorsManager.ratingStarColor,
        ),
        half: const Icon(
          Icons.star_half,
          color: ColorsManager.ratingStarColor,
        ),
        empty: Icon(
          Icons.star_border,
          color: Theme.of(context).colorScheme.outline,
        ),
      ),
      onRatingUpdate: onRatingUpdate,
    );
  }
}
