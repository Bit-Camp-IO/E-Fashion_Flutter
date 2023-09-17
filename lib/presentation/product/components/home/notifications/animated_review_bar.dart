import 'package:efashion_flutter/core/util/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
class AnimatedReviewBar extends StatefulWidget {
  const AnimatedReviewBar({super.key, required this.selectedIndex});
  final void Function(int selectedIndex) selectedIndex;
  @override
  State<AnimatedReviewBar> createState() => _AnimatedReviewBarState();
}

class _AnimatedReviewBarState extends State<AnimatedReviewBar> {
  int selectedIconIndex = -1;

  void _handleIconTap(int index) {
    if(index != selectedIconIndex){
      setState(() {
        selectedIconIndex = index;
      });
    }else{
      setState(() {
        selectedIconIndex = -1;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedReviewIcon(
          isSelected: selectedIconIndex == 0,
          label: 'Great',
          svgIconPath: AssetsManager.greatSvgIcon,
          onTap: () {
            _handleIconTap(0);
            widget.selectedIndex(selectedIconIndex);
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
              widget.selectedIndex(selectedIconIndex);
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
              widget.selectedIndex(selectedIconIndex);
            });
          },
        )
      ],
    );
  }
}

class AnimatedReviewIcon extends StatelessWidget {
  const AnimatedReviewIcon({
    super.key,
    required this.isSelected,
    required this.svgIconPath,
    required this.label,
    required this.onTap,
  });

  final bool isSelected;
  final String svgIconPath;
  final String label;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: Column(
          key: ValueKey<bool>(isSelected),
          children: [
            SvgPicture.asset(
             svgIconPath,
              colorFilter: ColorFilter.mode(
                isSelected
                    ? const Color(0xFFFFF504)
                    : Theme.of(context).colorScheme.outline,
                BlendMode.srcIn,
              ),
            ),
            SizedBox(height: 5.h),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
