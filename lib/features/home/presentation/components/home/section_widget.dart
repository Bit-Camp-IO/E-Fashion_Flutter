import 'package:efashion_flutter/core/util/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({
    super.key,
    required this.sectionTitle,
    this.sectionButtonTitle,
    this.onTextButtonTap,
    this.enableTextButton = false,
  });

  final String sectionTitle;
  final String? sectionButtonTitle;
  final void Function()? onTextButtonTap;
  final bool? enableTextButton;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(sectionTitle, style: Theme.of(context).textTheme.bodyMedium),
          Visibility(
            visible: enableTextButton!,
            child: TextButton(
              onPressed: onTextButtonTap ?? (){},
              child: Text(
                sectionButtonTitle ?? 'See All',
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: ColorsManager.lightPrimaryColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}