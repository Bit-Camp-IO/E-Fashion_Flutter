import 'package:efashion_flutter/presentation/shared/widgets/dots_loading_indicator.dart';
import 'package:efashion_flutter/shared/util/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondaryButton extends StatelessWidget {
  final double width;
  final double height;
  final String buttonTitle;
  final Color? backgroundColor;
  final Color? titleColor;
  final void Function() onTap;
  final bool isLoading;

  const SecondaryButton({
    super.key,
    required this.width,
    required this.height,
    required this.buttonTitle,
    this.titleColor,
    this.backgroundColor,
    required this.onTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor ?? ColorsManager.secondaryButtonColor,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
            topLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ).r,
        ),
        child: Center(
          child: isLoading == true ? const DotsLoadingIndicator() : Text(buttonTitle,
            style: Theme.of(context).textTheme.labelMedium!
                .copyWith(color: titleColor ?? Colors.white),
          ),
        ),
      ),
    );
  }
}
