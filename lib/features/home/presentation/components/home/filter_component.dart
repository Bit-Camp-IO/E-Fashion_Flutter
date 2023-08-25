import 'package:efashion_flutter/core/util/colors_manager.dart';
import 'package:efashion_flutter/features/home/presentation/components/home/filter_button.dart';
import 'package:efashion_flutter/features/home/presentation/components/home/section_widget.dart';
import 'package:efashion_flutter/features/home/presentation/components/home/titled_avatar.dart';
import 'package:efashion_flutter/features/home/presentation/mock/filter_mock.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterComponent extends StatefulWidget {
  const FilterComponent({super.key});

  @override
  State<FilterComponent> createState() => _FilterComponentState();
}

class _FilterComponentState extends State<FilterComponent> {
  late final ScrollController _filterController;
  double animatedFilterWidth = 145;
  List selectedFilters = [];
  List selectedGenders = [];

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
      if (animatedFilterWidth != 0) {
        setState(() {
          animatedFilterWidth = 0;
        });
      }
    }
    if (scrollDirection == ScrollDirection.forward &&
        currentScroll < maxScroll * 0.05) {
      if (animatedFilterWidth != 145) {
        setState(() {
          animatedFilterWidth = 145;
        });
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
              FilterButton(
                isExpanded: selectedGenders.isNotEmpty || selectedFilters.isNotEmpty,
                onTap: () {},
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        SizedBox(
          height: 84.h,
          child: ListView(
            scrollDirection: Axis.horizontal,
            controller: _filterController,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16).r,
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeInOut,
                      width: animatedFilterWidth.w,
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
                            children: List.generate(
                              genders.length,
                              (genderIndex) => TitledAvatar(
                                onTap: () {
                                  setState(() {
                                    if (selectedGenders
                                        .contains(genders[genderIndex].name)) {
                                      selectedGenders.removeWhere((element) =>
                                          element == genders[genderIndex].name);
                                    } else {
                                      selectedGenders
                                          .add(genders[genderIndex].name);
                                    }
                                  });
                                },
                                imagePath: genders[genderIndex].picture,
                                title: genders[genderIndex].name,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 14.w),
                    Container(
                      width: 430.w,
                      height: 84.h,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surfaceVariant,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 6.w,
                            height: 42.h,
                            decoration: BoxDecoration(
                              color: ColorsManager.lightPrimaryColor,
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(5),
                                bottomRight: Radius.circular(5),
                              ).r,
                            ),
                          ),
                          SizedBox(
                            width: 420.w,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: List.generate(
                                6,
                                (filterIndex) => TitledAvatar(
                                  onTap: () {
                                    setState(() {
                                      if (selectedFilters.contains(
                                          filters[filterIndex].filterName)) {
                                        selectedFilters.removeWhere((element) =>
                                            element ==
                                            filters[filterIndex].filterName);
                                      } else {
                                        selectedFilters.add(
                                            filters[filterIndex].filterName);
                                      }
                                    });
                                  },
                                  imagePath:
                                      filters[filterIndex].filterImageUrl,
                                  title: filters[filterIndex].filterName,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
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
    super.dispose();
  }
}
