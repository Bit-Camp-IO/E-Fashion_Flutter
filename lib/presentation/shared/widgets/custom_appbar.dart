import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/presentation/shared/widgets/animated_switcher_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CustomAppBar extends StatelessWidget {
  final String appBarTitle;
  final AppBarType appBarType;
  final void Function(int? currentIndex)? onIndexChange;
  final bool disableBackButton;
  final void Function()? onBackTap;
  const CustomAppBar({
    super.key,
    required this.appBarTitle,
    required this.appBarType,
    this.onIndexChange,
    this.disableBackButton = false,
    this.onBackTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          disableBackButton ? const SizedBox.shrink() :  GestureDetector(
            onTap: onBackTap ?? () {
              context.popRoute();
            },
            child: Icon(
              Iconsax.arrow_left,
              color: Theme.of(context).colorScheme.onSurface,
              size: 24.sp,
            ),
          ),
          SizedBox(width: 8.w),
          Text(
            appBarTitle,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          const Spacer(),
          appBarType == AppBarType.switcher
              ? AnimatedSwitcherButton(
                  onSwitchIndexChanged: (buttonIndex) {
                      onIndexChange!(buttonIndex);
                  },
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}

enum AppBarType {
  normal,
  switcher,
}
