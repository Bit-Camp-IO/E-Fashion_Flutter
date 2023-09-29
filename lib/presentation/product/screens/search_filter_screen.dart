import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_appbar.dart';
import 'package:efashion_flutter/presentation/shared/widgets/primary_button.dart';
import 'package:efashion_flutter/presentation/product/components/home/search/search_filter/category_chips_component.dart';
import 'package:efashion_flutter/presentation/product/components/home/search/search_filter/color_chips_component.dart';
import 'package:efashion_flutter/presentation/product/components/home/search/search_filter/price_slider_component.dart';
import 'package:efashion_flutter/presentation/product/components/home/search/search_filter/size_chips_component.dart';
import 'package:efashion_flutter/presentation/product/mock/filter_mock.dart';
import 'package:efashion_flutter/presentation/product/mock/search_mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            const CustomAppBar(
              appBarTitle: 'Filters',
              appBarType: AppBarType.normal,
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(top: 30),
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