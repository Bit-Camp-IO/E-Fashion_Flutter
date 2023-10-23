import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SectionWidget extends StatelessWidget {
  const SectionWidget({
    super.key,
    required this.sectionTitle,
    this.sectionButtonTitle = 'Discover',
    this.onTextButtonTap,
    this.sectionType = SectionType.normal,
  });

  final String sectionTitle;
  final String sectionButtonTitle;
  final void Function()? onTextButtonTap;
  final SectionType sectionType;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(sectionTitle, style: Theme.of(context).textTheme.bodyMedium),
          Visibility(
            visible: sectionType == SectionType.withTextButton,
            child: TextButton(
              onPressed: onTextButtonTap ?? (){},
              child: Text(
                sectionButtonTitle,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

enum SectionType{
  normal,
  withTextButton;
}