import 'package:efashion_flutter/core/util/assets_manager.dart';
import 'package:efashion_flutter/core/widgets/secondary_button.dart';
import 'package:efashion_flutter/features/home/presentation/components/notifications/animated_review_icon.dart';
import 'package:efashion_flutter/features/home/presentation/components/shared/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RatingBottomSheet extends StatefulWidget {
  const RatingBottomSheet({super.key});

  @override
  State<RatingBottomSheet> createState() => _RatingBottomSheetState();
}

class _RatingBottomSheetState extends State<RatingBottomSheet> {
  int selectedIconIndex = -1;

  void _handleIconTap(int index) {
    setState(() {
      selectedIconIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.w,
      height: 376.h,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.outlineVariant,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(20).r,
            topRight: const Radius.circular(20).r,
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Column(
          children: [
            Text(
              'Please rate Us',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            SizedBox(height: 22.h),
            CustomRatingBar(
              onRatingUpdate: (value) {},
            ),
            SizedBox(height: 32.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedReviewIcon(
                  isSelected: selectedIconIndex == 0,
                  label: 'Great',
                  svgIconPath: AssetsManager.greatSvgIcon,
                  onTap: () {
                    _handleIconTap(0);
                  },
                ),
                SizedBox(width: 24.w),
                AnimatedReviewIcon(
                  isSelected: selectedIconIndex == 1,
                  label: 'Not Bad',
                  svgIconPath: AssetsManager.notBadSvgIcon,
                  onTap: () {
                    setState(() {
                      _handleIconTap(1);
                    });
                  },
                ),
                SizedBox(width: 24.w),
                AnimatedReviewIcon(
                  isSelected: selectedIconIndex == 2,
                  label: 'Bad',
                  svgIconPath: AssetsManager.badSvgIcon,
                  onTap: () {
                    setState(() {
                      _handleIconTap(2);
                    });
                  },
                )
              ],
            ),
            SizedBox(height: 32.h),
            SecondaryButton(
              width: 100.w,
              height: 42.h,
              buttonTitle: 'Done',
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
