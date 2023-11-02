import 'package:auto_route/auto_route.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/brand.dart';
import 'package:efashion_flutter/components/productComponent/domain/entities/category.dart';
import 'package:efashion_flutter/presentation/product/bloc/search_bloc/search_bloc.dart';
import 'package:efashion_flutter/presentation/product/components/search/filter/brands_chips_component.dart';
import 'package:efashion_flutter/presentation/shared/animations/custom_fade_animation.dart';
import 'package:efashion_flutter/presentation/shared/widgets/primary_button.dart';
import 'package:efashion_flutter/presentation/product/components/search/filter/category_chips_component.dart';
import 'package:efashion_flutter/presentation/product/components/search/filter/price_slider_component.dart';
import 'package:efashion_flutter/shared/util/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class SearchFilterSheet extends StatefulWidget {
  final List<Category> categories;
  final List<Brand> brands;

  const SearchFilterSheet({
    super.key,
    required this.categories,
    required this.brands,
  });

  @override
  State<SearchFilterSheet> createState() => _SearchFilterSheetState();
}

class _SearchFilterSheetState extends State<SearchFilterSheet> {
  final ValueNotifier<SfRangeValues> _sliderRange = ValueNotifier(const SfRangeValues(200, 800));
  late DraggableScrollableController _draggableScrollableController;
  late ScrollController _listViewController;
  String? brands;
  String? categories;
  int minPrice = 200;
  int maxPrice = 800;
  final ValueNotifier<bool> _hasScrolled = ValueNotifier(false);

  void _onScroll() {
    final maxScroll =  _listViewController.position.maxScrollExtent;
    final currentScroll = _listViewController.offset;
    _hasScrolled.value = currentScroll > maxScroll * 0.1;
  }
  @override
  void initState() {
    SearchBloc searchBloc = context.read<SearchBloc>();
    brands = searchBloc.brands;
    categories = searchBloc.categories;
    if (searchBloc.minPrice != null && searchBloc.maxPrice != null) {
      minPrice = searchBloc.minPrice!;
      maxPrice = searchBloc.maxPrice!;
      _sliderRange.value =
          SfRangeValues(searchBloc.minPrice, searchBloc.maxPrice);
    }
    _draggableScrollableController = DraggableScrollableController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: _draggableScrollableController,
      initialChildSize: 0.65,
      minChildSize: 0.65,
      builder: (context, scrollController) {
        _listViewController = scrollController..addListener(_onScroll);
        return CustomFadeAnimation(
          duration: const Duration(milliseconds: 250),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ).r,
            ),
            child: Column(
              children: [
                ValueListenableBuilder(
                  valueListenable: _hasScrolled,
                  builder: (context, value, child) => Visibility(
                    visible: !value,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16.0).r,
                      child: Center(
                        child: Container(
                          width: 40.w,
                          height: 4.h,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onSurface,
                            borderRadius: BorderRadius.circular(10).r,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 36).r,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 16.0).r,
                          child: Center(
                            child: Text(
                              StringsManager.searchFiltersTitle,
                              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView(
                            controller: scrollController,
                            padding: const EdgeInsets.only(top: 20).r,
                            children: [
                              BrandsChipsComponent(
                                brands: widget.brands,
                                selectedBrands: (listOfBrands) {
                                  if (listOfBrands.isNotEmpty) {
                                    brands = listOfBrands.join(',');
                                  } else {
                                    brands = '';
                                  }
                                },
                              ),
                              SizedBox(height: 24.h),
                              CategoryChipsComponent(
                                categories: widget.categories,
                                selectedCategories: (listOfCategories) {
                                  if (listOfCategories.isNotEmpty) {
                                    categories = listOfCategories.join(',');
                                  } else {
                                    categories = '';
                                  }
                                },
                              ),
                              SizedBox(height: 24.h),
                              ValueListenableBuilder(
                                valueListenable: _sliderRange,
                                builder: (context, value, child) =>
                                    PriceSliderComponent(
                                      values: value,
                                      onChanged: (sliderValues) {
                                        _sliderRange.value = sliderValues;
                                        minPrice = sliderValues.start.toInt();
                                        maxPrice = sliderValues.end.toInt();
                                      },
                                    ),
                              ),
                              SizedBox(height: 24.h),
                              PrimaryButton(
                                onTap: () {
                                  context.read<SearchBloc>().add(
                                    FilterSearchProductsEvent(
                                      categories: categories,
                                      brands: brands,
                                      minPrice: minPrice,
                                      maxPrice: maxPrice,
                                    ),
                                  );
                                  context.popRoute();
                                },
                                buttonTitle: StringsManager.applyFiltersButtonTitle,
                              ),
                              SizedBox(height: 50.h),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _hasScrolled.dispose();
    _sliderRange.dispose();
    _listViewController.removeListener(_onScroll);
    _draggableScrollableController.dispose();
    super.dispose();
  }
}
