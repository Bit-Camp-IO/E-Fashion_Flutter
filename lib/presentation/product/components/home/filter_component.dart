import 'package:efashion_flutter/presentation/product/bloc/home_bloc/home_bloc.dart';
import 'package:efashion_flutter/presentation/product/components/home/filter_button.dart';
import 'package:efashion_flutter/presentation/product/components/home/filters/genders_filter.dart';
import 'package:efashion_flutter/presentation/product/components/home/section_widget.dart';
import 'package:efashion_flutter/presentation/product/components/home/titled_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterComponent extends StatefulWidget {
  const FilterComponent({super.key});

  @override
  State<FilterComponent> createState() => _FilterComponentState();
}

class _FilterComponentState extends State<FilterComponent> {
  late final ScrollController _filterController;
  double animatedGendersWidth = 145;
  List selectedFilters = [];
  ValueNotifier<bool> isApplyButtonActiveNotifier = ValueNotifier<bool>(false);

  @override
  void initState() {
    _filterController = ScrollController()..addListener(_onSwipeListener);
    super.initState();
  }

  void _onSwipeListener() {
    final maxScroll = _filterController.position.maxScrollExtent;
    final currentScroll = _filterController.offset;
    final scrollDirection = _filterController.position.userScrollDirection;
    if (_filterController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (animatedGendersWidth != 0) {
        setState(() {
          animatedGendersWidth = 0;
        });
      }
    }
    if (scrollDirection == ScrollDirection.forward &&
        currentScroll < maxScroll * 0.05) {
      if (animatedGendersWidth != 145) {
        setState(
          () {
            animatedGendersWidth = 145;
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40.h,
          child: Row(
            children: [
              const SectionWidget(
                sectionTitle: 'Filters',
              ),
              const Spacer(flex: 1),
              ValueListenableBuilder(
                valueListenable: isApplyButtonActiveNotifier,
                builder: (context, isApplyButtonActive, child) => FilterButton(
                  isActive: isApplyButtonActive,
                  onTap: () {
                    isApplyButtonActiveNotifier.value = false;
                    final selectedCategories = selectedFilters.join(',');
                    context.read<HomeBloc>()
                      ..add(GetProductOffersEvent(categories: selectedCategories))
                      ..add(GetBrandsProductsEvent(categories: selectedCategories));
                  },
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          height: 84.h,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: _filterController,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16).r,
              child: Row(
                children: [
                  GendersFilter(
                    width: animatedGendersWidth.w,
                    selectedGenders: (genderId) {
                      context
                          .read<HomeBloc>()
                          .add(GetCategoriesEvent(genderId: genderId));
                    },
                  ),
                  SizedBox(width: 14.w),
                  Container(
                    height: 84.h,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surfaceVariant,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ).r,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 6.w,
                          height: 42.h,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ).r,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        BlocBuilder<HomeBloc, HomeState>(
                          buildWhen: (previous, current) =>
                              previous.categories != current.categories,
                          builder: (context, state) {
                            return ListView.builder(
                              itemCount: state.categories.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 10.0).r,
                                  child: TitledAvatar(
                                    onTap: () {
                                      if (selectedFilters.contains(state.categories[index].id)) {
                                        selectedFilters.removeWhere((element) =>
                                            element ==
                                            state.categories[index].id);
                                      } else {
                                        selectedFilters
                                            .add(state.categories[index].id);
                                      }
                                      if(selectedFilters.isNotEmpty){
                                        isApplyButtonActiveNotifier.value = selectedFilters.isNotEmpty;
                                      }else{
                                        isApplyButtonActiveNotifier.value = true;
                                      }
                                    },
                                    imagePath: state.categories[index].imageUrl,
                                    title: state.categories[index].name,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _filterController
      ..dispose()
      ..removeListener(_onSwipeListener);
    isApplyButtonActiveNotifier.dispose();
    super.dispose();
  }
}
