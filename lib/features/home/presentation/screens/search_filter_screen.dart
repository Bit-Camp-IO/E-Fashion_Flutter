import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/core/widgets/primary_button.dart';
import 'package:efashion_flutter/features/home/presentation/components/home/search/search_filter/category_chips_component.dart';
import 'package:efashion_flutter/features/home/presentation/components/home/search/search_filter/color_chips_component.dart';
import 'package:efashion_flutter/features/home/presentation/components/home/search/search_filter/price_slider_component.dart';
import 'package:efashion_flutter/features/home/presentation/components/home/search/search_filter/size_chips_component.dart';
import 'package:efashion_flutter/features/home/presentation/mock/filter_mock.dart';
import 'package:efashion_flutter/features/home/presentation/mock/search_mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

@RoutePage()
class SearchFilterScreen extends StatefulWidget {
  const SearchFilterScreen({super.key});

  @override
  State<SearchFilterScreen> createState() => _SearchFilterScreenState();
}

class _SearchFilterScreenState extends State<SearchFilterScreen> {
  List _selectedCategories = [];
  List _selectedColors = [];
  List _selectedSizes = [];
  SfRangeValues _values = const SfRangeValues(200, 800);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 50).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.popRoute();
                  },
                  icon: const Icon(Iconsax.arrow_left),
                ),
                SizedBox(width: 8.w),
                const Text('Filters'),
              ],
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  CategoryChipsComponent(
                    categories: filters,
                    selectedCategories: (listOfCategories) {
                      setState(() {
                        _selectedCategories = listOfCategories;
                      });
                      debugPrint(_selectedCategories.toString());
                    },
                  ),
                  SizedBox(height: 24.h),
                  ColorChipsComponent(
                    colors: filterColors,
                    selectedColors: (listOfColors) {
                      setState(() {
                        _selectedColors = listOfColors;
                      });
                      debugPrint(_selectedColors.toString());
                    },
                  ),
                  SizedBox(height: 24.h),
                  SizeChipsComponent(
                    sizes: filterSizes,
                    selectedSizes: (listOfSizes) {
                      setState(() {
                        _selectedSizes = listOfSizes;
                      });
                      debugPrint(_selectedSizes.toString());
                    },
                  ),
                  SizedBox(height: 24.h),
                  PriceSliderComponent(
                    values: _values,
                    onChanged: (sliderValues) {
                      setState(() {
                        _values = sliderValues;
                      });
                    },
                  ),
                  SizedBox(height: 24.h),
                  PrimaryButton(onTap: () {}, buttonTitle: 'Apply Filters'),
                  SizedBox(height: 50.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
