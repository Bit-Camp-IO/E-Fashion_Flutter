import 'package:efashion_flutter/shared/constants/app_constants.dart';
import 'package:efashion_flutter/shared/util/assets_manager.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:efashion_flutter/presentation/product/components/home/categories/titled_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GendersCategories extends StatefulWidget {
  const GendersCategories(
      {super.key, required this.width, required this.selectedGenders});

  final double width;
  final void Function(int genderId) selectedGenders;

  @override
  State<GendersCategories> createState() => _GendersCategoriesState();
}

class _GendersCategoriesState extends State<GendersCategories> {
  List selectedGenders = [];

  _handelSelectedGender(int gender) {
    if (selectedGenders.contains(gender)) {
      selectedGenders.remove(gender);
    } else {
      selectedGenders.add(gender);
    }
    if (selectedGenders.length == 1) {
      widget.selectedGenders(
        selectedGenders.first == AppConstants.womenId
            ? AppConstants.womenId
            : AppConstants.menId,
      );
    } else {
      widget.selectedGenders(AppConstants.allGendersId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
      width: widget.width,
      height: 84.h,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ).r,
      ),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: 145.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TitledAvatar(
                imagePath: AssetsManager.womenCategoryImage,
                title: StringsManager.womanCategory,
                titledImageType: TitledImageType.local,
                onTap: () {
                  _handelSelectedGender(AppConstants.womenId);
                },
              ),
              TitledAvatar(
                imagePath: AssetsManager.menCategoryImage,
                title: StringsManager.menCategory,
                titledImageType: TitledImageType.local,
                onTap: () {
                  _handelSelectedGender(AppConstants.menId);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
