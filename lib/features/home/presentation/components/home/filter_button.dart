import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key, required this.isExpanded, required this.onTap});

  final bool isExpanded;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: InkWell(
        key: const Key("visible"),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: isExpanded ? 80.w : 0,
          height: isExpanded ? 40.h : 0,
          decoration: BoxDecoration(
            color: const Color(0xFF526070),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ).r,
          ),
          child: isExpanded
              ? SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: 80.w,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Iconsax.filter,
                            color: Colors.white, size: 16),
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
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
