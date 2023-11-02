import 'package:efashion_flutter/presentation/shared/widgets/primary_button.dart';
import 'package:efashion_flutter/shared/util/assets_manager.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NoInternetConnectionWidget extends StatelessWidget {
  final bool isButtonLoading;
  final void Function() onButtonTap;

  const NoInternetConnectionWidget({
    super.key,
    this.isButtonLoading = false,
    required this.onButtonTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            AssetsManager.wifiImage,
            color: Theme.of(context).colorScheme.primary,
          ),
          SizedBox(height: 24.h),
          Text(
            StringsManager.noInternetTitle,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: 4.h),
          Text(
            textAlign: TextAlign.center,
            StringsManager.noInternetSubTitle,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(height: 74.h),
          PrimaryButton(
            width: 194.w,
            height: 46.h,
            isLoading: isButtonLoading,
            buttonTitle: StringsManager.noInternetTryAgainButton,
            onTap: onButtonTap,
          ),
        ],
      ),
    );
  }
}
