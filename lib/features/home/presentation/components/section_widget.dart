import 'package:efashion_flutter/core/util/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({
    super.key,
    required this.sectionTitle,
    required this.sectionButtonTitle,
    required this.onTap,
  });

  final String sectionTitle;
  final String sectionButtonTitle;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(sectionTitle, style: Theme.of(context).textTheme.bodyMedium),
          TextButton(
            onPressed: onTap,
            child: Text(
              sectionButtonTitle,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: ColorsManager.lightPrimaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}