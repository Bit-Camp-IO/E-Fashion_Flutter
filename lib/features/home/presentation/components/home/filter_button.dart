import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    required this.isVisible,
    required this.onTap
  });

  final bool isVisible;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.easeIn,
      switchOutCurve: Curves.easeOut,
      child: isVisible
          ? Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: InkWell(
                key: const Key("visible"),
                onTap: onTap,
                child: Container(
                  width: 80.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFF526070),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ).r,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Iconsax.filter, color: Colors.white, size: 16),
                      Text(
                        'Apply',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : const SizedBox.shrink(
              key: Key("hidden"),
            ),
    );
  }
}
