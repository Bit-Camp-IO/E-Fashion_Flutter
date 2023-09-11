import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/shared/presentation/widgets/animated_switcher_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    super.key,
    required this.appBarTitle,
    required this.appBarType,
    this.onIndexChange,
    this.disableBackButton = false,
  });

  final String appBarTitle;
  final AppBarType appBarType;
  final void Function(int? currentIndex)? onIndexChange;
  final bool disableBackButton;
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  late int switchIndex;

  @override
  void initState() {
    if (widget.appBarType == AppBarType.switcher) {
      switchIndex = 1;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          widget.disableBackButton ? const SizedBox.shrink() :  GestureDetector(
            onTap: () {
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
            widget.appBarTitle,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          const Spacer(
            flex: 1,
          ),
          widget.appBarType == AppBarType.switcher
              ? AnimatedSwitcherButton(
                  onSwitchIndexChanged: (buttonIndex) {
                    setState(() {
                      switchIndex = buttonIndex;
                      widget.onIndexChange!(buttonIndex);
                    });
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
