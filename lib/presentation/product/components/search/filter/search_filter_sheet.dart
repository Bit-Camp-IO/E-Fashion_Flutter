import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/presentation/product/bloc/search_bloc/search_bloc.dart';
import 'package:efashion_flutter/presentation/shared/animations/custom_fade_animation.dart';
import 'package:efashion_flutter/presentation/shared/widgets/custom_appbar.dart';
import 'package:efashion_flutter/presentation/shared/widgets/primary_button.dart';
import 'package:efashion_flutter/presentation/product/components/search/filter/category_chips_component.dart';
import 'package:efashion_flutter/presentation/product/components/search/filter/price_slider_component.dart';
import 'package:efashion_flutter/presentation/product/components/search/filter/size_chips_component.dart';
import 'package:efashion_flutter/presentation/product/mock/filter_mock.dart';
import 'package:efashion_flutter/presentation/product/mock/search_mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SearchFilterSheet extends StatefulWidget {
  const SearchFilterSheet({super.key, required this.searchQuery});
  final String searchQuery;
  @override
  State<SearchFilterSheet> createState() => _SearchFilterSheetState();
}

class _SearchFilterSheetState extends State<SearchFilterSheet> {
  final ValueNotifier<SfRangeValues> _sliderRange = ValueNotifier(const SfRangeValues(200, 800));
  late DraggableScrollableController _draggableScrollableController;

  @override
  void initState() {
    _draggableScrollableController = DraggableScrollableController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: _draggableScrollableController,
      initialChildSize: 0.65,
      minChildSize: 0.65,
      expand: true,
      builder: (context, scrollController) => CustomFadeAnimation(
        duration: const Duration(milliseconds: 250),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            ).r,
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 50).r,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomAppBar(
                  appBarTitle: 'Filters',
                  appBarType: AppBarType.normal,
                ),
                Expanded(
                  child: ListView(
                    controller: scrollController,
                    padding: const EdgeInsets.only(top: 30),
                    children: [
                      CategoryChipsComponent(
                        categories: filters,
                        selectedCategories: (listOfCategories) {
                           final categories =  listOfCategories.join(',');
                        },
                      ),
                      SizedBox(height: 24.h),
                      SizeChipsComponent(
                        sizes: filterSizes,
                        selectedSizes: (listOfSizes) {
                         final sizes =  listOfSizes.join(',');
                        },
                      ),
                      SizedBox(height: 24.h),
                      ValueListenableBuilder(
                        valueListenable: _sliderRange,
                        builder: (context, value, child) => PriceSliderComponent(
                          values: value,
                          onChanged: (sliderValues) {
                           _sliderRange.value = sliderValues;
                           String minPrice = sliderValues.start;
                           String maxPrice = sliderValues.end;
                          },
                        ),
                      ),
                      SizedBox(height: 24.h),
                      PrimaryButton(onTap: () {
                        context.read<SearchBloc>().add(SearchForProductsEvent(searchQuery: widget.searchQuery, genders: 2));
                        context.popRoute();
                      }, buttonTitle: 'Apply Filters'),
                      SizedBox(height: 50.h),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _draggableScrollableController.dispose();
    super.dispose();
  }
}
